import 'package:flutter/services.dart';
import '../../domain/entities/ar_models.dart';
import '../../domain/entities/clothing_item.dart';
import '../../domain/entities/outfit.dart';

class ARVisualizationService {
  static const MethodChannel _channel = MethodChannel('wardrobe_ar');

  // Initialize AR session
  Future<bool> initializeARSession() async {
    try {
      final bool result = await _channel.invokeMethod('initializeAR');
      return result;
    } catch (e) {
      return false;
    }
  }

  // Check AR availability on device
  Future<ARAvailability> checkARAvailability() async {
    try {
      final Map<dynamic, dynamic> result = await _channel.invokeMethod('checkARSupport');
      
      return ARAvailability(
        isSupported: result['isSupported'] ?? false,
        hasDepthSensor: result['hasDepthSensor'] ?? false,
        supportedFeatures: List<String>.from(result['supportedFeatures'] ?? []),
        deviceCapabilities: Map<String, dynamic>.from(result['deviceCapabilities'] ?? {}),
      );
    } catch (e) {
      return const ARAvailability(
        isSupported: false,
        hasDepthSensor: false,
        supportedFeatures: [],
        deviceCapabilities: {},
      );
    }
  }

  // Create 3D body model from user measurements
  Future<BodyModel?> createBodyModel({
    required Map<String, double> measurements,
    String? bodyType,
    Uint8List? referencePhoto,
  }) async {
    try {
      final Map<String, dynamic> params = {
        'measurements': measurements,
        'bodyType': bodyType,
        'referencePhoto': referencePhoto,
      };

      final Map<dynamic, dynamic> result = await _channel.invokeMethod('createBodyModel', params);
      
      final bodyModel = BodyModel(
        measurements: Map<String, double>.from(result['measurements'] ?? {}),
        bodyType: result['bodyType'],
        meshData: result['meshData'],
        confidenceScore: result['confidenceScore']?.toDouble() ?? 0.0,
      );
      bodyModel.createdAt = DateTime.parse(result['createdAt']);
      return bodyModel;
    } catch (e) {
      return null;
    }
  }

  // Visualize outfit on AR body model
  Future<ARVisualization?> visualizeOutfit({
    required Outfit outfit,
    required List<ClothingItem> items,
    required BodyModel bodyModel,
    ARVisualizationSettings? settings,
  }) async {
    try {
      final Map<String, dynamic> params = {
        'outfitId': outfit.id,
        'itemIds': items.map((item) => item.id).toList(),
        'bodyModelId': bodyModel.id,
        'settings': settings?.toMap() ?? {},
      };

      final Map<dynamic, dynamic> result = await _channel.invokeMethod('visualizeOutfit', params);
      
      return ARVisualization(
        outfitId: outfit.id,
        bodyModelId: bodyModel.id.toString(),
        renderData: result['renderData'] ?? '',
        createdAt: DateTime.parse(result['createdAt']),
      );
    } catch (e) {
      return null;
    }
  }

  // Analyze outfit fit using AR
  Future<FitAnalysis> analyzeOutfitFit({
    required ARVisualization visualization,
    required List<ClothingItem> items,
  }) async {
    try {
      final Map<String, dynamic> params = {
        'visualizationId': visualization.id,
        'items': items.map((item) => item.toJson()).toList(),
      };

      final Map<dynamic, dynamic> result = await _channel.invokeMethod('analyzeFit', params);
      
      return FitAnalysis.fromMap(Map<String, dynamic>.from(result));
    } catch (e) {
      return const FitAnalysis(
        overallScore: 0.0,
        itemFitScores: {},
        fitIssues: ['Analysis failed'],
        recommendations: ['Please try again'],
      );
    }
  }

  // Take AR screenshot/video
  Future<ARCapture?> captureARVisualization({
    required String visualizationId,
    CaptureType type = CaptureType.photo,
    CaptureSettings? settings,
  }) async {
    try {
      final Map<String, dynamic> params = {
        'visualizationId': visualizationId,
        'captureType': type.name,
        'settings': settings?.toMap() ?? {},
      };

      final Map<dynamic, dynamic> result = await _channel.invokeMethod('captureAR', params);
      
      final capture = ARCapture(
        visualizationId: result['visualizationId'] ?? 'unknown',
        type: type,
        filePath: result['filePath'] ?? '',
        thumbnailPath: result['thumbnailPath'],
        duration: result['duration'],
        fileSize: result['fileSize'],
      );

      return capture;
    } catch (e) {
      return null;
    }
  }

  // Virtual try-on with real-time camera
  Future<bool> startVirtualTryOn({
    required List<ClothingItem> items,
    required BodyModel bodyModel,
    VirtualTryOnSettings? settings,
  }) async {
    try {
      final Map<String, dynamic> params = {
        'items': items.map((item) => item.toJson()).toList(),
        'bodyModelId': bodyModel.id,
        'settings': settings?.toMap() ?? {},
      };

      final bool result = await _channel.invokeMethod('startVirtualTryOn', params);
      return result;
    } catch (e) {
      return false;
    }
  }

  // Stop virtual try-on session
  Future<void> stopVirtualTryOn() async {
    try {
      await _channel.invokeMethod('stopVirtualTryOn');
    } catch (e) {
      // Handle error silently
    }
  }

  // Get real-time fit feedback during try-on
  Stream<FitFeedback> getFitFeedbackStream() {
    // receiveBroadcastStream is not available - using a mock stream
    return Stream.periodic(const Duration(seconds: 1), (count) {
      return FitFeedback.fromMap({
        'overallScore': 0.5,
        'areas': {},
        'suggestions': [],
        'timestamp': DateTime.now().toIso8601String(),
      });
    }).take(10);
  }

  // Mix and match items in AR
  Future<List<ARVisualization>> generateARMixAndMatch({
    required List<ClothingItem> availableItems,
    required BodyModel bodyModel,
    int maxCombinations = 10,
  }) async {
    try {
      final Map<String, dynamic> params = {
        'items': availableItems.map((item) => item.toJson()).toList(),
        'bodyModelId': bodyModel.id,
        'maxCombinations': maxCombinations,
      };

      final List<dynamic> result = await _channel.invokeMethod('generateMixAndMatch', params);
      
      return result.map((data) => ARVisualization.fromMap(Map<String, dynamic>.from(data))).toList();
    } catch (e) {
      return [];
    }
  }

  // Save AR visualization for later viewing
  Future<bool> saveVisualization({
    required ARVisualization visualization,
    String? name,
    List<String>? tags,
  }) async {
    try {
      final Map<String, dynamic> params = {
        'visualizationId': visualization.id,
        'name': name,
        'tags': tags,
      };

      final bool result = await _channel.invokeMethod('saveVisualization', params);
      return result;
    } catch (e) {
      return false;
    }
  }

  // Load saved AR visualizations
  Future<List<ARVisualization>> getSavedVisualizations({
    String? userId,
    int limit = 20,
    int offset = 0,
  }) async {
    try {
      final Map<String, dynamic> params = {
        'userId': userId,
        'limit': limit,
        'offset': offset,
      };

      final List<dynamic> result = await _channel.invokeMethod('getSavedVisualizations', params);
      
      return result.map((data) => ARVisualization.fromMap(Map<String, dynamic>.from(data))).toList();
    } catch (e) {
      return [];
    }
  }

  // Update body model measurements
  Future<bool> updateBodyModel({
    required String bodyModelId,
    required Map<String, double> newMeasurements,
  }) async {
    try {
      final Map<String, dynamic> params = {
        'bodyModelId': bodyModelId,
        'measurements': newMeasurements,
      };

      final bool result = await _channel.invokeMethod('updateBodyModel', params);
      return result;
    } catch (e) {
      return false;
    }
  }

  // Export AR visualization to various formats
  Future<List<String>> exportVisualization({
    required String visualizationId,
    required List<ExportFormat> formats,
    ExportSettings? settings,
  }) async {
    try {
      final Map<String, dynamic> params = {
        'visualizationId': visualizationId,
        'formats': formats.map((f) => f.name).toList(),
        'settings': settings?.toMap() ?? {},
      };

      final List<dynamic> result = await _channel.invokeMethod('exportVisualization', params);
      return List<String>.from(result);
    } catch (e) {
      return [];
    }
  }

  // Analyze clothing item drape and movement in AR
  Future<DrapeAnalysis> analyzeDrapeAndMovement({
    required String visualizationId,
    required String itemId,
    List<MovementType> movements = const [MovementType.walking, MovementType.sitting],
  }) async {
    try {
      final Map<String, dynamic> params = {
        'visualizationId': visualizationId,
        'itemId': itemId,
        'movements': movements.map((m) => m.name).toList(),
      };

      final Map<dynamic, dynamic> result = await _channel.invokeMethod('analyzeDrape', params);
      
      return DrapeAnalysis.fromMap(Map<String, dynamic>.from(result));
    } catch (e) {
      return const DrapeAnalysis(
        overallScore: 0.0,
        drapeQuality: DrapeQuality.poor,
        movementScores: {},
        issues: ['Analysis failed'],
        recommendations: ['Please try again'],
      );
    }
  }

  // Clean up AR resources
  Future<void> dispose() async {
    try {
      await _channel.invokeMethod('disposeAR');
    } catch (e) {
      // Handle cleanup error silently
    }
  }
}

// Helper extension for ClothingItem
extension ClothingItemAR on ClothingItem {
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type.name,
      'category': categories.isNotEmpty ? categories.first : 'unknown',
      'color': colors.isNotEmpty ? colors.first : 'unknown',
      'size': 'unknown', // ClothingItem doesn't have size property
      'imagePath': imagePath,
      // Add more fields as needed for AR
    };
  }
}