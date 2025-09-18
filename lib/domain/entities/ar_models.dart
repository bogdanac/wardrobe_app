import 'package:isar/isar.dart';

// part 'ar_models.g.dart'; // TODO: Generate with build_runner

enum CaptureType { photo, video, gif }
enum ExportFormat { obj, fbx, gltf, usdz, png, jpg }
enum MovementType { walking, sitting, standing, reaching, bending }
enum DrapeQuality { excellent, good, fair, poor }

// AR Availability Check
class ARAvailability {
  final bool isSupported;
  final bool hasDepthSensor;
  final List<String> supportedFeatures;
  final Map<String, dynamic> deviceCapabilities;

  const ARAvailability({
    required this.isSupported,
    required this.hasDepthSensor,
    required this.supportedFeatures,
    required this.deviceCapabilities,
  });
}

// 3D Body Model
@collection
class BodyModel {
  Id id = Isar.autoIncrement;
  
  @Index()
  late String userId;
  
  late String name;
  String? description;
  
  // Measurements in centimeters
  @ignore
  Map<String, double> measurements = {};
  
  // Body type classification
  String? bodyType; // 'hourglass', 'pear', 'apple', 'rectangle', 'inverted_triangle'
  
  // 3D mesh data
  String? meshData; // Base64 encoded 3D mesh
  String? textureData; // Base64 encoded texture map
  
  // Model accuracy
  late double confidenceScore; // 0.0 to 1.0
  
  // Calibration data
  @ignore
  Map<String, dynamic> calibrationData = {};
  
  // Reference photos used for creation
  List<String> referencePhotoPaths = [];
  
  late DateTime createdAt;
  late DateTime updatedAt;
  
  BodyModel({
    this.userId = '',
    this.name = '',
    this.measurements = const {},
    this.bodyType,
    this.meshData,
    this.confidenceScore = 0.0,
  }) {
    createdAt = DateTime.now();
    updatedAt = DateTime.now();
  }
}

// AR Visualization
@collection
class ARVisualization {
  Id id = Isar.autoIncrement;
  
  @Index()
  late String outfitId;
  
  @Index()
  late String bodyModelId;
  
  late String name;
  String? description;
  
  // Render data
  String renderData = ''; // Base64 encoded AR scene data
  String? thumbnailPath;
  
  // Fit analysis results
  @ignore
  Map<String, dynamic> fitAnalysisData = {};
  
  // Visualization metrics
  @ignore
  Map<String, dynamic> visualizationMetrics = {};
  
  // Settings used for rendering
  @ignore
  Map<String, dynamic> renderSettings = {};
  
  // User interactions
  int viewCount = 0;
  int shareCount = 0;
  bool isFavorite = false;
  
  // Tags and categories
  List<String> tags = [];
  String category = '';
  
  late DateTime createdAt;
  DateTime? lastViewedAt;
  
  // Export information
  List<String> exportedFormats = [];
  @ignore
  Map<String, String> exportPaths = {};
  
  ARVisualization({
    required this.outfitId,
    required this.bodyModelId,
    this.name = '',
    this.renderData = '',
    required this.createdAt,
  });
  
  static ARVisualization fromMap(Map<String, dynamic> map) {
    return ARVisualization(
      outfitId: map['outfitId'] ?? '',
      bodyModelId: map['bodyModelId'] ?? '',
      name: map['name'] ?? '',
      renderData: map['renderData'] ?? '',
      createdAt: map['createdAt'] != null ? DateTime.parse(map['createdAt']) : DateTime.now(),
    );
  }
}

// Fit Analysis
class FitAnalysis {
  final double overallScore; // 0.0 to 1.0
  final Map<String, double> itemFitScores; // itemId -> score
  final List<String> fitIssues;
  final List<String> recommendations;
  final Map<String, dynamic> detailedMetrics;

  const FitAnalysis({
    required this.overallScore,
    required this.itemFitScores,
    required this.fitIssues,
    required this.recommendations,
    this.detailedMetrics = const {},
  });

  static FitAnalysis fromMap(Map<String, dynamic> map) {
    return FitAnalysis(
      overallScore: (map['overallScore'] ?? 0.0).toDouble(),
      itemFitScores: Map<String, double>.from(map['itemFitScores'] ?? {}),
      fitIssues: List<String>.from(map['fitIssues'] ?? []),
      recommendations: List<String>.from(map['recommendations'] ?? []),
      detailedMetrics: Map<String, dynamic>.from(map['detailedMetrics'] ?? {}),
    );
  }
}

// Visualization Metrics
class VisualizationMetrics {
  final double renderTime;
  final double accuracy;
  final int polygonCount;
  final double frameRate;
  final Map<String, dynamic> performanceMetrics;

  const VisualizationMetrics({
    required this.renderTime,
    required this.accuracy,
    required this.polygonCount,
    required this.frameRate,
    this.performanceMetrics = const {},
  });

  static VisualizationMetrics fromMap(Map<String, dynamic> map) {
    return VisualizationMetrics(
      renderTime: (map['renderTime'] ?? 0.0).toDouble(),
      accuracy: (map['accuracy'] ?? 0.0).toDouble(),
      polygonCount: map['polygonCount'] ?? 0,
      frameRate: (map['frameRate'] ?? 0.0).toDouble(),
      performanceMetrics: Map<String, dynamic>.from(map['performanceMetrics'] ?? {}),
    );
  }
}

// AR Capture (Screenshot/Video)
@collection
class ARCapture {
  Id id = Isar.autoIncrement;
  
  @Index()
  late String visualizationId;
  
  @Enumerated(EnumType.name)
  late CaptureType type;
  
  late String filePath;
  String? thumbnailPath;
  
  // Media properties
  int? duration; // for videos, in milliseconds
  int? fileSize; // in bytes
  @ignore
  Map<String, int> dimensions = {}; // width, height
  
  // Metadata
  @ignore
  Map<String, dynamic> metadata = {};
  
  // User interaction
  bool isShared = false;
  int shareCount = 0;
  List<String> sharedPlatforms = [];
  
  DateTime createdAt = DateTime.now();

  ARCapture({
    required this.visualizationId,
    required this.type,
    required this.filePath,
    this.thumbnailPath,
    this.duration,
    this.fileSize,
  });
}

// Virtual Try-On Session
@collection
class VirtualTryOnSession {
  Id id = Isar.autoIncrement;
  
  @Index()
  late String userId;
  
  @Index()
  late String bodyModelId;
  
  List<String> itemIds = [];
  
  // Session data
  DateTime startTime = DateTime.now();
  DateTime? endTime;
  int duration = 0; // in seconds

  // Try-on results
  List<String> captureIds = [];
  @ignore
  Map<String, dynamic> sessionData = {};

  // User feedback
  double? satisfactionRating; // 1-5
  String? feedback;
  List<String> tags = [];

  VirtualTryOnSession({
    required this.userId,
    required this.bodyModelId,
    required this.itemIds,
    DateTime? startTime,
  }) {
    if (startTime != null) {
      this.startTime = startTime;
    }
  }
}

// Real-time Fit Feedback
class FitFeedback {
  final String itemId;
  final double fitScore;
  final List<String> issues;
  final List<String> suggestions;
  final Map<String, double> measurements;
  final DateTime timestamp;

  const FitFeedback({
    required this.itemId,
    required this.fitScore,
    required this.issues,
    required this.suggestions,
    required this.measurements,
    required this.timestamp,
  });

  static FitFeedback fromMap(Map<String, dynamic> map) {
    return FitFeedback(
      itemId: map['itemId'] ?? '',
      fitScore: (map['fitScore'] ?? 0.0).toDouble(),
      issues: List<String>.from(map['issues'] ?? []),
      suggestions: List<String>.from(map['suggestions'] ?? []),
      measurements: Map<String, double>.from(map['measurements'] ?? {}),
      timestamp: map['timestamp'] != null 
          ? DateTime.parse(map['timestamp'])
          : DateTime.now(),
    );
  }
}

// AR Visualization Settings
class ARVisualizationSettings {
  final double lightingIntensity;
  final String environmentMap;
  final bool enableShadows;
  final bool enableReflections;
  final double renderQuality; // 0.0 to 1.0
  final Map<String, dynamic> advancedSettings;

  const ARVisualizationSettings({
    this.lightingIntensity = 1.0,
    this.environmentMap = 'default',
    this.enableShadows = true,
    this.enableReflections = true,
    this.renderQuality = 0.8,
    this.advancedSettings = const {},
  });

  Map<String, dynamic> toMap() {
    return {
      'lightingIntensity': lightingIntensity,
      'environmentMap': environmentMap,
      'enableShadows': enableShadows,
      'enableReflections': enableReflections,
      'renderQuality': renderQuality,
      'advancedSettings': advancedSettings,
    };
  }
}

// Virtual Try-On Settings
class VirtualTryOnSettings {
  final bool enableRealTimeAnalysis;
  final double sensitivityLevel;
  final bool autoCapture;
  final int captureInterval; // seconds
  final Map<String, dynamic> cameraSettings;

  const VirtualTryOnSettings({
    this.enableRealTimeAnalysis = true,
    this.sensitivityLevel = 0.7,
    this.autoCapture = false,
    this.captureInterval = 30,
    this.cameraSettings = const {},
  });

  Map<String, dynamic> toMap() {
    return {
      'enableRealTimeAnalysis': enableRealTimeAnalysis,
      'sensitivityLevel': sensitivityLevel,
      'autoCapture': autoCapture,
      'captureInterval': captureInterval,
      'cameraSettings': cameraSettings,
    };
  }
}

// Capture Settings
class CaptureSettings {
  final int quality; // 1-100
  final String format;
  final Map<String, int> resolution; // width, height
  final bool includeBackground;
  final Map<String, dynamic> advancedSettings;

  const CaptureSettings({
    this.quality = 90,
    this.format = 'jpg',
    this.resolution = const {'width': 1080, 'height': 1920},
    this.includeBackground = false,
    this.advancedSettings = const {},
  });

  Map<String, dynamic> toMap() {
    return {
      'quality': quality,
      'format': format,
      'resolution': resolution,
      'includeBackground': includeBackground,
      'advancedSettings': advancedSettings,
    };
  }
}

// Export Settings
class ExportSettings {
  final double scale;
  final bool includeTextures;
  final bool includeAnimations;
  final String compressionLevel;
  final Map<String, dynamic> formatSpecificSettings;

  const ExportSettings({
    this.scale = 1.0,
    this.includeTextures = true,
    this.includeAnimations = false,
    this.compressionLevel = 'medium',
    this.formatSpecificSettings = const {},
  });

  Map<String, dynamic> toMap() {
    return {
      'scale': scale,
      'includeTextures': includeTextures,
      'includeAnimations': includeAnimations,
      'compressionLevel': compressionLevel,
      'formatSpecificSettings': formatSpecificSettings,
    };
  }
}

// Drape Analysis
class DrapeAnalysis {
  final double overallScore;
  final DrapeQuality drapeQuality;
  final Map<MovementType, double> movementScores;
  final List<String> issues;
  final List<String> recommendations;
  final Map<String, dynamic> detailedAnalysis;

  const DrapeAnalysis({
    required this.overallScore,
    required this.drapeQuality,
    required this.movementScores,
    required this.issues,
    required this.recommendations,
    this.detailedAnalysis = const {},
  });

  static DrapeAnalysis fromMap(Map<String, dynamic> map) {
    return DrapeAnalysis(
      overallScore: (map['overallScore'] ?? 0.0).toDouble(),
      drapeQuality: DrapeQuality.values.firstWhere(
        (e) => e.name == map['drapeQuality'],
        orElse: () => DrapeQuality.poor,
      ),
      movementScores: Map<MovementType, double>.fromEntries(
        (map['movementScores'] as Map? ?? {}).entries.map(
          (e) => MapEntry(
            MovementType.values.firstWhere((t) => t.name == e.key),
            (e.value ?? 0.0).toDouble(),
          ),
        ),
      ),
      issues: List<String>.from(map['issues'] ?? []),
      recommendations: List<String>.from(map['recommendations'] ?? []),
      detailedAnalysis: Map<String, dynamic>.from(map['detailedAnalysis'] ?? {}),
    );
  }
}

// AR Analytics
@collection
class ARAnalytics {
  Id id = Isar.autoIncrement;
  
  @Index()
  late String userId;
  
  @Index()
  late DateTime date;
  
  // Usage statistics
  int sessionsCount = 0;
  int totalDuration = 0; // seconds
  int visualizationsCreated = 0;
  int capturesTaken = 0;
  
  // Feature usage
  Map<String, int> featureUsage = {}; // feature -> count
  
  // Performance metrics
  double averageRenderTime = 0.0;
  double averageFrameRate = 0.0;
  Map<String, double> performanceMetrics = {};
  
  // User engagement
  double averageSessionDuration = 0.0;
  int sharesCount = 0;
  int savesCount = 0;
  
  ARAnalytics({
    required this.userId,
    DateTime? date,
  }) {
    this.date = date ?? DateTime.now();
  }
}

// Body Measurement Template
class BodyMeasurementTemplate {
  static const Map<String, String> requiredMeasurements = {
    'height': 'Height',
    'chest': 'Chest/Bust',
    'waist': 'Waist',
    'hips': 'Hips',
    'shoulder_width': 'Shoulder Width',
    'arm_length': 'Arm Length',
    'inseam': 'Inseam',
    'neck': 'Neck',
  };

  static const Map<String, String> optionalMeasurements = {
    'bicep': 'Bicep',
    'forearm': 'Forearm',
    'thigh': 'Thigh',
    'calf': 'Calf',
    'ankle': 'Ankle',
    'wrist': 'Wrist',
    'torso_length': 'Torso Length',
    'rise': 'Rise',
  };

  static List<String> getAllMeasurements() {
    return [...requiredMeasurements.keys, ...optionalMeasurements.keys];
  }

  static bool isRequired(String measurement) {
    return requiredMeasurements.containsKey(measurement);
  }

  static String getDisplayName(String measurement) {
    return requiredMeasurements[measurement] ?? 
           optionalMeasurements[measurement] ?? 
           measurement;
  }
}