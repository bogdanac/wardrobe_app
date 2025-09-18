import 'package:isar/isar.dart';
import 'clothing_item.dart';

part 'outfit_planning_models.g.dart';

enum PlanStatus {
  none,
  suggested,
  planned,
  autoScheduled,
  confirmed,
  completed,
  skipped,
  cancelled,
}

enum ReminderType {
  planOutfit,
  weatherUpdate,
  occasionReminder,
  laundryReminder,
  seasonalUpdate,
}

@collection
class OutfitPlan {
  Id id = Isar.autoIncrement;
  
  @Index()
  late String userId;
  
  @Index()
  late DateTime plannedDate;
  
  // Outfit selection
  String? outfitId;
  List<String> alternativeOutfitIds = [];
  
  // Context
  String occasion = '';
  String notes = '';
  @ignore
  Map<String, dynamic> preferences = {};
  
  // Weather integration
  @ignore
  Map<String, dynamic>? weatherData;
  double? expectedTemperature;
  String? weatherCondition;
  List<String> weatherTags = [];
  
  // Calendar integration
  List<String> calendarEvents = [];
  String? primaryEventId;
  
  // AI suggestions
  @ignore
  List<Map<String, dynamic>> suggestions = [];
  double? confidenceScore;
  
  // Status tracking
  @Enumerated(EnumType.name)
  PlanStatus status = PlanStatus.none;
  
  // Execution tracking
  DateTime? wornAt;
  int? satisfactionRating; // 1-5
  String? feedback;
  bool wasAppropriate = true;
  
  // Timing
  late DateTime createdAt;
  late DateTime updatedAt;
  
  // Notifications
  bool reminderSent = false;
  DateTime? reminderSentAt;
  
  OutfitPlan();
}

@collection
class WeeklyOutfitSchedule {
  Id id = Isar.autoIncrement;
  
  @Index()
  late String userId;
  
  @Index()
  late DateTime weekStart;
  
  late DateTime weekEnd;
  
  @ignore
  List<OutfitPlan> plans = [];
  
  // Schedule metadata
  String? theme; // e.g., "Business week", "Vacation", "Conference"
  @ignore
  Map<String, dynamic> constraints = {}; // Budget, colors, etc.
  
  // Status
  bool isComplete = false;
  bool isApproved = false;
  DateTime? approvedAt;
  
  // Analytics
  int totalOutfits = 0;
  double averageConfidence = 0.0;
  List<String> dominantColors = [];
  List<String> dominantStyles = [];
  
  late DateTime createdAt;
  DateTime? updatedAt;
  
  WeeklyOutfitSchedule();
}

@collection
class OutfitReminder {
  Id id = Isar.autoIncrement;
  
  @Index()
  late String userId;
  
  @Enumerated(EnumType.name)
  late ReminderType type;
  
  late String title;
  late String message;
  
  // Timing
  @Index()
  late DateTime scheduledTime;
  bool isRecurring = false;
  String? recurrencePattern; // 'daily', 'weekly', 'monthly'
  
  // Target
  String? targetOutfitId;
  String? targetPlanId;
  DateTime? targetDate;
  
  // Status
  bool isSent = false;
  DateTime? sentAt;
  bool isRead = false;
  DateTime? readAt;
  
  // User response
  String? userResponse; // 'acknowledged', 'snoozed', 'dismissed'
  DateTime? responseAt;
  
  late DateTime createdAt;
  
  OutfitReminder();
}

@collection
class OutfitTemplate {
  Id id = Isar.autoIncrement;
  
  @Index()
  late String userId;
  
  late String name;
  String? description;
  
  // Template structure
  List<String> requiredCategories = []; // 'top', 'bottom', 'shoes'
  List<String> optionalCategories = []; // 'accessories', 'outerwear'
  
  // Constraints
  @ignore
  Map<String, List<String>> categoryConstraints = {}; // category -> allowed types
  List<String> allowedColors = [];
  List<String> forbiddenColors = [];
  
  // Occasions and seasons
  List<String> occasions = [];
  @Enumerated(EnumType.name)
  List<Season> seasons = [];
  
  // Usage statistics
  int timesUsed = 0;
  DateTime? lastUsed;
  double averageRating = 0.0;
  
  late DateTime createdAt;
  
  OutfitTemplate();
}

@collection
class SeasonalWardrobe {
  Id id = Isar.autoIncrement;
  
  @Index()
  late String userId;
  
  @Enumerated(EnumType.name)
  late Season season;
  
  late int year;
  
  // Items in rotation for this season
  List<String> activeItemIds = [];
  List<String> storedItemIds = []; // Items put away for the season
  
  // Seasonal planning
  List<String> plannedOutfitIds = [];
  @ignore
  Map<String, List<String>> occasionOutfits = {}; // occasion -> outfit IDs
  
  // Goals and themes
  String? seasonalTheme; // e.g., "Minimalist Spring", "Cozy Winter"
  List<String> colorPalette = [];
  List<String> goals = []; // "Wear more dresses", "Try new colors"
  
  // Shopping needs
  List<String> neededItems = [];
  List<String> wishlistItems = [];
  
  // Analytics
  int totalOutfits = 0;
  @ignore
  Map<String, int> itemWearCounts = {}; // item ID -> wear count
  List<String> mostWornItems = [];
  List<String> leastWornItems = [];
  
  late DateTime createdAt;
  late DateTime updatedAt;
  
  SeasonalWardrobe();
}

@collection
class OutfitChallenge {
  Id id = Isar.autoIncrement;
  
  @Index()
  late String userId;
  
  late String title;
  late String description;
  
  // Challenge parameters
  @Index()
  late DateTime startDate;
  @Index()
  late DateTime endDate;
  
  List<String> rules = []; // "No black clothes", "Only 10 items"
  @ignore
  Map<String, dynamic> constraints = {};
  
  // Progress tracking
  List<String> usedOutfitIds = [];
  List<String> usedItemIds = [];
  @ignore
  Map<DateTime, String> dailyOutfits = {}; // date -> outfit ID
  
  // Goals
  int? targetOutfits;
  int? maxItems;
  List<String> targetCategories = [];
  
  // Status
  bool isActive = true;
  bool isCompleted = false;
  DateTime? completedAt;
  
  // Results
  int totalOutfits = 0;
  int uniqueItems = 0;
  double creativityScore = 0.0;
  List<String> achievements = [];
  
  late DateTime createdAt;
  
  OutfitChallenge();
}

@collection
class LaundryPlan {
  Id id = Isar.autoIncrement;
  
  @Index()
  late String userId;
  
  @Index()
  late DateTime plannedDate;
  
  // Items to wash
  List<String> itemIds = [];
  @ignore
  Map<String, String> itemStatus = {}; // item ID -> status (dirty, washing, drying, clean)
  
  // Washing details
  String? washCycle; // 'delicate', 'normal', 'heavy'
  String? temperature; // 'cold', 'warm', 'hot'
  bool separateColors = true;
  
  // Impact on outfit planning
  List<String> affectedOutfitIds = [];
  DateTime? availableAgainAt;
  
  // Status
  bool isCompleted = false;
  DateTime? completedAt;
  
  // Reminders
  bool reminderSet = false;
  DateTime? reminderTime;
  
  late DateTime createdAt;
  
  LaundryPlan();
}

@collection
class ClosetMaintenance {
  Id id = Isar.autoIncrement;
  
  @Index()
  late String userId;
  
  @Enumerated(EnumType.name)
  late MaintenanceType type;
  
  late String title;
  String? description;
  
  // Target items
  List<String> itemIds = [];
  
  // Scheduled timing
  @Index()
  late DateTime scheduledDate;
  bool isRecurring = false;
  String? recurrencePattern;
  
  // Status
  bool isCompleted = false;
  DateTime? completedAt;
  String? notes;
  
  // Results
  List<String> replacedItemIds = [];
  List<String> donatedItemIds = [];
  List<String> repairedItemIds = [];
  
  late DateTime createdAt;
  
  ClosetMaintenance();
}

enum MaintenanceType {
  seasonalRotation,
  deepClean,
  organization,
  damageAssessment,
  sizeReview,
  styleUpdate,
}

// Analytics and insights
class OutfitPlanningAnalytics {
  final int totalPlans;
  final int completedPlans;
  final double completionRate;
  final double averageSatisfactionRating;
  final List<MapEntry<String, int>> mostWornOccasions;
  final double averagePlanningDaysAhead;
  final double planningConsistency;
  final double weatherAccuracy;

  const OutfitPlanningAnalytics({
    required this.totalPlans,
    required this.completedPlans,
    required this.completionRate,
    required this.averageSatisfactionRating,
    required this.mostWornOccasions,
    required this.averagePlanningDaysAhead,
    required this.planningConsistency,
    required this.weatherAccuracy,
  });
}

// Planning preferences
@collection
class PlanningPreferences {
  Id id = Isar.autoIncrement;
  
  @Index(unique: true)
  late String userId;
  
  // Planning horizon
  int planningDaysAhead = 7;
  bool autoScheduleEnabled = false;
  
  // Weather integration
  bool considerWeather = true;
  double weatherWeight = 0.7; // How much weather influences choices
  bool weatherNotifications = true;
  
  // Calendar integration
  bool considerCalendar = true;
  double calendarWeight = 0.8;
  bool calendarNotifications = true;
  
  // Style preferences for planning
  bool prioritizeComfort = true;
  bool prioritizeStyle = false;
  bool prioritizeWeather = true;
  bool prioritizeOccasion = true;
  
  // Repetition rules
  int minDaysBetweenSameOutfit = 7;
  int minDaysBetweenSameItem = 3;
  bool allowExactRepetition = false;
  
  // Notification preferences
  bool planningReminders = true;
  int reminderHoursBefore = 12; // Hours before the planned date
  bool weatherUpdateNotifications = true;
  bool laundryReminders = true;
  
  // Planning constraints
  double maxBudgetPerOutfit = 0.0; // 0 = no limit
  List<String> preferredBrands = [];
  List<String> avoidedBrands = [];
  
  late DateTime lastUpdated;
  
  PlanningPreferences();
}

// Outfit planning suggestions from AI
class SmartPlanSuggestion {
  final String suggestionId;
  final String title;
  final String description;
  final List<String> outfitIds;
  final double confidence;
  final List<String> reasoning;
  final Map<String, dynamic> context;
  final DateTime createdAt;

  const SmartPlanSuggestion({
    required this.suggestionId,
    required this.title,
    required this.description,
    required this.outfitIds,
    required this.confidence,
    required this.reasoning,
    required this.context,
    required this.createdAt,
  });
}

// Weather-outfit compatibility
class WeatherOutfitCompatibility {
  final String outfitId;
  final Map<String, dynamic> weatherData;
  final double compatibilityScore;
  final List<String> concerns;
  final List<String> recommendations;

  const WeatherOutfitCompatibility({
    required this.outfitId,
    required this.weatherData,
    required this.compatibilityScore,
    required this.concerns,
    required this.recommendations,
  });
}

// Planning conflicts and resolutions
class PlanningConflict {
  final String conflictId;
  final String type; // 'laundry', 'weather', 'occasion', 'repetition'
  final String description;
  final List<String> affectedPlanIds;
  final List<ConflictResolution> suggestedResolutions;
  final DateTime detectedAt;

  const PlanningConflict({
    required this.conflictId,
    required this.type,
    required this.description,
    required this.affectedPlanIds,
    required this.suggestedResolutions,
    required this.detectedAt,
  });
}

class ConflictResolution {
  final String resolutionId;
  final String description;
  final String action; // 'reschedule', 'substitute', 'modify', 'ignore'
  final Map<String, dynamic> parameters;
  final double impact; // How much this affects the overall plan

  const ConflictResolution({
    required this.resolutionId,
    required this.description,
    required this.action,
    required this.parameters,
    required this.impact,
  });
}

// Calendar view for outfit planning
class CalendarView {
  final DateTime date;
  final OutfitPlan? plan;
  final bool hasEvent;
  final List<String> events;
  final String? weatherSummary;
  final PlanStatus status;

  const CalendarView({
    required this.date,
    this.plan,
    this.hasEvent = false,
    this.events = const [],
    this.weatherSummary,
    this.status = PlanStatus.none,
  });
}

// Seasonal planning (alias for SeasonalWardrobe for compatibility)
typedef SeasonalPlan = SeasonalWardrobe;

// Seasonal transition planning
class SeasonalTransition {
  final Season fromSeason;
  final Season toSeason;
  final DateTime transitionDate;
  final List<String> itemsToStore;
  final List<String> itemsToRetrieve;
  final List<String> itemsToReplace;
  final List<String> shoppingNeeds;

  const SeasonalTransition({
    required this.fromSeason,
    required this.toSeason,
    required this.transitionDate,
    required this.itemsToStore,
    required this.itemsToRetrieve,
    required this.itemsToReplace,
    required this.shoppingNeeds,
  });
}

// Outfit planning statistics
class PlanningStatistics {
  final Map<String, int> occasionFrequency;
  final Map<String, int> colorFrequency;
  final Map<String, int> itemUsageFrequency;
  final double averagePlanningAccuracy;
  final double weatherPredictionAccuracy;
  final List<String> mostSuccessfulPatterns;
  final List<String> improvementAreas;

  const PlanningStatistics({
    required this.occasionFrequency,
    required this.colorFrequency,
    required this.itemUsageFrequency,
    required this.averagePlanningAccuracy,
    required this.weatherPredictionAccuracy,
    required this.mostSuccessfulPatterns,
    required this.improvementAreas,
  });
}