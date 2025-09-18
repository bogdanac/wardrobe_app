import 'dart:io';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../domain/entities/ai_models.dart';
import '../../domain/entities/clothing_item.dart';

class AITaggingService {
  static const String _visionApiKey = 'YOUR_GOOGLE_VISION_API_KEY';
  static const String _openAIApiKey = 'YOUR_OPENAI_API_KEY';

  static const MethodChannel _channel = MethodChannel('wardrobe_ai');

  // Initialize AI models
  Future<bool> initializeModels() async {
    try {
      final bool result = await _channel.invokeMethod('initializeAI');
      return result;
    } catch (e) {
      return false;
    }
  }

  // Comprehensive image analysis using multiple AI services
  Future<ClothingAnalysisResult> analyzeClothingImage({
    required String imagePath,
    bool useMultipleServices = true,
    AIAnalysisOptions? options,
  }) async {
    try {
      final File imageFile = File(imagePath);
      final Uint8List imageBytes = await imageFile.readAsBytes();

      final results = <AIServiceResult>[];

      // Use multiple AI services for comprehensive analysis
      if (useMultipleServices) {
        // Google Vision API
        final visionResult = await _analyzeWithGoogleVision(imageBytes);
        results.add(visionResult);

        // Custom trained model
        final customResult = await _analyzeWithCustomModel(imageBytes);
        results.add(customResult);

        // OpenAI Vision
        final openAIResult = await _analyzeWithOpenAI(imageBytes);
        results.add(openAIResult);
      } else {
        // Use most accurate single service
        final result = await _analyzeWithCustomModel(imageBytes);
        results.add(result);
      }

      // Combine and validate results
      return _combineAnalysisResults(results, options);
    } catch (e) {
      return ClothingAnalysisResult(
        confidence: 0.0,
        error: 'Analysis failed: $e',
        detectedItems: [],
      );
    }
  }

  // Advanced clothing attribute detection
  Future<ClothingAttributes> detectClothingAttributes({
    required String imagePath,
    bool includeStyle = true,
    bool includeFabric = true,
    bool includeBrand = false,
  }) async {
    try {
      final Map<String, dynamic> params = {
        'imagePath': imagePath,
        'includeStyle': includeStyle,
        'includeFabric': includeFabric,
        'includeBrand': includeBrand,
      };

      final Map<dynamic, dynamic> result = await _channel.invokeMethod('detectAttributes', params);
      
      return ClothingAttributes.fromMap(Map<String, dynamic>.from(result));
    } catch (e) {
      return const ClothingAttributes(
        type: ClothingType.top,
        colors: [],
        patterns: [],
        materials: [],
        style: '',
        confidence: 0.0,
      );
    }
  }

  // Smart auto-tagging based on image content
  Future<List<SmartTag>> generateSmartTags({
    required String imagePath,
    int maxTags = 10,
    double confidenceThreshold = 0.7,
  }) async {
    try {
      final Map<String, dynamic> params = {
        'imagePath': imagePath,
        'maxTags': maxTags,
        'confidenceThreshold': confidenceThreshold,
      };

      final List<dynamic> result = await _channel.invokeMethod('generateTags', params);
      
      return result.map((data) => SmartTag.fromMap(Map<String, dynamic>.from(data))).toList();
    } catch (e) {
      return [];
    }
  }

  // Style classification using deep learning
  Future<StyleClassification> classifyStyle({
    required String imagePath,
    List<String>? customStyles,
  }) async {
    try {
      final Map<String, dynamic> params = {
        'imagePath': imagePath,
        'customStyles': customStyles,
      };

      final Map<dynamic, dynamic> result = await _channel.invokeMethod('classifyStyle', params);
      
      return StyleClassification.fromMap(Map<String, dynamic>.from(result));
    } catch (e) {
      return const StyleClassification(
        primaryStyle: 'casual',
        confidence: 0.0,
        alternativeStyles: [],
        styleAttributes: {},
      );
    }
  }

  // Color analysis and palette extraction
  Future<ColorAnalysisResult> analyzeColors({
    required String imagePath,
    int maxColors = 5,
    bool includeColorHarmony = true,
  }) async {
    try {
      final Map<String, dynamic> params = {
        'imagePath': imagePath,
        'maxColors': maxColors,
        'includeColorHarmony': includeColorHarmony,
      };

      final Map<dynamic, dynamic> result = await _channel.invokeMethod('analyzeColors', params);
      
      return ColorAnalysisResult.fromMap(Map<String, dynamic>.from(result));
    } catch (e) {
      return const ColorAnalysisResult(
        dominantColors: [],
        colorPalette: [],
        colorHarmony: ColorHarmony.unknown,
        confidence: 0.0,
      );
    }
  }

  // Fabric and material recognition
  Future<FabricAnalysis> analyzeFabric({
    required String imagePath,
    bool includeTextureAnalysis = true,
  }) async {
    try {
      final Map<String, dynamic> params = {
        'imagePath': imagePath,
        'includeTextureAnalysis': includeTextureAnalysis,
      };

      final Map<dynamic, dynamic> result = await _channel.invokeMethod('analyzeFabric', params);
      
      return FabricAnalysis.fromMap(Map<String, dynamic>.from(result));
    } catch (e) {
      return const FabricAnalysis(
        material: 'unknown',
        texture: TextureType.unknown,
        confidence: 0.0,
        properties: {},
      );
    }
  }

  // Brand and logo detection
  Future<BrandDetectionResult> detectBrand({
    required String imagePath,
    bool includeLogos = true,
    bool includeTags = true,
  }) async {
    try {
      final Map<String, dynamic> params = {
        'imagePath': imagePath,
        'includeLogos': includeLogos,
        'includeTags': includeTags,
      };

      final Map<dynamic, dynamic> result = await _channel.invokeMethod('detectBrand', params);
      
      return BrandDetectionResult.fromMap(Map<String, dynamic>.from(result));
    } catch (e) {
      return const BrandDetectionResult(
        brand: '',
        confidence: 0.0,
        logoDetected: false,
        tagDetected: false,
        boundingBoxes: [],
      );
    }
  }

  // Size and fit estimation from image
  Future<SizeEstimation> estimateSize({
    required String imagePath,
    String? referenceObject,
    Map<String, double>? bodyMeasurements,
  }) async {
    try {
      final Map<String, dynamic> params = {
        'imagePath': imagePath,
        'referenceObject': referenceObject,
        'bodyMeasurements': bodyMeasurements,
      };

      final Map<dynamic, dynamic> result = await _channel.invokeMethod('estimateSize', params);
      
      return SizeEstimation.fromMap(Map<String, dynamic>.from(result));
    } catch (e) {
      return const SizeEstimation(
        estimatedSize: 'unknown',
        confidence: 0.0,
        measurements: {},
        sizeChart: {},
      );
    }
  }

  // Condition assessment (new, used, damaged)
  Future<ConditionAssessment> assessCondition({
    required String imagePath,
    bool detectDamage = true,
    bool detectWear = true,
  }) async {
    try {
      final Map<String, dynamic> params = {
        'imagePath': imagePath,
        'detectDamage': detectDamage,
        'detectWear': detectWear,
      };

      final Map<dynamic, dynamic> result = await _channel.invokeMethod('assessCondition', params);
      
      return ConditionAssessment.fromMap(Map<String, dynamic>.from(result));
    } catch (e) {
      return const ConditionAssessment(
        condition: ItemCondition.unknown,
        confidence: 0.0,
        issues: [],
        qualityScore: 0.0,
      );
    }
  }

  // Batch processing for multiple images
  Future<List<ClothingAnalysisResult>> batchAnalyzeImages({
    required List<String> imagePaths,
    AIAnalysisOptions? options,
    Function(int, int)? progressCallback,
  }) async {
    final results = <ClothingAnalysisResult>[];

    for (int i = 0; i < imagePaths.length; i++) {
      progressCallback?.call(i, imagePaths.length);
      
      final result = await analyzeClothingImage(
        imagePath: imagePaths[i],
        options: options,
      );
      results.add(result);
      
      // Add small delay to prevent API rate limiting
      await Future.delayed(const Duration(milliseconds: 100));
    }

    return results;
  }

  // Update clothing item with AI analysis
  Future<ClothingItem> enrichClothingItemWithAI({
    required ClothingItem item,
    bool overwriteExisting = false,
  }) async {
    if (item.imagePath == null) {
      return item;
    }

    try {
      // Perform comprehensive analysis
      final analysis = await analyzeClothingImage(
        imagePath: item.imagePath!,
        useMultipleServices: true,
      );

      final attributes = await detectClothingAttributes(imagePath: item.imagePath!);
      final tags = await generateSmartTags(imagePath: item.imagePath!);
      final styleClass = await classifyStyle(imagePath: item.imagePath!);

      // Create enriched item
      final enrichedItem = item.copyWith(
        type: attributes.type,
        brand: overwriteExisting || (item.brand?.isEmpty ?? true) ? analysis.detectedBrand ?? item.brand : item.brand,
        colors: overwriteExisting || item.colors.isEmpty ? attributes.colors : item.colors,
        tags: overwriteExisting ? tags.map((t) => t.tag).toList() : [...item.tags, ...tags.map((t) => t.tag)],
        season: _inferSeasons(attributes, styleClass).isNotEmpty ? _inferSeasons(attributes, styleClass).first : item.season,
        weatherRanges: _inferWeatherRanges(attributes),
        updatedAt: DateTime.now(),
      );

      return enrichedItem;
    } catch (e) {
      return item;
    }
  }

  // Private helper methods
  Future<AIServiceResult> _analyzeWithGoogleVision(Uint8List imageBytes) async {
    try {
      final String base64Image = base64Encode(imageBytes);
      
      final response = await http.post(
        Uri.parse('https://vision.googleapis.com/v1/images:annotate?key=$_visionApiKey'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'requests': [{
            'image': {'content': base64Image},
            'features': [
              {'type': 'LABEL_DETECTION', 'maxResults': 10},
              {'type': 'OBJECT_LOCALIZATION', 'maxResults': 10},
              {'type': 'IMAGE_PROPERTIES'}
            ]
          }]
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return _parseGoogleVisionResponse(data);
      }

      return const AIServiceResult(service: 'google_vision', confidence: 0.0, data: {});
    } catch (e) {
      return AIServiceResult(service: 'google_vision', confidence: 0.0, data: {}, error: e.toString());
    }
  }

  Future<AIServiceResult> _analyzeWithCustomModel(Uint8List imageBytes) async {
    try {
      final Map<String, dynamic> params = {
        'imageBytes': imageBytes,
        'modelType': 'clothing_classifier',
      };

      final Map<dynamic, dynamic> result = await _channel.invokeMethod('analyzeWithCustomModel', params);
      
      return AIServiceResult.fromMap(result);
    } catch (e) {
      return AIServiceResult(service: 'custom_model', confidence: 0.0, data: {}, error: e.toString());
    }
  }

  Future<AIServiceResult> _analyzeWithOpenAI(Uint8List imageBytes) async {
    try {
      final String base64Image = base64Encode(imageBytes);
      
      final response = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_openAIApiKey',
        },
        body: jsonEncode({
          'model': 'gpt-4-vision-preview',
          'messages': [{
            'role': 'user',
            'content': [
              {
                'type': 'text',
                'text': 'Analyze this clothing item and provide: type, color, style, material, pattern, brand (if visible), condition, and any other relevant details. Format as JSON.'
              },
              {
                'type': 'image_url',
                'image_url': {
                  'url': 'data:image/jpeg;base64,$base64Image'
                }
              }
            ]
          }],
          'max_tokens': 300
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return _parseOpenAIResponse(data);
      }

      return const AIServiceResult(service: 'openai', confidence: 0.0, data: {});
    } catch (e) {
      return AIServiceResult(service: 'openai', confidence: 0.0, data: {}, error: e.toString());
    }
  }

  ClothingAnalysisResult _combineAnalysisResults(
    List<AIServiceResult> results, 
    AIAnalysisOptions? options,
  ) {
    if (results.isEmpty) {
      return const ClothingAnalysisResult(confidence: 0.0, detectedItems: []);
    }

    // Weight results by service reliability and confidence
    final weights = {
      'custom_model': 0.5,
      'google_vision': 0.3,
      'openai': 0.2,
    };

    double totalConfidence = 0.0;
    double totalWeight = 0.0;
    final Map<String, dynamic> combinedData = {};
    final List<DetectedClothingItem> detectedItems = [];

    for (final result in results) {
      final weight = weights[result.service] ?? 0.1;
      totalConfidence += result.confidence * weight;
      totalWeight += weight;

      // Merge data from all services
      combinedData.addAll(result.data);
      
      // Extract detected items
      if (result.data.containsKey('detectedItems')) {
        final items = result.data['detectedItems'] as List;
        detectedItems.addAll(items.map((item) => DetectedClothingItem.fromMap(item)));
      }
    }

    return ClothingAnalysisResult(
      confidence: totalWeight > 0 ? totalConfidence / totalWeight : 0.0,
      detectedItems: detectedItems,
      combinedData: combinedData,
      serviceResults: results.map((r) => r.toMap()).toList(),
    );
  }

  AIServiceResult _parseGoogleVisionResponse(Map<String, dynamic> data) {
    // Parse Google Vision API response
    final responses = data['responses'] as List? ?? [];
    if (responses.isEmpty) return const AIServiceResult(service: 'google_vision', confidence: 0.0, data: {});

    final response = responses.first;
    final labels = response['labelAnnotations'] as List? ?? [];
    final objects = response['localizedObjectAnnotations'] as List? ?? [];

    return AIServiceResult(
      service: 'google_vision',
      confidence: labels.isNotEmpty ? (labels.first['score'] ?? 0.0).toDouble() : 0.0,
      data: {
        'labels': labels,
        'objects': objects,
        'imageProperties': response['imagePropertiesAnnotation'] ?? {},
      },
    );
  }

  AIServiceResult _parseOpenAIResponse(Map<String, dynamic> data) {
    // Parse OpenAI response
    final choices = data['choices'] as List? ?? [];
    if (choices.isEmpty) return const AIServiceResult(service: 'openai', confidence: 0.0, data: {});

    final content = choices.first['message']['content'] ?? '';
    
    try {
      final parsedContent = jsonDecode(content);
      return AIServiceResult(
        service: 'openai',
        confidence: 0.8, // OpenAI doesn't provide explicit confidence scores
        data: parsedContent,
      );
    } catch (e) {
      return AIServiceResult(
        service: 'openai',
        confidence: 0.5,
        data: {'description': content},
      );
    }
  }


  List<Season> _inferSeasons(ClothingAttributes attributes, StyleClassification style) {
    // Logic to infer appropriate seasons based on attributes
    final seasons = <Season>[];
    
    // Add logic based on material, style, etc.
    if (attributes.materials.any((m) => ['wool', 'cashmere', 'fleece'].contains(m.toLowerCase()))) {
      seasons.addAll([Season.autumn, Season.winter]);
    } else if (attributes.materials.any((m) => ['linen', 'cotton', 'silk'].contains(m.toLowerCase()))) {
      seasons.addAll([Season.spring, Season.summer]);
    } else {
      seasons.add(Season.allSeason);
    }

    return seasons.isEmpty ? [Season.allSeason] : seasons;
  }

  List<WeatherRange> _inferWeatherRanges(ClothingAttributes attributes) {
    // Logic to infer appropriate weather ranges
    final ranges = <WeatherRange>[];
    
    if (attributes.materials.any((m) => ['wool', 'down', 'fleece'].contains(m.toLowerCase()))) {
      ranges.add(WeatherRange.cold);
    } else if (attributes.materials.any((m) => ['linen', 'cotton'].contains(m.toLowerCase()))) {
      ranges.add(WeatherRange.warm);
    } else {
      ranges.add(WeatherRange.warm);
    }

    return ranges.isEmpty ? [WeatherRange.warm] : ranges;
  }
}

// Service result wrapper
class AIServiceResult {
  final String service;
  final double confidence;
  final Map<String, dynamic> data;
  final String? error;

  const AIServiceResult({
    required this.service,
    required this.confidence,
    required this.data,
    this.error,
  });

  Map<String, dynamic> toMap() {
    return {
      'service': service,
      'confidence': confidence,
      'data': data,
      'error': error,
    };
  }

  static AIServiceResult fromMap(Map<dynamic, dynamic> map) {
    return AIServiceResult(
      service: map['service'] ?? '',
      confidence: (map['confidence'] ?? 0.0).toDouble(),
      data: Map<String, dynamic>.from(map['data'] ?? {}),
      error: map['error'],
    );
  }
}