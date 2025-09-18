import 'package:isar/isar.dart';
import '../../domain/entities/social_models.dart';
import '../../domain/entities/clothing_item.dart';
import '../datasources/local_database.dart';
import 'social_repository.dart';

class SocialRepositoryImpl implements SocialRepository {
  late Isar _isar;

  SocialRepositoryImpl() {
    _initDatabase();
  }

  void _initDatabase() async {
    _isar = await LocalDatabase.isar;
  }

  @override
  Future<String> shareOutfit(SharedOutfit outfit) async {
    await _isar.writeTxn(() async {
      await _isar.sharedOutfits.put(outfit);
    });
    return outfit.id.toString();
  }

  @override
  Future<List<SharedOutfit>> getCommunityFeed({
    String? userId,
    CommunityFilters filters = const CommunityFilters(),
    int page = 0,
    int limit = 20,
  }) async {
    var query = _isar.sharedOutfits
        .filter()
        .isPublicEqualTo(true);

    // Apply filters
    if (filters.searchQuery.isNotEmpty) {
      query = query.and()
          .group((q) => q
              .titleContains(filters.searchQuery, caseSensitive: false)
              .or()
              .descriptionContains(filters.searchQuery, caseSensitive: false));
    }

    if (filters.tags.isNotEmpty) {
      for (final tag in filters.tags) {
        query = query.tagsElementContains(tag);
      }
    }

    if (filters.season != null) {
      query = query.and().seasonEqualTo(filters.season);
    }

    if (filters.occasion != null && filters.occasion!.isNotEmpty) {
      query = query.and().occasionContains(filters.occasion!);
    }

    // Apply sorting
    switch (filters.sortBy) {
      case SortBy.newest:
        return await query
            .sortBySharedAtDesc()
            .offset(page * limit)
            .limit(limit)
            .findAll();
      case SortBy.popular:
      case SortBy.trending:
        return await query
            .sortByLikesCountDesc()
            .thenByCommentsCountDesc()
            .offset(page * limit)
            .limit(limit)
            .findAll();
      case SortBy.mostLiked:
        return await query
            .sortByLikesCountDesc()
            .offset(page * limit)
            .limit(limit)
            .findAll();
      case SortBy.mostCommented:
        return await query
            .sortByCommentsCountDesc()
            .offset(page * limit)
            .limit(limit)
            .findAll();
    }
  }

  @override
  Future<List<SharedOutfit>> getUserSharedOutfits(
    String userId, {
    int page = 0,
    int limit = 20,
  }) async {
    return await _isar.sharedOutfits
        .filter()
        .sharedByUserIdEqualTo(userId)
        .sortBySharedAtDesc()
        .offset(page * limit)
        .limit(limit)
        .findAll();
  }

  @override
  Future<SharedOutfit?> getSharedOutfit(String id) async {
    final numericId = int.tryParse(id);
    if (numericId == null) return null;
    return await _isar.sharedOutfits.get(numericId);
  }

  @override
  Future<void> deleteSharedOutfit(String id) async {
    final numericId = int.tryParse(id);
    if (numericId == null) return;

    await _isar.writeTxn(() async {
      await _isar.sharedOutfits.delete(numericId);
      
      // Also delete related likes and comments
      await _isar.outfitLikes
          .filter()
          .sharedOutfitIdEqualTo(id)
          .deleteAll();
      
      await _isar.outfitComments
          .filter()
          .sharedOutfitIdEqualTo(id)
          .deleteAll();
    });
  }

  @override
  Future<void> addLike(OutfitLike like) async {
    await _isar.writeTxn(() async {
      await _isar.outfitLikes.put(like);
    });
  }

  @override
  Future<void> removeLike(String likeId) async {
    final numericId = int.tryParse(likeId);
    if (numericId == null) return;

    await _isar.writeTxn(() async {
      await _isar.outfitLikes.delete(numericId);
    });
  }

  @override
  Future<OutfitLike?> getUserLike(String sharedOutfitId, String userId) async {
    return await _isar.outfitLikes
        .filter()
        .sharedOutfitIdEqualTo(sharedOutfitId)
        .and()
        .userIdEqualTo(userId)
        .findFirst();
  }

  @override
  Future<void> incrementLikesCount(String sharedOutfitId) async {
    final numericId = int.tryParse(sharedOutfitId);
    if (numericId == null) return;

    await _isar.writeTxn(() async {
      final outfit = await _isar.sharedOutfits.get(numericId);
      if (outfit != null) {
        outfit.likesCount++;
        await _isar.sharedOutfits.put(outfit);
      }
    });
  }

  @override
  Future<void> decrementLikesCount(String sharedOutfitId) async {
    final numericId = int.tryParse(sharedOutfitId);
    if (numericId == null) return;

    await _isar.writeTxn(() async {
      final outfit = await _isar.sharedOutfits.get(numericId);
      if (outfit != null) {
        outfit.likesCount = (outfit.likesCount - 1).clamp(0, double.infinity).toInt();
        await _isar.sharedOutfits.put(outfit);
      }
    });
  }

  @override
  Future<void> addComment(OutfitComment comment) async {
    await _isar.writeTxn(() async {
      await _isar.outfitComments.put(comment);
    });
  }

  @override
  Future<void> removeComment(String commentId) async {
    final numericId = int.tryParse(commentId);
    if (numericId == null) return;

    await _isar.writeTxn(() async {
      await _isar.outfitComments.delete(numericId);
    });
  }

  @override
  Future<List<OutfitComment>> getOutfitComments(
    String sharedOutfitId, {
    int page = 0,
    int limit = 20,
  }) async {
    return await _isar.outfitComments
        .filter()
        .sharedOutfitIdEqualTo(sharedOutfitId)
        .and()
        .isDeletedEqualTo(false)
        .sortByCommentedAtDesc()
        .offset(page * limit)
        .limit(limit)
        .findAll();
  }

  @override
  Future<void> incrementCommentsCount(String sharedOutfitId) async {
    final numericId = int.tryParse(sharedOutfitId);
    if (numericId == null) return;

    await _isar.writeTxn(() async {
      final outfit = await _isar.sharedOutfits.get(numericId);
      if (outfit != null) {
        outfit.commentsCount++;
        await _isar.sharedOutfits.put(outfit);
      }
    });
  }

  @override
  Future<void> incrementRepliesCount(String commentId) async {
    final numericId = int.tryParse(commentId);
    if (numericId == null) return;

    await _isar.writeTxn(() async {
      final comment = await _isar.outfitComments.get(numericId);
      if (comment != null) {
        comment.repliesCount++;
        await _isar.outfitComments.put(comment);
      }
    });
  }

  @override
  Future<void> addFollow(UserFollow follow) async {
    await _isar.writeTxn(() async {
      await _isar.userFollows.put(follow);
    });
  }

  @override
  Future<void> removeFollow(String followId) async {
    final numericId = int.tryParse(followId);
    if (numericId == null) return;

    await _isar.writeTxn(() async {
      await _isar.userFollows.delete(numericId);
    });
  }

  @override
  Future<UserFollow?> getUserFollow(String followerId, String followingId) async {
    return await _isar.userFollows
        .filter()
        .followerIdEqualTo(followerId)
        .and()
        .followingIdEqualTo(followingId)
        .findFirst();
  }

  @override
  Future<List<UserProfile>> getFollowers(String userId, {int page = 0, int limit = 20}) async {
    final follows = await _isar.userFollows
        .filter()
        .followingIdEqualTo(userId)
        .offset(page * limit)
        .limit(limit)
        .findAll();

    final followerIds = follows.map((f) => f.followerId).toList();
    final followers = <UserProfile>[];

    for (final followerId in followerIds) {
      final profile = await getUserProfile(followerId);
      if (profile != null) {
        followers.add(profile);
      }
    }

    return followers;
  }

  @override
  Future<List<UserProfile>> getFollowing(String userId, {int page = 0, int limit = 20}) async {
    final follows = await _isar.userFollows
        .filter()
        .followerIdEqualTo(userId)
        .offset(page * limit)
        .limit(limit)
        .findAll();

    final followingIds = follows.map((f) => f.followingId).toList();
    final following = <UserProfile>[];

    for (final followingId in followingIds) {
      final profile = await getUserProfile(followingId);
      if (profile != null) {
        following.add(profile);
      }
    }

    return following;
  }

  @override
  Future<void> incrementFollowersCount(String userId) async {
    await _updateUserCount(userId, (profile) => profile.followersCount++);
  }

  @override
  Future<void> decrementFollowersCount(String userId) async {
    await _updateUserCount(userId, (profile) => profile.followersCount = (profile.followersCount - 1).clamp(0, double.infinity).toInt());
  }

  @override
  Future<void> incrementFollowingCount(String userId) async {
    await _updateUserCount(userId, (profile) => profile.followingCount++);
  }

  @override
  Future<void> decrementFollowingCount(String userId) async {
    await _updateUserCount(userId, (profile) => profile.followingCount = (profile.followingCount - 1).clamp(0, double.infinity).toInt());
  }

  @override
  Future<void> saveStyleInspiration(StyleInspiration inspiration) async {
    await _isar.writeTxn(() async {
      await _isar.styleInspirations.put(inspiration);
    });
  }

  @override
  Future<List<StyleInspiration>> getStyleInspirations({
    String? userId,
    List<String> tags = const [],
    Season? season,
    int page = 0,
    int limit = 20,
  }) async {
    List<StyleInspiration> allResults;

    if (userId != null) {
      allResults = await _isar.styleInspirations.filter().userIdEqualTo(userId).findAll();
    } else {
      allResults = await _isar.styleInspirations.where().findAll();
    }

    // Apply additional filters in memory
    if (tags.isNotEmpty) {
      allResults = allResults.where((item) {
        return tags.any((tag) => item.tags.contains(tag));
      }).toList();
    }

    if (season != null) {
      allResults = allResults.where((item) => item.season == season).toList();
    }

    // Sort by createdAt in descending order
    allResults.sort((a, b) => b.createdAt.compareTo(a.createdAt));

    // Apply pagination
    final startIndex = page * limit;
    final endIndex = (startIndex + limit).clamp(0, allResults.length);
    final results = startIndex < allResults.length
        ? allResults.sublist(startIndex, endIndex)
        : <StyleInspiration>[];

    return results;
  }

  @override
  Future<void> deleteStyleInspiration(String id) async {
    final numericId = int.tryParse(id);
    if (numericId == null) return;

    await _isar.writeTxn(() async {
      await _isar.styleInspirations.delete(numericId);
    });
  }

  @override
  Future<List<CommunityChallenge>> getActiveChallenges() async {
    final now = DateTime.now();
    return await _isar.communityChallenges
        .filter()
        .isActiveEqualTo(true)
        .and()
        .startDateLessThan(now)
        .and()
        .endDateGreaterThan(now)
        .sortByIsFeaturedDesc()
        .thenByStartDateDesc()
        .findAll();
  }

  @override
  Future<List<CommunityChallenge>> getAllChallenges({int page = 0, int limit = 20}) async {
    return await _isar.communityChallenges
        .where()
        .sortByStartDateDesc()
        .offset(page * limit)
        .limit(limit)
        .findAll();
  }

  @override
  Future<void> addChallengeParticipation(ChallengeParticipation participation) async {
    await _isar.writeTxn(() async {
      await _isar.challengeParticipations.put(participation);
    });
  }

  @override
  Future<List<ChallengeParticipation>> getChallengeParticipants(
    String challengeId, {
    int page = 0,
    int limit = 20,
  }) async {
    return await _isar.challengeParticipations
        .filter()
        .challengeIdEqualTo(challengeId)
        .sortByVotesReceivedDesc()
        .thenBySubmittedAtDesc()
        .offset(page * limit)
        .limit(limit)
        .findAll();
  }

  @override
  Future<void> incrementChallengeParticipation(String challengeId) async {
    final numericId = int.tryParse(challengeId);
    if (numericId == null) return;

    await _isar.writeTxn(() async {
      final challenge = await _isar.communityChallenges.get(numericId);
      if (challenge != null) {
        challenge.participantsCount++;
        await _isar.communityChallenges.put(challenge);
      }
    });
  }

  @override
  Future<void> addSocialActivity(SocialActivity activity) async {
    await _isar.writeTxn(() async {
      await _isar.socialActivitys.put(activity);
    });
  }

  @override
  Future<List<SocialActivity>> getSocialActivities({
    String? userId,
    int page = 0,
    int limit = 50,
  }) async {
    List<SocialActivity> allResults;

    if (userId != null) {
      allResults = await _isar.socialActivitys.filter().userIdEqualTo(userId).findAll();
    } else {
      allResults = await _isar.socialActivitys.where().findAll();
    }

    // Sort by createdAt in descending order
    allResults.sort((a, b) => b.createdAt.compareTo(a.createdAt));

    // Apply pagination
    final startIndex = page * limit;
    final endIndex = (startIndex + limit).clamp(0, allResults.length);
    final results = startIndex < allResults.length
        ? allResults.sublist(startIndex, endIndex)
        : <SocialActivity>[];

    return results;
  }

  @override
  Future<void> markActivitiesAsRead(List<String> activityIds) async {
    await _isar.writeTxn(() async {
      for (final activityId in activityIds) {
        final numericId = int.tryParse(activityId);
        if (numericId != null) {
          final activity = await _isar.socialActivitys.get(numericId);
          if (activity != null) {
            activity.isRead = true;
            await _isar.socialActivitys.put(activity);
          }
        }
      }
    });
  }

  @override
  Future<UserProfile?> getUserProfile(String userId) async {
    return await _isar.userProfiles
        .filter()
        .usernameEqualTo(userId)
        .findFirst();
  }

  @override
  Future<void> updateUserProfile(UserProfile profile) async {
    await _isar.writeTxn(() async {
      await _isar.userProfiles.put(profile);
    });
  }

  @override
  Future<List<UserProfile>> searchUsers(String query, {int page = 0, int limit = 20}) async {
    return await _isar.userProfiles
        .filter()
        .group((q) => q
            .usernameContains(query, caseSensitive: false)
            .or()
            .displayNameContains(query, caseSensitive: false))
        .offset(page * limit)
        .limit(limit)
        .findAll();
  }

  // Helper method for updating user counts
  Future<void> _updateUserCount(String userId, void Function(UserProfile) updateFn) async {
    await _isar.writeTxn(() async {
      final profile = await getUserProfile(userId);
      if (profile != null) {
        updateFn(profile);
        await _isar.userProfiles.put(profile);
      }
    });
  }
}