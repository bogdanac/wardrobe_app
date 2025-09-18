import 'dart:io';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as img;
import '../../domain/entities/social_models.dart';
import '../../domain/entities/outfit.dart';
import '../../domain/entities/clothing_item.dart';
import '../../data/repositories/social_repository.dart';

class SocialService {
  final SocialRepository _repository;

  SocialService(this._repository);

  // Outfit Sharing
  Future<String> shareOutfitToSocial(
    Outfit outfit,
    SocialShareOptions options,
  ) async {
    try {
      final sharedOutfit = SharedOutfit()
        ..outfitId = outfit.id
        ..sharedByUserId = 'current_user' // TODO: Get from auth service
        ..title = options.title
        ..description = options.description
        ..sharedAt = DateTime.now()
        ..tags = options.tags
        ..occasion = options.occasion
        ..season = outfit.season
        ..weatherRanges = outfit.weatherRanges
        ..isPublic = options.isPublic
        ..allowComments = options.allowComments;

      final sharedId = await _repository.shareOutfit(sharedOutfit);
      
      // Update user stats
      await _incrementUserStat('current_user', 'outfitsShared');
      
      return sharedId;
    } catch (e) {
      throw Exception('Failed to share outfit: $e');
    }
  }

  // External Sharing (Instagram, Twitter, etc.)
  Future<void> shareOutfitExternal(
    Outfit outfit,
    List<ClothingItem> items, {
    String? customMessage,
  }) async {
    try {
      // Create a shareable image collage
      final imageFile = await _createOutfitCollage(items);
      
      final message = customMessage ?? 
          'Check out my outfit! ${outfit.name}\n\n'
          '${outfit.clothingItemIds.length} pieces perfectly styled ✨\n'
          '#OOTD #Fashion #Style #WardrobeApp';

      await Share.shareXFiles(
        [XFile(imageFile.path)],
        text: message,
        subject: 'My Outfit - ${outfit.name}',
      );
    } catch (e) {
      throw Exception('Failed to share outfit externally: $e');
    }
  }

  // Social Interactions
  Future<void> likeOutfit(String sharedOutfitId, String userId) async {
    try {
      final existingLike = await _repository.getUserLike(sharedOutfitId, userId);
      
      if (existingLike != null) {
        // Unlike
        await _repository.removeLike(existingLike.id.toString());
        await _repository.decrementLikesCount(sharedOutfitId);
      } else {
        // Like
        final like = OutfitLike()
          ..sharedOutfitId = sharedOutfitId
          ..userId = userId
          ..likedAt = DateTime.now()
          ..uniqueKey = '${sharedOutfitId}_$userId';
        
        await _repository.addLike(like);
        await _repository.incrementLikesCount(sharedOutfitId);
        
        // Create activity
        await _createSocialActivity(
          userId: userId,
          type: SocialActivityType.outfitLiked,
          title: 'Liked an outfit',
          relatedOutfitId: sharedOutfitId,
        );
      }
    } catch (e) {
      throw Exception('Failed to toggle like: $e');
    }
  }

  Future<void> commentOnOutfit(
    String sharedOutfitId,
    String userId,
    String comment, {
    String? parentCommentId,
  }) async {
    try {
      final outfitComment = OutfitComment()
        ..sharedOutfitId = sharedOutfitId
        ..userId = userId
        ..comment = comment
        ..commentedAt = DateTime.now()
        ..parentCommentId = parentCommentId;

      await _repository.addComment(outfitComment);
      await _repository.incrementCommentsCount(sharedOutfitId);
      
      // If it's a reply, increment parent comment replies count
      if (parentCommentId != null) {
        await _repository.incrementRepliesCount(parentCommentId);
      }
      
      // Create activity
      await _createSocialActivity(
        userId: userId,
        type: SocialActivityType.outfitCommented,
        title: 'Commented on an outfit',
        description: comment.length > 50 ? '${comment.substring(0, 50)}...' : comment,
        relatedOutfitId: sharedOutfitId,
      );
    } catch (e) {
      throw Exception('Failed to add comment: $e');
    }
  }

  // User Following
  Future<void> followUser(String followerId, String followingId) async {
    try {
      final existingFollow = await _repository.getUserFollow(followerId, followingId);
      
      if (existingFollow != null) {
        // Unfollow
        await _repository.removeFollow(existingFollow.id.toString());
        await _repository.decrementFollowersCount(followingId);
        await _repository.decrementFollowingCount(followerId);
      } else {
        // Follow
        final follow = UserFollow()
          ..followerId = followerId
          ..followingId = followingId
          ..followedAt = DateTime.now()
          ..uniqueKey = '${followerId}_$followingId';
        
        await _repository.addFollow(follow);
        await _repository.incrementFollowersCount(followingId);
        await _repository.incrementFollowingCount(followerId);
        
        // Create activity
        await _createSocialActivity(
          userId: followerId,
          type: SocialActivityType.userFollowed,
          title: 'Started following someone',
          relatedUserId: followingId,
        );
      }
    } catch (e) {
      throw Exception('Failed to toggle follow: $e');
    }
  }

  // Community Feed
  Future<List<SharedOutfit>> getCommunityFeed({
    String? userId,
    CommunityFilters filters = const CommunityFilters(),
    int page = 0,
    int limit = 20,
  }) async {
    try {
      return await _repository.getCommunityFeed(
        userId: userId,
        filters: filters,
        page: page,
        limit: limit,
      );
    } catch (e) {
      throw Exception('Failed to load community feed: $e');
    }
  }

  Future<List<SharedOutfit>> getUserSharedOutfits(
    String userId, {
    int page = 0,
    int limit = 20,
  }) async {
    try {
      return await _repository.getUserSharedOutfits(userId, page: page, limit: limit);
    } catch (e) {
      throw Exception('Failed to load user outfits: $e');
    }
  }

  // Style Inspiration
  Future<void> saveStyleInspiration({
    required String userId,
    required String title,
    String? description,
    String? imageUrl,
    String? sourceUrl,
    List<String> tags = const [],
    List<String> colors = const [],
    String? style,
    Season? season,
  }) async {
    try {
      final inspiration = StyleInspiration()
        ..userId = userId
        ..title = title
        ..description = description
        ..imageUrl = imageUrl
        ..sourceUrl = sourceUrl
        ..createdAt = DateTime.now()
        ..tags = tags
        ..colors = colors
        ..style = style
        ..season = season;

      await _repository.saveStyleInspiration(inspiration);
      
      // Create activity
      await _createSocialActivity(
        userId: userId,
        type: SocialActivityType.inspirationSaved,
        title: 'Saved style inspiration',
        description: title,
      );
    } catch (e) {
      throw Exception('Failed to save inspiration: $e');
    }
  }

  Future<List<StyleInspiration>> getStyleInspirations({
    String? userId,
    List<String> tags = const [],
    Season? season,
    int page = 0,
    int limit = 20,
  }) async {
    try {
      return await _repository.getStyleInspirations(
        userId: userId,
        tags: tags,
        season: season,
        page: page,
        limit: limit,
      );
    } catch (e) {
      throw Exception('Failed to load inspirations: $e');
    }
  }

  // Community Challenges
  Future<List<CommunityChallenge>> getActiveChallenges() async {
    try {
      return await _repository.getActiveChallenges();
    } catch (e) {
      throw Exception('Failed to load challenges: $e');
    }
  }

  Future<void> participateInChallenge({
    required String challengeId,
    required String userId,
    required String outfitId,
    String? participantNote,
  }) async {
    try {
      final participation = ChallengeParticipation()
        ..challengeId = challengeId
        ..userId = userId
        ..outfitId = outfitId
        ..submittedAt = DateTime.now()
        ..participantNote = participantNote;

      await _repository.addChallengeParticipation(participation);
      await _repository.incrementChallengeParticipation(challengeId);
      
      // Create activity
      await _createSocialActivity(
        userId: userId,
        type: SocialActivityType.achievementUnlocked,
        title: 'Participated in a challenge',
        description: participantNote,
        relatedOutfitId: outfitId,
      );
    } catch (e) {
      throw Exception('Failed to participate in challenge: $e');
    }
  }

  // Social Activities & Notifications
  Future<List<SocialActivity>> getSocialActivities({
    String? userId,
    int page = 0,
    int limit = 50,
  }) async {
    try {
      return await _repository.getSocialActivities(
        userId: userId,
        page: page,
        limit: limit,
      );
    } catch (e) {
      throw Exception('Failed to load activities: $e');
    }
  }

  Future<void> markActivitiesAsRead(List<String> activityIds) async {
    try {
      await _repository.markActivitiesAsRead(activityIds);
    } catch (e) {
      throw Exception('Failed to mark activities as read: $e');
    }
  }

  // User Profile Management
  Future<UserProfile?> getUserProfile(String userId) async {
    try {
      return await _repository.getUserProfile(userId);
    } catch (e) {
      throw Exception('Failed to load user profile: $e');
    }
  }

  Future<void> updateUserProfile(UserProfile profile) async {
    try {
      profile.lastActiveAt = DateTime.now();
      await _repository.updateUserProfile(profile);
    } catch (e) {
      throw Exception('Failed to update user profile: $e');
    }
  }

  // Helper Methods
  Future<File> _createOutfitCollage(List<ClothingItem> items) async {
    try {
      const int collageSize = 800;
      final collage = img.Image(width: collageSize, height: collageSize);
      img.fill(collage, color: img.ColorRgb8(255, 255, 255));
      
      final int itemsPerRow = (items.length <= 4) ? 2 : 3;
      final int itemSize = collageSize ~/ itemsPerRow;
      
      for (int i = 0; i < items.length && i < 9; i++) {
        final item = items[i];
        if (item.imagePath != null) {
          try {
            final itemImage = img.decodeImage(File(item.imagePath!).readAsBytesSync());
            if (itemImage != null) {
              final resizedImage = img.copyResize(itemImage, width: itemSize, height: itemSize);
              final x = (i % itemsPerRow) * itemSize;
              final y = (i ~/ itemsPerRow) * itemSize;
              // img.copyInto(collage, resizedImage, dstX: x, dstY: y); // Function not available
              img.compositeImage(collage, resizedImage, dstX: x, dstY: y);
            }
          } catch (e) {
            // Skip items with invalid images
            continue;
          }
        }
      }
      
      final tempDir = await getTemporaryDirectory();
      final collageFile = File('${tempDir.path}/outfit_collage_${DateTime.now().millisecondsSinceEpoch}.png');
      await collageFile.writeAsBytes(img.encodePng(collage));
      
      return collageFile;
    } catch (e) {
      throw Exception('Failed to create outfit collage: $e');
    }
  }

  Future<void> _createSocialActivity({
    required String userId,
    required SocialActivityType type,
    required String title,
    String? description,
    String? relatedOutfitId,
    String? relatedUserId,
    String? relatedCommentId,
  }) async {
    final activity = SocialActivity()
      ..userId = userId
      ..type = type
      ..title = title
      ..description = description
      ..createdAt = DateTime.now()
      ..relatedOutfitId = relatedOutfitId
      ..relatedUserId = relatedUserId
      ..relatedCommentId = relatedCommentId;

    await _repository.addSocialActivity(activity);
  }

  Future<void> _incrementUserStat(String userId, String statType) async {
    // This would increment specific user statistics
    // Implementation depends on your user statistics structure
  }
}