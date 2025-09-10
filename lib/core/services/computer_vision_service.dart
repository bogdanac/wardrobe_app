import 'dart:io';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import '../../domain/entities/clothing_item.dart';

class OutfitAnalysis {
  final Map<String, double> colorDistribution;
  final Map<String, double> styleCompatibility;
  final double overallHarmony;
  final List<String> suggestions;
  final Map<String, dynamic> visualFeatures;

  const OutfitAnalysis({
    required this.colorDistribution,
    required this.styleCompatibility,
    required this.overallHarmony,
    required this.suggestions,
    required this.visualFeatures,
  });
}

class ClothingItemAnalysis {
  final List<Color> dominantColors;
  final Map<String, double> textureFeatures;
  final Map<String, double> shapeFeatures;
  final String suggestedStyle;
  final double qualityScore;
  final Map<String, dynamic> metadata;

  const ClothingItemAnalysis({
    required this.dominantColors,
    required this.textureFeatures,
    required this.shapeFeatures,
    required this.suggestedStyle,
    required this.qualityScore,
    required this.metadata,
  });
}

class ComputerVisionService {
  
  Future<ClothingItemAnalysis> analyzeClothingItem(String imagePath) async {
    try {
      final file = File(imagePath);
      if (!await file.exists()) {
        throw Exception('Image file not found: $imagePath');
      }

      final bytes = await file.readAsBytes();
      final image = img.decodeImage(bytes);
      
      if (image == null) {
        throw Exception('Failed to decode image');
      }

      final dominantColors = await _extractDominantColors(image);
      final textureFeatures = await _analyzeTexture(image);
      final shapeFeatures = await _analyzeShape(image);
      final suggestedStyle = _classifyStyle(dominantColors, textureFeatures, shapeFeatures);
      final qualityScore = _assessImageQuality(image);

      return ClothingItemAnalysis(
        dominantColors: dominantColors,
        textureFeatures: textureFeatures,
        shapeFeatures: shapeFeatures,
        suggestedStyle: suggestedStyle,
        qualityScore: qualityScore,
        metadata: {
          'width': image.width,
          'height': image.height,
          'aspectRatio': image.width / image.height,
          'analyzedAt': DateTime.now().toIso8601String(),
        },
      );
    } catch (e) {
      throw Exception('Failed to analyze clothing item: $e');
    }
  }

  Future<OutfitAnalysis> analyzeOutfit(List<ClothingItem> items) async {
    try {
      final itemAnalyses = <ClothingItemAnalysis>[];
      
      for (final item in items) {
        if (item.imagePath != null) {
          try {
            final analysis = await analyzeClothingItem(item.imagePath!);
            itemAnalyses.add(analysis);
          } catch (e) {
            debugPrint('Failed to analyze item ${item.id}: $e');
          }
        }
      }

      if (itemAnalyses.isEmpty) {
        return _getDefaultOutfitAnalysis();
      }

      final colorDistribution = _analyzeColorHarmony(itemAnalyses);
      final styleCompatibility = _analyzeStyleCompatibility(itemAnalyses, items);
      final overallHarmony = _calculateOverallHarmony(colorDistribution, styleCompatibility);
      final suggestions = _generateSuggestions(itemAnalyses, items, overallHarmony);
      
      final visualFeatures = {
        'totalItems': items.length,
        'analyzedItems': itemAnalyses.length,
        'averageQuality': itemAnalyses.map((a) => a.qualityScore).reduce((a, b) => a + b) / itemAnalyses.length,
        'dominantColorCount': colorDistribution.length,
        'analyzedAt': DateTime.now().toIso8601String(),
      };

      return OutfitAnalysis(
        colorDistribution: colorDistribution,
        styleCompatibility: styleCompatibility,
        overallHarmony: overallHarmony,
        suggestions: suggestions,
        visualFeatures: visualFeatures,
      );
    } catch (e) {
      throw Exception('Failed to analyze outfit: $e');
    }
  }

  Future<List<Color>> _extractDominantColors(img.Image image) async {
    final colorCounts = <int, int>{};
    
    final resized = img.copyResize(image, width: 64, height: 64);
    
    for (int y = 0; y < resized.height; y++) {
      for (int x = 0; x < resized.width; x++) {
        final pixel = resized.getPixel(x, y);
        final r = pixel.r.toInt();
        final g = pixel.g.toInt();
        final b = pixel.b.toInt();
        
        final quantizedR = (r ~/ 32) * 32;
        final quantizedG = (g ~/ 32) * 32;
        final quantizedB = (b ~/ 32) * 32;
        
        final colorKey = (quantizedR << 16) | (quantizedG << 8) | quantizedB;
        colorCounts[colorKey] = (colorCounts[colorKey] ?? 0) + 1;
      }
    }

    final sortedColors = colorCounts.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    
    return sortedColors.take(5).map((entry) {
      final colorKey = entry.key;
      final r = (colorKey >> 16) & 0xFF;
      final g = (colorKey >> 8) & 0xFF;
      final b = colorKey & 0xFF;
      return Color.fromARGB(255, r, g, b);
    }).toList();
  }

  Future<Map<String, double>> _analyzeTexture(img.Image image) async {
    final grayImage = img.grayscale(image);
    final resized = img.copyResize(grayImage, width: 32, height: 32);
    
    double smoothness = 0.0;
    double contrast = 0.0;
    double entropy = 0.0;
    
    final pixels = <int>[];
    for (int y = 0; y < resized.height; y++) {
      for (int x = 0; x < resized.width; x++) {
        final pixel = resized.getPixel(x, y);
        final gray = pixel.r.toInt(); // Using red channel as grayscale approximation
        pixels.add(gray);
      }
    }

    final mean = pixels.reduce((a, b) => a + b) / pixels.length;
    
    for (int i = 0; i < pixels.length; i++) {
      final diff = pixels[i] - mean;
      smoothness += diff * diff;
    }
    smoothness = 1.0 - (smoothness / (pixels.length * 255 * 255));
    
    final histogram = List<int>.filled(256, 0);
    for (final pixel in pixels) {
      histogram[pixel]++;
    }
    
    int maxCount = histogram.reduce((a, b) => a > b ? a : b);
    int minCount = histogram.where((c) => c > 0).reduce((a, b) => a < b ? a : b);
    contrast = (maxCount - minCount).toDouble() / pixels.length;
    
    for (final count in histogram) {
      if (count > 0) {
        final probability = count / pixels.length;
        entropy -= probability * (probability > 0 ? (math.log(probability) / math.ln2) : 0);
      }
    }
    entropy /= 8.0;

    return {
      'smoothness': smoothness.clamp(0.0, 1.0),
      'contrast': contrast.clamp(0.0, 1.0),
      'entropy': entropy.clamp(0.0, 1.0),
    };
  }

  Future<Map<String, double>> _analyzeShape(img.Image image) async {
    final grayImage = img.grayscale(image);
    // Simple thresholding since img.threshold might not be available
    final binary = img.Image.from(grayImage);
    for (int y = 0; y < binary.height; y++) {
      for (int x = 0; x < binary.width; x++) {
        final pixel = binary.getPixel(x, y);
        final gray = pixel.r.toInt();
        final newValue = gray > 128 ? 255 : 0;
        binary.setPixelRgb(x, y, newValue, newValue, newValue);
      }
    }
    
    int whitePixels = 0;
    int totalPixels = binary.width * binary.height;
    
    for (int y = 0; y < binary.height; y++) {
      for (int x = 0; x < binary.width; x++) {
        final pixel = binary.getPixel(x, y);
        if (pixel.r > 128) {
          whitePixels++;
        }
      }
    }
    
    final fillRatio = whitePixels / totalPixels;
    final aspectRatio = binary.width / binary.height;
    final compactness = _calculateCompactness(binary);

    return {
      'fillRatio': fillRatio.clamp(0.0, 1.0),
      'aspectRatio': (aspectRatio / 3.0).clamp(0.0, 1.0),
      'compactness': compactness.clamp(0.0, 1.0),
    };
  }

  double _calculateCompactness(img.Image binary) {
    int perimeter = 0;
    int area = 0;
    
    for (int y = 1; y < binary.height - 1; y++) {
      for (int x = 1; x < binary.width - 1; x++) {
        final current = binary.getPixel(x, y).r.toInt();
        
        if (current > 128) {
          area++;
          
          final neighbors = [
            binary.getPixel(x-1, y).r.toInt(),
            binary.getPixel(x+1, y).r.toInt(),
            binary.getPixel(x, y-1).r.toInt(),
            binary.getPixel(x, y+1).r.toInt(),
          ];
          
          if (neighbors.any((n) => n <= 128)) {
            perimeter++;
          }
        }
      }
    }
    
    if (perimeter == 0 || area == 0) return 0.0;
    return (4 * 3.14159 * area) / (perimeter * perimeter);
  }

  String _classifyStyle(List<Color> colors, Map<String, double> texture, Map<String, double> shape) {
    double casualScore = 0.0;
    double formalScore = 0.0;
    double bohemianScore = 0.0;
    double minimalistScore = 0.0;

    for (final color in colors) {
      final hsl = HSLColor.fromColor(color);
      
      if (hsl.saturation > 0.7) {
        casualScore += 0.3;
        bohemianScore += 0.4;
      } else if (hsl.saturation < 0.3) {
        formalScore += 0.4;
        minimalistScore += 0.5;
      }
      
      if (hsl.lightness < 0.3 || hsl.lightness > 0.8) {
        formalScore += 0.3;
        minimalistScore += 0.2;
      }
    }

    final smoothness = texture['smoothness'] ?? 0.0;
    final contrast = texture['contrast'] ?? 0.0;
    
    formalScore += smoothness * 0.5;
    casualScore += contrast * 0.3;
    bohemianScore += texture['entropy'] ?? 0.0 * 0.4;
    minimalistScore += (1.0 - contrast) * 0.4;

    final compactness = shape['compactness'] ?? 0.0;
    formalScore += compactness * 0.3;
    minimalistScore += compactness * 0.2;

    final scores = {
      'casual': casualScore,
      'formal': formalScore,
      'bohemian': bohemianScore,
      'minimalist': minimalistScore,
    };

    return scores.entries.reduce((a, b) => a.value > b.value ? a : b).key;
  }

  double _assessImageQuality(img.Image image) {
    double qualityScore = 0.0;
    
    final resolution = image.width * image.height;
    final resolutionScore = (resolution / 1000000).clamp(0.0, 1.0);
    qualityScore += resolutionScore * 0.4;
    
    final aspectRatio = image.width / image.height;
    final aspectScore = (aspectRatio >= 0.5 && aspectRatio <= 2.0) ? 1.0 : 0.5;
    qualityScore += aspectScore * 0.2;
    
    final sharpnessScore = _calculateSharpness(image);
    qualityScore += sharpnessScore * 0.4;
    
    return qualityScore.clamp(0.0, 1.0);
  }

  double _calculateSharpness(img.Image image) {
    final gray = img.grayscale(image);
    double totalVariation = 0.0;
    int count = 0;
    
    for (int y = 1; y < gray.height - 1; y++) {
      for (int x = 1; x < gray.width - 1; x++) {
        final center = gray.getPixel(x, y).r.toInt();
        final right = gray.getPixel(x + 1, y).r.toInt();
        final bottom = gray.getPixel(x, y + 1).r.toInt();
        
        final dx = (right - center).abs();
        final dy = (bottom - center).abs();
        totalVariation += dx + dy;
        count++;
      }
    }
    
    final averageVariation = count > 0 ? totalVariation / count : 0.0;
    return (averageVariation / 255.0).clamp(0.0, 1.0);
  }

  Map<String, double> _analyzeColorHarmony(List<ClothingItemAnalysis> analyses) {
    final allColors = <Color>[];
    
    for (final analysis in analyses) {
      allColors.addAll(analysis.dominantColors);
    }
    
    if (allColors.isEmpty) return {};
    
    final colorGroups = <String, int>{};
    
    for (final color in allColors) {
      final hsl = HSLColor.fromColor(color);
      
      String colorName;
      if (hsl.saturation < 0.2) {
        colorName = hsl.lightness < 0.3 ? 'dark_neutral' : 
                   hsl.lightness > 0.8 ? 'light_neutral' : 'neutral';
      } else {
        final hue = hsl.hue;
        if (hue < 30 || hue >= 330) {
          colorName = 'red';
        } else if (hue < 90) {
          colorName = 'yellow';
        }
        else if (hue < 150) {
          colorName = 'green';
        }
        else if (hue < 210) {
          colorName = 'cyan';
        }
        else if (hue < 270) {
          colorName = 'blue';
        }
        else {
          colorName = 'magenta';
        }
      }
      
      colorGroups[colorName] = (colorGroups[colorName] ?? 0) + 1;
    }
    
    final totalColors = allColors.length;
    return colorGroups.map((name, count) => 
        MapEntry(name, count / totalColors));
  }

  Map<String, double> _analyzeStyleCompatibility(
    List<ClothingItemAnalysis> analyses, 
    List<ClothingItem> items
  ) {
    if (analyses.isEmpty) return {};
    
    final styleGroups = <String, int>{};
    
    for (final analysis in analyses) {
      final style = analysis.suggestedStyle;
      styleGroups[style] = (styleGroups[style] ?? 0) + 1;
    }
    
    final dominantStyle = styleGroups.entries
        .reduce((a, b) => a.value > b.value ? a : b).key;
    
    double compatibilityScore = 0.0;
    for (final analysis in analyses) {
      if (analysis.suggestedStyle == dominantStyle) {
        compatibilityScore += 1.0;
      } else {
        compatibilityScore += _getStyleCompatibilityScore(
          analysis.suggestedStyle, dominantStyle);
      }
    }
    
    compatibilityScore /= analyses.length;
    
    return {
      dominantStyle: compatibilityScore,
    };
  }

  double _getStyleCompatibilityScore(String style1, String style2) {
    const compatibilityMatrix = {
      'casual': {'bohemian': 0.7, 'minimalist': 0.4, 'formal': 0.2},
      'formal': {'minimalist': 0.8, 'casual': 0.2, 'bohemian': 0.1},
      'bohemian': {'casual': 0.7, 'minimalist': 0.3, 'formal': 0.1},
      'minimalist': {'formal': 0.8, 'casual': 0.4, 'bohemian': 0.3},
    };
    
    return compatibilityMatrix[style1]?[style2] ?? 0.0;
  }

  double _calculateOverallHarmony(
    Map<String, double> colorDistribution,
    Map<String, double> styleCompatibility,
  ) {
    double colorHarmony = 0.0;
    
    if (colorDistribution.isNotEmpty) {
      final neutrals = (colorDistribution['neutral'] ?? 0.0) +
                      (colorDistribution['dark_neutral'] ?? 0.0) +
                      (colorDistribution['light_neutral'] ?? 0.0);
      
      if (neutrals > 0.5) {
        colorHarmony += 0.3;
      }
      
      final colorCount = colorDistribution.length;
      if (colorCount <= 3) {
        colorHarmony += 0.4;
      } else if (colorCount <= 5) {
        colorHarmony += 0.2;
      }
      
      final maxColor = colorDistribution.values.reduce((a, b) => a > b ? a : b);
      if (maxColor < 0.8) {
        colorHarmony += 0.3;
      }
    }
    
    double styleHarmony = styleCompatibility.values.isNotEmpty
        ? styleCompatibility.values.first
        : 0.5;
    
    return (colorHarmony * 0.6 + styleHarmony * 0.4).clamp(0.0, 1.0);
  }

  List<String> _generateSuggestions(
    List<ClothingItemAnalysis> analyses,
    List<ClothingItem> items,
    double harmonyScore,
  ) {
    final suggestions = <String>[];
    
    if (harmonyScore < 0.4) {
      suggestions.add('Consider adding neutral pieces to balance the outfit');
    }
    
    if (analyses.isNotEmpty) {
      final avgQuality = analyses.map((a) => a.qualityScore).reduce((a, b) => a + b) / analyses.length;
      
      if (avgQuality < 0.6) {
        suggestions.add('Better quality photos would help with style analysis');
      }
      
      final styles = analyses.map((a) => a.suggestedStyle).toSet();
      if (styles.length > 2) {
        suggestions.add('Try mixing fewer different styles for better cohesion');
      }
    }
    
    if (items.length < 3) {
      suggestions.add('Consider adding accessories to complete the look');
    }
    
    if (suggestions.isEmpty) {
      if (harmonyScore > 0.8) {
        suggestions.add('Great outfit! The colors and styles work well together');
      } else {
        suggestions.add('Nice combination! This outfit has good potential');
      }
    }
    
    return suggestions.take(3).toList();
  }

  OutfitAnalysis _getDefaultOutfitAnalysis() {
    return const OutfitAnalysis(
      colorDistribution: {},
      styleCompatibility: {},
      overallHarmony: 0.5,
      suggestions: ['Add photos to get detailed outfit analysis'],
      visualFeatures: {
        'totalItems': 0,
        'analyzedItems': 0,
        'message': 'No images available for analysis',
      },
    );
  }
}