import 'package:isar/isar.dart';

part 'voice_models.g.dart';

enum VoiceEventType {
  commandRecognized,
  listeningStarted,
  listeningStopped,
  error,
  partial,
  final_,
}

enum VoiceIntent {
  showOutfits,
  findItem,
  createOutfit,
  navigate,
  filter,
  search,
  like,
  favorite,
  share,
  delete,
  unknown,
}

enum OutfitCreationStatus {
  initializing,
  inProgress,
  completed,
  failed,
  cancelled,
}

enum OutfitCreationStep {
  initialization,
  selectingTop,
  selectingBottom,
  selectingShoes,
  selectingAccessories,
  confirmation,
  completed,
}

enum NavigationAction {
  goto,
  back,
  home,
  search,
  filter,
  unknown,
}

// Voice availability information
class VoiceAvailability {
  final bool isSupported;
  final List<String> availableLanguages;
  final bool hasOfflineSupport;
  final Map<String, dynamic> capabilities;

  const VoiceAvailability({
    required this.isSupported,
    required this.availableLanguages,
    required this.hasOfflineSupport,
    this.capabilities = const {},
  });

  static VoiceAvailability fromMap(Map<dynamic, dynamic> map) {
    return VoiceAvailability(
      isSupported: map['isSupported'] ?? false,
      availableLanguages: List<String>.from(map['availableLanguages'] ?? []),
      hasOfflineSupport: map['hasOfflineSupport'] ?? false,
      capabilities: Map<String, dynamic>.from(map['capabilities'] ?? {}),
    );
  }
}

// Voice event data
class VoiceEvent {
  final VoiceEventType type;
  final String message;
  final double confidence;
  final Map<String, dynamic> data;
  final DateTime timestamp;

  VoiceEvent({
    required this.type,
    required this.message,
    this.confidence = 0.0,
    this.data = const {},
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  static VoiceEvent fromMap(Map<String, dynamic> map) {
    return VoiceEvent(
      type: VoiceEventType.values.firstWhere(
        (e) => e.name == map['type'],
        orElse: () => VoiceEventType.error,
      ),
      message: map['message'] ?? '',
      confidence: (map['confidence'] ?? 0.0).toDouble(),
      data: Map<String, dynamic>.from(map['data'] ?? {}),
      timestamp: map['timestamp'] != null 
          ? DateTime.parse(map['timestamp'])
          : null,
    );
  }
}

// Voice command processing result
class VoiceCommandResult {
  final String command;
  final VoiceIntent intent;
  final double confidence;
  final bool success;
  final Map<String, dynamic> parameters;
  final String? error;

  const VoiceCommandResult({
    required this.command,
    required this.intent,
    required this.confidence,
    required this.success,
    this.parameters = const {},
    this.error,
  });

  static VoiceCommandResult fromMap(Map<dynamic, dynamic> map) {
    return VoiceCommandResult(
      command: map['command'] ?? '',
      intent: VoiceIntent.values.firstWhere(
        (e) => e.name == map['intent'],
        orElse: () => VoiceIntent.unknown,
      ),
      confidence: (map['confidence'] ?? 0.0).toDouble(),
      success: map['success'] ?? false,
      parameters: Map<String, dynamic>.from(map['parameters'] ?? {}),
      error: map['error'],
    );
  }
}

// Voice-guided outfit creation session
class OutfitCreationSession {
  final String sessionId;
  final OutfitCreationStatus status;
  final OutfitCreationStep currentStep;
  final List<String> selectedItemIds;
  final Map<String, dynamic> preferences;
  final DateTime createdAt;
  final DateTime? completedAt;

  OutfitCreationSession({
    required this.sessionId,
    required this.status,
    required this.currentStep,
    this.selectedItemIds = const [],
    this.preferences = const {},
    DateTime? createdAt,
    this.completedAt,
  }) : createdAt = createdAt ?? DateTime.now();

  static OutfitCreationSession fromMap(Map<dynamic, dynamic> map) {
    return OutfitCreationSession(
      sessionId: map['sessionId'] ?? '',
      status: OutfitCreationStatus.values.firstWhere(
        (e) => e.name == map['status'],
        orElse: () => OutfitCreationStatus.failed,
      ),
      currentStep: OutfitCreationStep.values.firstWhere(
        (e) => e.name == map['currentStep'],
        orElse: () => OutfitCreationStep.initialization,
      ),
      selectedItemIds: List<String>.from(map['selectedItemIds'] ?? []),
      preferences: Map<String, dynamic>.from(map['preferences'] ?? {}),
      createdAt: map['createdAt'] != null 
          ? DateTime.parse(map['createdAt'])
          : null,
      completedAt: map['completedAt'] != null 
          ? DateTime.parse(map['completedAt'])
          : null,
    );
  }
}

// Navigation result from voice command
class NavigationResult {
  final NavigationAction action;
  final String destination;
  final bool success;
  final Map<String, dynamic> parameters;

  const NavigationResult({
    required this.action,
    required this.destination,
    required this.success,
    this.parameters = const {},
  });

  static NavigationResult fromMap(Map<dynamic, dynamic> map) {
    return NavigationResult(
      action: NavigationAction.values.firstWhere(
        (e) => e.name == map['action'],
        orElse: () => NavigationAction.unknown,
      ),
      destination: map['destination'] ?? '',
      success: map['success'] ?? false,
      parameters: Map<String, dynamic>.from(map['parameters'] ?? {}),
    );
  }
}

// Stored voice command history
@collection
class VoiceCommandHistory {
  Id id = Isar.autoIncrement;
  
  @Index()
  late String userId;
  
  late String command;
  
  @Enumerated(EnumType.name)
  late VoiceIntent detectedIntent;
  
  late double confidence;
  late bool wasSuccessful;
  
  // Processing details
  int? processingTime; // milliseconds
  String? errorMessage;
  @ignore
  Map<String, dynamic> parameters = {};
  
  @Index()
  late DateTime executedAt;
  
  // User feedback
  bool? wasAccurate;
  String? userFeedback;
  
  VoiceCommandHistory();
}

// Voice preferences and settings
@collection
class VoiceSettings {
  Id id = Isar.autoIncrement;
  
  @Index(unique: true)
  late String userId;
  
  // Language settings
  String language = 'en-US';
  List<String> alternativeLanguages = [];
  
  // Recognition settings
  double confidenceThreshold = 0.7;
  bool enableContinuousListening = false;
  int timeoutSeconds = 30;
  
  // Voice feedback settings
  bool enableVoiceFeedback = true;
  double speechRate = 1.0;
  double volume = 0.8;
  String voiceGender = 'female'; // 'male', 'female', 'neutral'
  
  // Accessibility settings
  bool enableVoiceHints = true;
  bool enableAudioDescriptions = true;
  bool enableHapticFeedback = true;
  
  // Privacy settings
  bool saveVoiceData = false;
  bool allowVoiceTraining = true;
  
  // Custom commands
  bool enableCustomCommands = true;
  @ignore
  Map<String, String> customCommands = {}; // phrase -> action
  
  late DateTime updatedAt;
  
  VoiceSettings();
}

// Voice training session
@collection
class VoiceTrainingSession {
  Id id = Isar.autoIncrement;
  
  @Index()
  late String userId;
  
  late String sessionName;
  List<String> trainingPhrases = [];
  int requiredRepetitions = 3;
  
  // Progress tracking
  int currentPhraseIndex = 0;
  int currentRepetition = 0;
  @ignore
  Map<String, List<double>> phrasesConfidence = {}; // phrase -> confidence scores
  
  // Session status
  @Enumerated(EnumType.name)
  late TrainingSessionStatus status;
  
  late DateTime startedAt;
  DateTime? completedAt;
  
  // Results
  double overallAccuracy = 0.0;
  @ignore
  Map<String, double> phraseAccuracy = {};
  List<String> problematicPhrases = [];
  
  VoiceTrainingSession();
}

enum TrainingSessionStatus {
  preparing,
  inProgress,
  completed,
  failed,
  cancelled,
}

// Voice analytics
@collection
class VoiceAnalytics {
  Id id = Isar.autoIncrement;
  
  @Index()
  late String userId;
  
  @Index()
  late DateTime date;
  
  // Usage statistics
  int commandsExecuted = 0;
  int successfulCommands = 0;
  int failedCommands = 0;
  
  // Intent distribution
  @ignore
  Map<String, int> intentFrequency = {}; // intent -> count
  
  // Performance metrics
  double averageConfidence = 0.0;
  double averageProcessingTime = 0.0; // milliseconds
  
  // User behavior
  int voiceSessionsStarted = 0;
  int totalListeningTime = 0; // seconds
  
  // Error analysis
  @ignore
  Map<String, int> errorTypes = {}; // error type -> count
  List<String> mostProblematicCommands = [];
  
  VoiceAnalytics();
}

// Voice accessibility profile
@collection
class VoiceAccessibilityProfile {
  Id id = Isar.autoIncrement;
  
  @Index(unique: true)
  late String userId;
  
  // Accessibility needs
  bool hasMotorImpairment = false;
  bool hasHearingImpairment = false;
  bool hasVisualImpairment = false;
  bool hasSpeechImpairment = false;
  
  // Adaptive settings
  double extendedTimeoutMultiplier = 1.0;
  bool requireConfirmation = false;
  bool enableGestureBackup = true;
  
  // Custom voice patterns
  @ignore
  Map<String, String> personalizedCommands = {};
  List<String> difficultWords = [];
  
  // Alternative input methods
  bool enableButtonActivation = false;
  bool enableGestureActivation = false;
  bool enableTapToTalk = true;
  
  late DateTime createdAt;
  late DateTime updatedAt;
  
  VoiceAccessibilityProfile();
}

// Voice command shortcuts
@collection
class VoiceShortcut {
  Id id = Isar.autoIncrement;
  
  @Index()
  late String userId;
  
  late String phrase;
  late String action;
  @ignore
  Map<String, dynamic> parameters = {};
  
  // Shortcut metadata
  String? description;
  String? category;
  List<String> tags = [];
  
  // Usage statistics
  int timesUsed = 0;
  DateTime? lastUsed;
  
  // Status
  bool isActive = true;
  bool isUserCreated = true;
  
  late DateTime createdAt;
  
  VoiceShortcut();
}

// Voice feedback for continuous learning
@collection
class VoiceFeedback {
  Id id = Isar.autoIncrement;
  
  @Index()
  late String userId;
  
  late String originalCommand;
  late String recognizedCommand;
  
  @Enumerated(EnumType.name)
  late VoiceIntent expectedIntent;
  
  @Enumerated(EnumType.name)
  late VoiceIntent actualIntent;
  
  late double confidence;
  
  // User correction
  @Enumerated(EnumType.name)
  late FeedbackType feedbackType;
  
  String? correctedCommand;
  String? correctedIntent;
  
  @Index()
  late DateTime providedAt;
  
  VoiceFeedback();
}

enum FeedbackType {
  correct,
  incorrect,
  partiallyCorrect,
  misunderstood,
}

// Voice context awareness
@collection
class VoiceContext {
  Id id = Isar.autoIncrement;
  
  @Index()
  late String userId;
  
  // Current app state
  String currentScreen = '';
  String currentMode = ''; // browsing, creating, editing, etc.
  @ignore
  Map<String, dynamic> contextData = {};
  
  // Recent activities
  List<String> recentCommands = [];
  List<String> recentScreens = [];
  
  // User preferences in context
  @ignore
  Map<String, dynamic> contextualPreferences = {};
  
  @Index()
  late DateTime lastUpdated;
  
  VoiceContext();
}

// Multi-language support
@collection
class VoiceLanguageModel {
  Id id = Isar.autoIncrement;
  
  late String languageCode; // e.g., 'en-US', 'es-ES'
  late String languageName; // e.g., 'English (US)', 'Spanish (Spain)'
  
  // Model information
  late String modelVersion;
  double accuracy = 0.0;
  int modelSize = 0; // bytes
  
  // Availability
  bool isDownloaded = false;
  bool isOfflineCapable = false;
  
  // Supported features
  bool supportsContinuousRecognition = true;
  bool supportsRealTimeTranscription = true;
  bool supportsVoiceTraining = false;
  
  DateTime? downloadedAt;
  DateTime? lastUsed;
  
  VoiceLanguageModel();
}

// Voice command suggestions
class VoiceCommandSuggestion {
  final String phrase;
  final String description;
  final VoiceIntent intent;
  final Map<String, dynamic> exampleParameters;
  final String category;
  final double relevanceScore;

  const VoiceCommandSuggestion({
    required this.phrase,
    required this.description,
    required this.intent,
    this.exampleParameters = const {},
    required this.category,
    this.relevanceScore = 1.0,
  });
}

// Voice onboarding progress
@collection
class VoiceOnboarding {
  Id id = Isar.autoIncrement;
  
  @Index(unique: true)
  late String userId;
  
  // Onboarding steps
  bool hasCompletedIntroduction = false;
  bool hasCompletedVoiceTest = false;
  bool hasCompletedTraining = false;
  bool hasCompletedCustomization = false;
  
  // Test results
  double voiceTestAccuracy = 0.0;
  List<String> successfulCommands = [];
  List<String> failedCommands = [];
  
  // Preferences set during onboarding
  String preferredLanguage = 'en-US';
  bool enabledVoiceFeedback = true;
  bool enabledContinuousListening = false;
  
  DateTime? startedAt;
  DateTime? completedAt;
  
  VoiceOnboarding();
}