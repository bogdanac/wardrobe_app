import '../../domain/entities/social_models.dart';
import '../../domain/entities/clothing_item.dart';

abstract class SocialRepository {
  // Outfit Sharing
  Future<String> shareOutfit(SharedOutfit outfit);
  Future<List<SharedOutfit>> getCommunityFeed({
    String? userId,
    CommunityFilters filters = const CommunityFilters(),
    int page = 0,
    int limit = 20,
  });
  Future<List<SharedOutfit>> getUserSharedOutfits(
    String userId, {
    int page = 0,
    int limit = 20,
  });
  Future<SharedOutfit?> getSharedOutfit(String id);
  Future<void> deleteSharedOutfit(String id);

  // Social Interactions
  Future<void> addLike(OutfitLike like);
  Future<void> removeLike(String likeId);
  Future<OutfitLike?> getUserLike(String sharedOutfitId, String userId);
  Future<void> incrementLikesCount(String sharedOutfitId);
  Future<void> decrementLikesCount(String sharedOutfitId);

  Future<void> addComment(OutfitComment comment);
  Future<void> removeComment(String commentId);
  Future<List<OutfitComment>> getOutfitComments(
    String sharedOutfitId, {
    int page = 0,
    int limit = 20,
  });
  Future<void> incrementCommentsCount(String sharedOutfitId);
  Future<void> incrementRepliesCount(String commentId);

  // User Following
  Future<void> addFollow(UserFollow follow);
  Future<void> removeFollow(String followId);
  Future<UserFollow?> getUserFollow(String followerId, String followingId);
  Future<List<UserProfile>> getFollowers(String userId, {int page = 0, int limit = 20});
  Future<List<UserProfile>> getFollowing(String userId, {int page = 0, int limit = 20});
  Future<void> incrementFollowersCount(String userId);
  Future<void> decrementFollowersCount(String userId);
  Future<void> incrementFollowingCount(String userId);
  Future<void> decrementFollowingCount(String userId);

  // Style Inspiration
  Future<void> saveStyleInspiration(StyleInspiration inspiration);
  Future<List<StyleInspiration>> getStyleInspirations({
    String? userId,
    List<String> tags = const [],
    Season? season,
    int page = 0,
    int limit = 20,
  });
  Future<void> deleteStyleInspiration(String id);

  // Community Challenges
  Future<List<CommunityChallenge>> getActiveChallenges();
  Future<List<CommunityChallenge>> getAllChallenges({int page = 0, int limit = 20});
  Future<void> addChallengeParticipation(ChallengeParticipation participation);
  Future<List<ChallengeParticipation>> getChallengeParticipants(
    String challengeId, {
    int page = 0,
    int limit = 20,
  });
  Future<void> incrementChallengeParticipation(String challengeId);

  // Social Activities
  Future<void> addSocialActivity(SocialActivity activity);
  Future<List<SocialActivity>> getSocialActivities({
    String? userId,
    int page = 0,
    int limit = 50,
  });
  Future<void> markActivitiesAsRead(List<String> activityIds);

  // User Profiles
  Future<UserProfile?> getUserProfile(String userId);
  Future<void> updateUserProfile(UserProfile profile);
  Future<List<UserProfile>> searchUsers(String query, {int page = 0, int limit = 20});
}