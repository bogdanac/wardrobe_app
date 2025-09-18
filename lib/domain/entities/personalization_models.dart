import 'package:isar/isar.dart';

// part 'personalization_models.g.dart'; // TODO: Generate with build_runner

enum UserInteractionType {
  viewed,
  liked,
  disliked,
  worn,
  shared,
  saved,
  dismissed,
  purchased,
  searched,
  filtered,
}

enum RecommendationType {
  outfit,
  clothingItem,
  style,
  color,
  occasion,
  trend,
}

@collection
class UserInteraction {
  Id id = Isar.autoIncrement;
  
  @Index()
  late String userId;
  
  @Enumerated(EnumType.name)
  late UserInteractionType interactionType;
  
  late String targetId; // ID of outfit, clothing item, etc.
  String? targetType; // 'outfit', 'clothing_item', 'style', etc.
  
  @ignore
  Map<String, dynamic> context = {}; // Additional context data
  
  @Index()
  late DateTime timestamp;
  
  // Session information
  String? sessionId;
  
  // Device/app context
  String? deviceType;
  String? appVersion;
  
  UserInteraction();
}

@collection
class UserPreferences {
  Id id = Isar.autoIncrement;
  
  @Index(unique: true)
  late String userId;
  
  // Style preferences
  List<String> preferredStyles = [];
  List<String> dislikedStyles = [];
  
  // Color preferences
  List<String> preferredColors = [];
  List<String> dislikedColors = [];
  
  // Occasion preferences
  List<String> preferredOccasions = [];
  
  // Fit preferences
  List<String> preferredFits = [];
  List<String> dislikedFits = [];
  
  // Brand preferences
  List<String> preferredBrands = [];
  List<String> dislikedBrands = [];
  
  // Budget preferences
  double minBudget = 0.0;
  double maxBudget = 500.0;
  
  // Seasonal preferences
  @ignore
  Map<String, List<String>> seasonalPreferences = {}; // season -> preferences
  
  // Shopping preferences
  bool preferSustainable = false;
  bool preferLocalBrands = false;
  bool preferVintage = false;
  
  // Comfort preferences
  List<String> comfortPriorities = []; // 'breathable', 'stretchy', 'warm', etc.
  
  // Activity preferences
  @ignore
  Map<String, List<String>> activityPreferences = {}; // activity -> style preferences
  
  // Social preferences
  bool shareOutfits = true;
  bool allowSuggestions = true;
  bool joinChallenges = true;
  
  late DateTime lastUpdated;
  
  UserPreferences();
}

@collection
class UserProfile {
  Id id = Isar.autoIncrement;
  
  @Index(unique: true)
  late String userId;
  
  // Basic demographics
  int? age;
  String? gender;
  String? location;
  String? profession;
  
  // Style profile
  List<String> stylePersonality = []; // 'minimalist', 'bohemian', 'classic', etc.
  String? primaryStyle;
  List<String> secondaryStyles = [];
  
  // Body type preferences (optional, user-provided)
  String? bodyType;
  @ignore
  Map<String, String> bodyMeasurements = {};
  
  // Lifestyle factors
  String? lifestyle; // 'active', 'professional', 'casual', 'formal'
  List<String> dailyActivities = [];
  String? workDress; // dress code
  
  // Shopping behavior
  String? shoppingFrequency; // 'weekly', 'monthly', 'seasonal'
  double? typicalBudget;
  List<String> preferredShoppingSources = []; // 'online', 'retail', 'thrift', etc.
  
  // Fashion interests
  List<String> followedInfluencers = [];
  List<String> favoriteMagazines = [];
  List<String> fashionGoals = []; // 'build capsule wardrobe', 'try new styles', etc.
  
  // Preferences derived from behavior
  @ignore
  Map<String, int> colorPreferences = {}; // color -> frequency/score
  @ignore
  Map<String, int> stylePreferences = {}; // style -> frequency/score
  @ignore
  Map<String, int> fitPreferences = {}; // fit -> frequency/score
  @ignore
  Map<String, int> occasionPreferences = {}; // occasion -> frequency/score
  
  // Confidence score (how well we know this user's preferences)
  late double confidence; // 0.0 to 1.0
  
  late DateTime createdAt;
  late DateTime lastUpdated;
  
  UserProfile();
}

@collection
class PersonalizedRecommendation {
  Id id = Isar.autoIncrement;
  
  late String userId;
  
  @Enumerated(EnumType.name)
  late RecommendationType type;
  
  late String title;
  late String description;
  
  late double confidence; // 0.0 to 1.0
  
  late String targetId; // ID of the recommended item/outfit/style
  String? targetType;
  
  List<String> reasoning = []; // Why this was recommended
  @ignore
  Map<String, dynamic> metadata = {}; // Additional data
  
  @Index()
  late DateTime createdAt;
  DateTime? viewedAt;
  DateTime? dismissedAt;
  DateTime? actedUponAt;
  
  // User feedback
  bool? wasHelpful;
  String? userFeedback;
  
  // A/B testing
  String? variantId;
  String? experimentId;
  
  PersonalizedRecommendation();
}

@collection
class StyleProfile {
  Id id = Isar.autoIncrement;
  
  @Index(unique: true)
  late String userId;
  
  // Analyzed color preferences with confidence scores
  @ignore
  Map<String, int> colorPreferences = {};
  
  // Analyzed style preferences
  @ignore
  Map<String, int> stylePreferences = {};
  
  // Fit preferences
  @ignore
  Map<String, int> fitPreferences = {};
  
  // Occasion preferences
  @ignore
  Map<String, int> occasionPreferences = {};
  
  // Brand affinity
  @ignore
  Map<String, int> brandPreferences = {};
  
  // Seasonal variations in preferences
  @ignore
  Map<String, Map<String, int>> seasonalStylePreferences = {};
  
  // Style evolution over time
  List<StyleEvolution> styleEvolution = [];
  
  // Overall confidence in this profile
  late double confidence;
  
  late DateTime lastUpdated;
  
  StyleProfile();
}

@embedded
class StyleEvolution {
  late DateTime period;
  Map<String, int> dominantStyles = {};
  Map<String, int> dominantColors = {};
  String? note; // e.g., "Started exploring bohemian style"
  
  StyleEvolution();
}

@collection
class OutfitFeedback {
  Id id = Isar.autoIncrement;
  
  @Index()
  late String userId;
  
  @Index()
  late String outfitId;
  
  late double rating; // 1-5 stars
  String? feedback;
  List<String> tags = []; // 'comfortable', 'stylish', 'inappropriate', etc.
  
  // Specific feedback categories
  int? comfortRating;
  int? styleRating;
  int? appropriatenessRating;
  int? temperatureRating;
  
  // Context when worn
  String? occasion;
  String? weather;
  String? mood;
  
  late DateTime timestamp;
  
  OutfitFeedback();
}

@collection
class OutfitHistory {
  Id id = Isar.autoIncrement;
  
  @Index()
  late String userId;
  
  @Index()
  late String outfitId;
  
  @Index()
  late DateTime wornDate;
  
  String occasion = '';
  List<String> colors = [];
  List<String> styles = [];
  String? weather;
  double? temperature;
  
  // User's mood/satisfaction after wearing
  int? satisfactionRating; // 1-5
  String? notes;
  
  // Social engagement if shared
  int? likes;
  int? comments;
  bool wasShared = false;
  
  OutfitHistory();
}

@collection
class TrendingStyle {
  Id id = Isar.autoIncrement;
  
  late String name;
  late String description;
  String? imageUrl;
  
  List<String> tags = [];
  List<String> keyColors = [];
  List<String> keyPieces = [];
  
  late double popularity; // Trending score
  
  @Index()
  late DateTime trendingStart;
  DateTime? trendingEnd;
  
  // Demographics where this is trending
  List<String> popularAgeGroups = [];
  List<String> popularRegions = [];
  
  // Associated occasions
  List<String> occasions = [];
  List<String> seasons = [];
  
  // External references
  String? sourceUrl;
  String? sourceName;
  
  TrendingStyle();
}

@collection
class PersonalizationSettings {
  Id id = Isar.autoIncrement;
  
  @Index(unique: true)
  late String userId;
  
  // Privacy settings
  bool allowDataCollection = true;
  bool allowPersonalization = true;
  bool allowTrendingRecommendations = true;
  
  // Recommendation frequency
  String notificationFrequency = 'daily'; // 'none', 'daily', 'weekly'
  
  // Types of recommendations to show
  bool showOutfitRecommendations = true;
  bool showItemRecommendations = true;
  bool showStyleRecommendations = true;
  bool showTrendRecommendations = true;
  
  // Learning preferences
  bool learnFromWearHistory = true;
  bool learnFromLikes = true;
  bool learnFromShares = true;
  bool learnFromPurchases = true;
  
  // Recommendation diversity
  double diversityPreference = 0.5; // 0.0 = very similar, 1.0 = very diverse
  
  // Explicit preferences override
  bool useExplicitPreferencesOnly = false;
  
  late DateTime lastUpdated;
  
  PersonalizationSettings();
}

// Analytics and insights
@collection
class PersonalizationInsight {
  Id id = Isar.autoIncrement;
  
  @Index()
  late String userId;
  
  late String insightType; // 'style_evolution', 'color_trend', 'seasonal_pattern', etc.
  late String title;
  late String description;
  
  @ignore
  Map<String, dynamic> data = {}; // Supporting data for the insight
  
  late double confidence; // How confident we are in this insight
  
  @Index()
  late DateTime generatedAt;
  DateTime? viewedAt;
  
  bool isActionable = false; // Can the user act on this insight?
  String? actionText; // e.g., "Try adding more blues to your wardrobe"
  
  PersonalizationInsight();
}

// Machine learning model data
@collection
class UserStyleVector {
  Id id = Isar.autoIncrement;
  
  @Index(unique: true)
  late String userId;
  
  // Encoded style preferences as vectors for ML
  List<double> styleVector = [];
  List<double> colorVector = [];
  List<double> fitVector = [];
  List<double> occasionVector = [];
  
  // Model version for compatibility
  late String modelVersion;
  
  late DateTime lastUpdated;
  
  UserStyleVector();
}

// Recommendation performance tracking
@collection
class RecommendationFeedback {
  Id id = Isar.autoIncrement;
  
  @Index()
  late String recommendationId;
  
  @Index()
  late String userId;
  
  @Enumerated(EnumType.name)
  late RecommendationType recommendationType;
  
  // User action taken
  String? action; // 'viewed', 'liked', 'dismissed', 'acted_upon'
  
  // Implicit feedback
  int? timeSpentViewing; // seconds
  bool? clickedThrough;
  
  // Explicit feedback
  bool? wasHelpful;
  int? rating; // 1-5
  String? comment;
  
  late DateTime timestamp;
  
  RecommendationFeedback();
}

// Seasonal preference analysis
class SeasonalPreferenceAnalysis {
  final Map<String, Map<String, double>> seasonalColorPreferences;
  final Map<String, Map<String, double>> seasonalStylePreferences;
  final Map<String, List<String>> seasonalTopItems;
  final DateTime analysisDate;

  const SeasonalPreferenceAnalysis({
    required this.seasonalColorPreferences,
    required this.seasonalStylePreferences,
    required this.seasonalTopItems,
    required this.analysisDate,
  });
}

// Style similarity scoring
class StyleSimilarityScore {
  final String userId1;
  final String userId2;
  final double overallSimilarity;
  final Map<String, double> categoryScores; // color, style, fit, etc.
  final List<String> commonPreferences;
  final DateTime calculatedAt;

  const StyleSimilarityScore({
    required this.userId1,
    required this.userId2,
    required this.overallSimilarity,
    required this.categoryScores,
    required this.commonPreferences,
    required this.calculatedAt,
  });
}

// Recommendation explanation
class RecommendationExplanation {
  final String primaryReason;
  final List<String> supportingReasons;
  final Map<String, double> featureWeights;
  final double confidence;

  const RecommendationExplanation({
    required this.primaryReason,
    required this.supportingReasons,
    required this.featureWeights,
    required this.confidence,
  });
}

// A/B testing support
@collection
class PersonalizationExperiment {
  Id id = Isar.autoIncrement;
  
  late String experimentId;
  late String experimentName;
  late String description;
  
  @Index()
  late DateTime startDate;
  DateTime? endDate;
  
  List<String> variants = []; // Different versions being tested
  @ignore
  Map<String, double> variantWeights = {}; // Traffic allocation
  
  // Success metrics
  List<String> successMetrics = []; // 'click_through_rate', 'satisfaction', etc.
  
  bool isActive = true;
  
  PersonalizationExperiment();
}

@collection
class ExperimentParticipation {
  Id id = Isar.autoIncrement;
  
  @Index()
  late String userId;
  
  @Index()
  late String experimentId;
  
  late String assignedVariant;
  late DateTime assignedAt;
  
  // Outcomes
  Map<String, dynamic> outcomes = {};
  
  ExperimentParticipation();
}