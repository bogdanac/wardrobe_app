import 'package:isar/isar.dart';

part 'calendar_integration.g.dart';

enum TimeOfDay {
  morning,
  afternoon,
  evening,
}

@collection
class OutfitSuggestion {
  Id id = Isar.autoIncrement;
  
  late String eventId;
  late String eventTitle;
  late DateTime eventStart;
  late DateTime eventEnd;
  
  late String occasion;
  late String dressCode;
  
  @Enumerated(EnumType.name)
  late TimeOfDay timeOfDay;
  
  String? location;
  String? description;
  
  late int priority;
  
  // Suggested outfit ID (if selected)
  String? suggestedOutfitId;
  
  // Weather considerations
  double? expectedTemperature;
  String? weatherConditions;
  
  // Created timestamp
  late DateTime createdAt;
  
  // Status
  bool isConfirmed = false;
  bool isCompleted = false;
  
  OutfitSuggestion();
}

@collection
class CalendarIntegrationSettings {
  Id id = Isar.autoIncrement;
  
  // Selected calendar for integration
  String? selectedCalendarId;
  String? selectedCalendarName;
  
  // Integration preferences
  bool autoSuggestOutfits = true;
  bool analyzeEventTitles = true;
  bool considerWeather = true;
  bool sendNotifications = true;
  
  // Notification timing (hours before event)
  int notificationHoursBefore = 2;
  
  // Days to look ahead for outfit planning
  int planningDaysAhead = 7;
  
  // Keywords for occasion detection
  List<String> workKeywords = ['meeting', 'work', 'office', 'conference', 'presentation'];
  List<String> formalKeywords = ['formal', 'wedding', 'ceremony', 'interview', 'gala'];
  List<String> casualKeywords = ['casual', 'coffee', 'lunch', 'hangout', 'movie'];
  List<String> gymKeywords = ['gym', 'workout', 'fitness', 'exercise', 'yoga'];
  List<String> partyKeywords = ['party', 'celebration', 'birthday', 'dinner', 'date'];
  
  // Last sync timestamp
  DateTime? lastSyncAt;
  
  CalendarIntegrationSettings();
}

@collection
class PlannedOutfit {
  Id id = Isar.autoIncrement;
  
  @Index()
  late DateTime plannedDate;
  
  @Index()
  late String outfitId;
  
  // Associated event (if any)
  String? eventId;
  String? eventTitle;
  
  // Planning details
  late String occasion;
  String? notes;
  
  // Weather at time of planning
  double? plannedTemperature;
  String? plannedWeatherConditions;
  
  // Status
  bool isWorn = false;
  DateTime? wornAt;
  
  // User feedback after wearing
  int? comfortRating; // 1-5 scale
  int? styleRating; // 1-5 scale
  String? feedback;
  
  late DateTime createdAt;
  late DateTime updatedAt;
  
  PlannedOutfit();
}

@collection
class OutfitCalendarEvent {
  Id id = Isar.autoIncrement;
  
  // Calendar event details
  late String calendarEventId;
  late String calendarId;
  late String title;
  String? description;
  
  late DateTime startTime;
  late DateTime endTime;
  
  String? location;
  
  // Outfit planning
  String? plannedOutfitId;
  String? alternativeOutfitId;
  
  // Event analysis
  late String detectedOccasion;
  late String suggestedDressCode;
  
  @Enumerated(EnumType.name)
  late TimeOfDay timeOfDay;
  
  // Weather context
  double? weatherTemperature;
  String? weatherCondition;
  List<String> weatherTags = [];
  
  // User decisions
  bool outfitConfirmed = false;
  DateTime? outfitConfirmedAt;
  
  bool eventCompleted = false;
  DateTime? completedAt;
  
  // Feedback
  bool outfitWasAppropriate = true;
  String? postEventFeedback;
  
  late DateTime createdAt;
  late DateTime lastUpdated;
  
  OutfitCalendarEvent();
}

class EventAnalysis {
  final String occasion;
  final String dressCode;
  final TimeOfDay timeOfDay;
  final int priority;
  final List<String> keywords;
  final Map<String, dynamic> metadata;

  const EventAnalysis({
    required this.occasion,
    required this.dressCode,
    required this.timeOfDay,
    required this.priority,
    this.keywords = const [],
    this.metadata = const {},
  });
}

class CalendarOutfitRecommendation {
  final OutfitSuggestion suggestion;
  final List<String> recommendedOutfitIds;
  final Map<String, double> confidenceScores;
  final List<String> reasonings;

  const CalendarOutfitRecommendation({
    required this.suggestion,
    required this.recommendedOutfitIds,
    this.confidenceScores = const {},
    this.reasonings = const [],
  });
}

// Notification models
class OutfitPlanningNotification {
  final String id;
  final String title;
  final String body;
  final DateTime scheduledTime;
  final String eventId;
  final String? outfitId;
  final Map<String, dynamic> payload;

  const OutfitPlanningNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.scheduledTime,
    required this.eventId,
    this.outfitId,
    this.payload = const {},
  });
}

// Integration status
enum CalendarSyncStatus {
  idle,
  syncing,
  success,
  error,
  noPermission,
  noCalendarSelected,
}

class CalendarSyncState {
  final CalendarSyncStatus status;
  final DateTime? lastSyncTime;
  final String? errorMessage;
  final int eventsProcessed;
  final int suggestionsGenerated;

  const CalendarSyncState({
    required this.status,
    this.lastSyncTime,
    this.errorMessage,
    this.eventsProcessed = 0,
    this.suggestionsGenerated = 0,
  });

  CalendarSyncState copyWith({
    CalendarSyncStatus? status,
    DateTime? lastSyncTime,
    String? errorMessage,
    int? eventsProcessed,
    int? suggestionsGenerated,
  }) {
    return CalendarSyncState(
      status: status ?? this.status,
      lastSyncTime: lastSyncTime ?? this.lastSyncTime,
      errorMessage: errorMessage ?? this.errorMessage,
      eventsProcessed: eventsProcessed ?? this.eventsProcessed,
      suggestionsGenerated: suggestionsGenerated ?? this.suggestionsGenerated,
    );
  }
}