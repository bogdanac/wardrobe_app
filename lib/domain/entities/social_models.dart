import 'package:isar/isar.dart';
import 'clothing_item.dart';

part 'social_models.g.dart';

@collection
class UserProfile {
  Id id = Isar.autoIncrement;

  @Index()
  late String username;
  
  String? displayName;
  String? bio;
  String? avatarPath;
  String? location;
  
  @Index()
  late DateTime createdAt;
  
  late DateTime lastActiveAt;
  
  // Privacy settings
  bool isPrivate = false;
  bool allowOutfitSharing = true;
  bool allowFollowers = true;
  
  // Stats
  int followersCount = 0;
  int followingCount = 0;
  int outfitsShared = 0;
  int likesReceived = 0;
}

@collection
class SharedOutfit {
  Id id = Isar.autoIncrement;
  
  @Index()
  late String outfitId;
  
  @Index()
  late String sharedByUserId;
  
  late String title;
  String? description;
  
  @Index()
  late DateTime sharedAt;
  
  // Engagement
  int likesCount = 0;
  int commentsCount = 0;
  int sharesCount = 0;
  
  // Metadata
  List<String> tags = [];
  String? occasion;
  @Enumerated(EnumType.name)
  Season? season;
  @Enumerated(EnumType.name)
  List<WeatherRange> weatherRanges = [];
  
  // Privacy
  bool isPublic = true;
  bool allowComments = true;
  
  SharedOutfit();
}

@collection
class OutfitLike {
  Id id = Isar.autoIncrement;
  
  @Index()
  late String sharedOutfitId;
  
  @Index()
  late String userId;
  
  late DateTime likedAt;
  
  @Index(composite: [CompositeIndex('userId')])
  late String uniqueKey; // sharedOutfitId_userId for uniqueness
}

@collection
class OutfitComment {
  Id id = Isar.autoIncrement;
  
  @Index()
  late String sharedOutfitId;
  
  @Index()
  late String userId;
  
  late String comment;
  late DateTime commentedAt;
  
  // For replies
  String? parentCommentId;
  int repliesCount = 0;
  
  // Moderation
  bool isDeleted = false;
  bool isReported = false;
}

@collection
class UserFollow {
  Id id = Isar.autoIncrement;
  
  @Index()
  late String followerId;
  
  @Index()
  late String followingId;
  
  late DateTime followedAt;
  
  @Index(composite: [CompositeIndex('followingId')])
  late String uniqueKey; // followerId_followingId for uniqueness
}

@collection
class StyleInspiration {
  Id id = Isar.autoIncrement;
  
  @Index()
  late String userId;
  
  late String title;
  String? description;
  String? imageUrl;
  String? sourceUrl;
  
  @Index()
  late DateTime createdAt;
  
  List<String> tags = [];
  List<String> colors = [];
  String? style;
  @Enumerated(EnumType.name)
  Season? season;
  
  // Engagement
  int likesCount = 0;
  bool isBookmarked = false;
}

enum SocialActivityType {
  outfitShared,
  outfitLiked,
  outfitCommented,
  userFollowed,
  inspirationSaved,
  achievementUnlocked,
}

@collection
class SocialActivity {
  Id id = Isar.autoIncrement;
  
  @Index()
  late String userId;
  
  @Enumerated(EnumType.name)
  late SocialActivityType type;
  
  late String title;
  String? description;
  
  @Index()
  late DateTime createdAt;
  
  // Related entities
  String? relatedOutfitId;
  String? relatedUserId;
  String? relatedCommentId;
  
  bool isRead = false;
}

@collection
class CommunityChallenge {
  Id id = Isar.autoIncrement;
  
  late String title;
  late String description;
  String? imageUrl;
  
  @Index()
  late DateTime startDate;
  
  @Index()
  late DateTime endDate;
  
  // Challenge criteria
  List<String> requiredTags = [];
  List<String> requiredColors = [];
  @Enumerated(EnumType.name)
  Season? season;
  String? theme;
  
  // Stats
  int participantsCount = 0;
  int outfitsSubmitted = 0;
  
  bool isActive = true;
  bool isFeatured = false;
  
  // Rewards
  String? rewardTitle;
  String? rewardDescription;
}

@collection
class ChallengeParticipation {
  Id id = Isar.autoIncrement;
  
  @Index()
  late String challengeId;
  
  @Index()
  late String userId;
  
  @Index()
  late String outfitId;
  
  late DateTime submittedAt;
  
  String? participantNote;
  
  // Voting/Rating
  int votesReceived = 0;
  double averageRating = 0.0;
  
  bool isWinner = false;
  int? rank;
}

class SocialShareOptions {
  final String title;
  final String? description;
  final List<String> tags;
  final bool isPublic;
  final bool allowComments;
  final String? occasion;

  const SocialShareOptions({
    required this.title,
    this.description,
    this.tags = const [],
    this.isPublic = true,
    this.allowComments = true,
    this.occasion,
  });
}

class CommunityFilters {
  final List<String> tags;
  final Season? season;
  final String? occasion;
  final bool onlyFollowing;
  final String searchQuery;
  final SortBy sortBy;

  const CommunityFilters({
    this.tags = const [],
    this.season,
    this.occasion,
    this.onlyFollowing = false,
    this.searchQuery = '',
    this.sortBy = SortBy.newest,
  });
}

enum SortBy {
  newest,
  popular,
  trending,
  mostLiked,
  mostCommented,
}