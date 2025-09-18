import 'package:isar/isar.dart';
import 'clothing_item.dart';

part 'ai_models.g.dart';

enum ColorHarmony { complementary, analogous, triadic, monochromatic, split, square, unknown }
enum TextureType { smooth, rough, knit, woven, leather, synthetic, unknown }
enum ItemCondition { new_, excellent, good, fair, poor, damaged, unknown }

// Main analysis result
class ClothingAnalysisResult {
  final double confidence;
  final String? error;
  final List<DetectedClothingItem> detectedItems;
  final Map<String, dynamic> combinedData;
  final List<Map<String, dynamic>> serviceResults;
  final String? detectedBrand;

  const ClothingAnalysisResult({
    required this.confidence,
    this.error,
    required this.detectedItems,
    this.combinedData = const {},
    this.serviceResults = const [],
    this.detectedBrand,
  });
}

// Detected clothing item from AI analysis
class DetectedClothingItem {
  final ClothingType type;
  final String name;
  final double confidence;
  final List<String> colors;
  final List<String> attributes;
  final Map<String, double> boundingBox;

  const DetectedClothingItem({
    required this.type,
    required this.name,
    required this.confidence,
    required this.colors,
    required this.attributes,
    this.boundingBox = const {},
  });

  static DetectedClothingItem fromMap(Map<String, dynamic> map) {
    return DetectedClothingItem(
      type: ClothingType.values.firstWhere(
        (e) => e.name == map['type'],
        orElse: () => ClothingType.top,
      ),
      name: map['name'] ?? '',
      confidence: (map['confidence'] ?? 0.0).toDouble(),
      colors: List<String>.from(map['colors'] ?? []),
      attributes: List<String>.from(map['attributes'] ?? []),
      boundingBox: Map<String, double>.from(map['boundingBox'] ?? {}),
    );
  }
}

// Comprehensive clothing attributes
class ClothingAttributes {
  final ClothingType type;
  final List<String> colors;
  final List<String> patterns;
  final List<String> materials;
  final String style;
  final double confidence;
  final Map<String, dynamic> additionalAttributes;

  const ClothingAttributes({
    required this.type,
    required this.colors,
    required this.patterns,
    required this.materials,
    required this.style,
    required this.confidence,
    this.additionalAttributes = const {},
  });

  static ClothingAttributes fromMap(Map<String, dynamic> map) {
    return ClothingAttributes(
      type: ClothingType.values.firstWhere(
        (e) => e.name == map['type'],
        orElse: () => ClothingType.top,
      ),
      colors: List<String>.from(map['colors'] ?? []),
      patterns: List<String>.from(map['patterns'] ?? []),
      materials: List<String>.from(map['materials'] ?? []),
      style: map['style'] ?? '',
      confidence: (map['confidence'] ?? 0.0).toDouble(),
      additionalAttributes: Map<String, dynamic>.from(map['additionalAttributes'] ?? {}),
    );
  }
}

// Smart tag with confidence score
class SmartTag {
  final String tag;
  final double confidence;
  final String category;
  final Map<String, dynamic> metadata;

  const SmartTag({
    required this.tag,
    required this.confidence,
    this.category = 'general',
    this.metadata = const {},
  });

  static SmartTag fromMap(Map<String, dynamic> map) {
    return SmartTag(
      tag: map['tag'] ?? '',
      confidence: (map['confidence'] ?? 0.0).toDouble(),
      category: map['category'] ?? 'general',
      metadata: Map<String, dynamic>.from(map['metadata'] ?? {}),
    );
  }
}

// Style classification result
class StyleClassification {
  final String primaryStyle;
  final double confidence;
  final List<String> alternativeStyles;
  final Map<String, double> styleAttributes;

  const StyleClassification({
    required this.primaryStyle,
    required this.confidence,
    required this.alternativeStyles,
    this.styleAttributes = const {},
  });

  static StyleClassification fromMap(Map<String, dynamic> map) {
    return StyleClassification(
      primaryStyle: map['primaryStyle'] ?? '',
      confidence: (map['confidence'] ?? 0.0).toDouble(),
      alternativeStyles: List<String>.from(map['alternativeStyles'] ?? []),
      styleAttributes: Map<String, double>.from(map['styleAttributes'] ?? {}),
    );
  }
}

// Color analysis result
class ColorAnalysisResult {
  final List<String> dominantColors;
  final List<String> colorPalette;
  final ColorHarmony colorHarmony;
  final double confidence;
  final Map<String, dynamic> colorMetrics;

  const ColorAnalysisResult({
    required this.dominantColors,
    required this.colorPalette,
    required this.colorHarmony,
    required this.confidence,
    this.colorMetrics = const {},
  });

  static ColorAnalysisResult fromMap(Map<String, dynamic> map) {
    return ColorAnalysisResult(
      dominantColors: List<String>.from(map['dominantColors'] ?? []),
      colorPalette: List<String>.from(map['colorPalette'] ?? []),
      colorHarmony: ColorHarmony.values.firstWhere(
        (e) => e.name == map['colorHarmony'],
        orElse: () => ColorHarmony.unknown,
      ),
      confidence: (map['confidence'] ?? 0.0).toDouble(),
      colorMetrics: Map<String, dynamic>.from(map['colorMetrics'] ?? {}),
    );
  }
}

// Fabric and material analysis
class FabricAnalysis {
  final String material;
  final TextureType texture;
  final double confidence;
  final Map<String, dynamic> properties;

  const FabricAnalysis({
    required this.material,
    required this.texture,
    required this.confidence,
    this.properties = const {},
  });

  static FabricAnalysis fromMap(Map<String, dynamic> map) {
    return FabricAnalysis(
      material: map['material'] ?? '',
      texture: TextureType.values.firstWhere(
        (e) => e.name == map['texture'],
        orElse: () => TextureType.unknown,
      ),
      confidence: (map['confidence'] ?? 0.0).toDouble(),
      properties: Map<String, dynamic>.from(map['properties'] ?? {}),
    );
  }
}

// Brand detection result
class BrandDetectionResult {
  final String brand;
  final double confidence;
  final bool logoDetected;
  final bool tagDetected;
  final List<Map<String, double>> boundingBoxes;

  const BrandDetectionResult({
    required this.brand,
    required this.confidence,
    required this.logoDetected,
    required this.tagDetected,
    this.boundingBoxes = const [],
  });

  static BrandDetectionResult fromMap(Map<String, dynamic> map) {
    return BrandDetectionResult(
      brand: map['brand'] ?? '',
      confidence: (map['confidence'] ?? 0.0).toDouble(),
      logoDetected: map['logoDetected'] ?? false,
      tagDetected: map['tagDetected'] ?? false,
      boundingBoxes: (map['boundingBoxes'] as List? ?? [])
          .map((box) => Map<String, double>.from(box))
          .toList(),
    );
  }
}

// Size estimation result
class SizeEstimation {
  final String estimatedSize;
  final double confidence;
  final Map<String, double> measurements;
  final Map<String, String> sizeChart;

  const SizeEstimation({
    required this.estimatedSize,
    required this.confidence,
    this.measurements = const {},
    this.sizeChart = const {},
  });

  static SizeEstimation fromMap(Map<String, dynamic> map) {
    return SizeEstimation(
      estimatedSize: map['estimatedSize'] ?? '',
      confidence: (map['confidence'] ?? 0.0).toDouble(),
      measurements: Map<String, double>.from(map['measurements'] ?? {}),
      sizeChart: Map<String, String>.from(map['sizeChart'] ?? {}),
    );
  }
}

// Condition assessment result
class ConditionAssessment {
  final ItemCondition condition;
  final double confidence;
  final List<String> issues;
  final double qualityScore;

  const ConditionAssessment({
    required this.condition,
    required this.confidence,
    required this.issues,
    required this.qualityScore,
  });

  static ConditionAssessment fromMap(Map<String, dynamic> map) {
    return ConditionAssessment(
      condition: ItemCondition.values.firstWhere(
        (e) => e.name == map['condition'],
        orElse: () => ItemCondition.unknown,
      ),
      confidence: (map['confidence'] ?? 0.0).toDouble(),
      issues: List<String>.from(map['issues'] ?? []),
      qualityScore: (map['qualityScore'] ?? 0.0).toDouble(),
    );
  }
}

// AI analysis options
class AIAnalysisOptions {
  final bool includeColorAnalysis;
  final bool includeFabricAnalysis;
  final bool includeBrandDetection;
  final bool includeStyleClassification;
  final bool includeSizeEstimation;
  final bool includeConditionAssessment;
  final double confidenceThreshold;
  final List<String> customCategories;

  const AIAnalysisOptions({
    this.includeColorAnalysis = true,
    this.includeFabricAnalysis = true,
    this.includeBrandDetection = false,
    this.includeStyleClassification = true,
    this.includeSizeEstimation = false,
    this.includeConditionAssessment = true,
    this.confidenceThreshold = 0.7,
    this.customCategories = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'includeColorAnalysis': includeColorAnalysis,
      'includeFabricAnalysis': includeFabricAnalysis,
      'includeBrandDetection': includeBrandDetection,
      'includeStyleClassification': includeStyleClassification,
      'includeSizeEstimation': includeSizeEstimation,
      'includeConditionAssessment': includeConditionAssessment,
      'confidenceThreshold': confidenceThreshold,
      'customCategories': customCategories,
    };
  }
}

// Stored AI analysis results
@collection
class AIAnalysisHistory {
  Id id = Isar.autoIncrement;
  
  @Index()
  late String itemId;
  
  @Index()
  late DateTime analyzedAt;
  
  // Analysis results
  late String analysisType; // 'full', 'attributes', 'color', etc.
  late double confidence;
  @ignore
  Map<String, dynamic> results = {};
  
  // AI service used
  late String aiService;
  String? modelVersion;
  
  // Processing time
  int? processingTime; // milliseconds
  
  // User feedback on accuracy
  bool? wasAccurate;
  String? userFeedback;
  
  AIAnalysisHistory();
}

// AI training data for improving models
@collection
class AITrainingData {
  Id id = Isar.autoIncrement;
  
  @Index()
  late String itemId;
  
  late String imagePath;
  
  // Ground truth labels
  @ignore
  Map<String, dynamic> groundTruth = {};
  
  // AI predictions
  @ignore
  Map<String, dynamic> predictions = {};
  
  // User corrections
  @ignore
  Map<String, dynamic> userCorrections = {};
  
  // Metadata
  @ignore
  Map<String, dynamic> metadata = {};
  
  late DateTime createdAt;
  
  // Training status
  bool isUsedForTraining = false;
  DateTime? trainedAt;
  
  AITrainingData();
}

// AI model performance metrics
@collection
class AIModelMetrics {
  Id id = Isar.autoIncrement;
  
  late String modelName;
  late String modelVersion;
  
  @Index()
  late DateTime evaluatedAt;
  
  // Performance metrics
  double accuracy = 0.0;
  double precision = 0.0;
  double recall = 0.0;
  double f1Score = 0.0;
  
  // Category-specific metrics
  @ignore
  Map<String, double> categoryAccuracy = {};
  
  // Error analysis
  @ignore
  Map<String, int> errorTypes = {};
  List<String> commonMistakes = [];
  
  // User feedback metrics
  double userSatisfaction = 0.0;
  int totalFeedback = 0;
  
  AIModelMetrics();
}

// Custom AI tagging rules
@collection
class CustomTaggingRule {
  Id id = Isar.autoIncrement;
  
  @Index()
  late String userId;
  
  late String ruleName;
  String? description;
  
  // Rule conditions
  @ignore
  Map<String, dynamic> conditions = {}; // color, pattern, style, etc.
  
  // Rule actions
  List<String> tagsToAdd = [];
  List<String> tagsToRemove = [];
  String? categoryToAssign;
  
  // Rule priority and status
  int priority = 0;
  bool isActive = true;
  
  // Usage statistics
  int timesTriggered = 0;
  DateTime? lastTriggered;
  
  late DateTime createdAt;
  late DateTime updatedAt;
  
  CustomTaggingRule();
}

// AI confidence calibration data
@collection
class ConfidenceCalibration {
  Id id = Isar.autoIncrement;
  
  late String modelType; // 'color', 'style', 'fabric', etc.
  
  // Confidence buckets (0.0-0.1, 0.1-0.2, etc.)
  @ignore
  Map<String, int> confidenceBuckets = {};
  @ignore
  Map<String, double> actualAccuracy = {};
  
  // Calibration metrics
  double expectedCalibrationError = 0.0;
  double maximumCalibrationError = 0.0;
  
  @Index()
  late DateTime calculatedAt;
  
  ConfidenceCalibration();
}

// AI suggestion feedback
@collection
class AISuggestionFeedback {
  Id id = Isar.autoIncrement;
  
  @Index()
  late String userId;
  
  @Index()
  late String itemId;
  
  late String suggestionType; // 'tag', 'category', 'style', etc.
  late String suggestion;
  late double aiConfidence;
  
  // User response
  @Enumerated(EnumType.name)
  late FeedbackType userFeedback;
  
  String? userCorrection;
  DateTime? respondedAt;
  
  late DateTime createdAt;
  
  AISuggestionFeedback();
}

enum FeedbackType {
  accepted,
  rejected,
  modified,
  ignored,
}

// Batch processing job
@collection
class AIBatchJob {
  Id id = Isar.autoIncrement;
  
  @Index()
  late String userId;
  
  late String jobType; // 'analyze_all', 'retag_items', etc.
  late String jobName;
  
  // Job parameters
  @ignore
  Map<String, dynamic> parameters = {};
  
  // Progress tracking
  @Enumerated(EnumType.name)
  late BatchJobStatus status;
  
  int totalItems = 0;
  int processedItems = 0;
  int successfulItems = 0;
  int failedItems = 0;
  
  // Timing
  late DateTime createdAt;
  DateTime? startedAt;
  DateTime? completedAt;
  
  // Results
  @ignore
  Map<String, dynamic> results = {};
  List<String> errorMessages = [];
  
  AIBatchJob();
}

enum BatchJobStatus {
  pending,
  running,
  completed,
  failed,
  cancelled,
}

// AI feature flags and settings
@collection
class AISettings {
  Id id = Isar.autoIncrement;
  
  @Index(unique: true)
  late String userId;
  
  // Feature toggles
  bool enableAutoTagging = true;
  bool enableBrandDetection = false;
  bool enableSizeEstimation = false;
  bool enableConditionAssessment = true;
  
  // Quality settings
  double minimumConfidence = 0.7;
  bool requireMultipleServices = false;
  
  // Privacy settings
  bool allowDataCollection = true;
  bool allowModelTraining = true;
  
  // Notification preferences
  bool notifyOnAnalysisComplete = true;
  bool notifyOnLowConfidence = false;
  
  late DateTime updatedAt;
  
  AISettings();
}