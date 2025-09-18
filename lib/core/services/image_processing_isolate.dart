import 'dart:isolate';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:palette_generator/palette_generator.dart';

/// Data class for image processing parameters
class ImageProcessingParams {
  final String imagePath;
  final int maxColors;
  final bool removeBackground;
  final int? targetWidth;
  final int? targetHeight;

  ImageProcessingParams({
    required this.imagePath,
    this.maxColors = 5,
    this.removeBackground = false,
    this.targetWidth,
    this.targetHeight,
  });
}

/// Result of image processing
class ImageProcessingResult {
  final String? processedImagePath;
  final List<Color> colors;
  final String? error;

  ImageProcessingResult({
    this.processedImagePath,
    this.colors = const [],
    this.error,
  });

  bool get hasError => error != null;
}

/// Service for handling image processing in isolates
class ImageProcessingIsolate {
  static Future<ImageProcessingResult> processImage(ImageProcessingParams params) async {
    try {
      // Create a receive port for communication
      final receivePort = ReceivePort();
      
      // Spawn isolate
      await Isolate.spawn(_imageProcessingEntryPoint, [receivePort.sendPort, params]);
      
      // Wait for result
      final result = await receivePort.first as ImageProcessingResult;
      receivePort.close();
      
      return result;
    } catch (e) {
      return ImageProcessingResult(error: e.toString());
    }
  }

  /// Entry point for the isolate
  static void _imageProcessingEntryPoint(List<dynamic> args) async {
    final sendPort = args[0] as SendPort;
    final params = args[1] as ImageProcessingParams;

    try {
      final result = await _processImageInIsolate(params);
      sendPort.send(result);
    } catch (e) {
      sendPort.send(ImageProcessingResult(error: e.toString()));
    }
  }

  /// Actual image processing logic
  static Future<ImageProcessingResult> _processImageInIsolate(ImageProcessingParams params) async {
    try {
      final file = File(params.imagePath);
      if (!file.existsSync()) {
        throw const FileSystemException('Image file does not exist');
      }

      // Read and decode image
      final bytes = await file.readAsBytes();
      final image = img.decodeImage(bytes);
      
      if (image == null) {
        throw const FormatException('Unable to decode image');
      }

      img.Image processedImage = image;
      String? processedPath;

      // Resize if needed
      if (params.targetWidth != null || params.targetHeight != null) {
        processedImage = img.copyResize(
          processedImage,
          width: params.targetWidth,
          height: params.targetHeight,
          interpolation: img.Interpolation.linear,
        );
      }

      // Background removal (basic implementation)
      if (params.removeBackground) {
        processedImage = await _removeBackgroundBasic(processedImage);
      }

      // Save processed image if it was modified
      if (params.removeBackground || params.targetWidth != null || params.targetHeight != null) {
        final tempDir = Directory.systemTemp;
        final tempFile = File('${tempDir.path}/processed_${DateTime.now().millisecondsSinceEpoch}.png');
        final processedBytes = img.encodePng(processedImage);
        await tempFile.writeAsBytes(processedBytes);
        processedPath = tempFile.path;
      }

      // Extract colors
      final colors = await _extractColorsFromImage(processedImage, params.maxColors);

      return ImageProcessingResult(
        processedImagePath: processedPath,
        colors: colors,
      );
    } catch (e) {
      return ImageProcessingResult(error: e.toString());
    }
  }

  /// Basic background removal implementation
  static Future<img.Image> _removeBackgroundBasic(img.Image image) async {
    // This is a simplified background removal
    // In a real app, you might use more sophisticated algorithms
    
    final width = image.width;
    final height = image.height;
    
    // Sample corner pixels to determine background color
    final cornerPixels = [
      image.getPixel(0, 0),
      image.getPixel(width - 1, 0),
      image.getPixel(0, height - 1),
      image.getPixel(width - 1, height - 1),
    ];
    
    // Find most common corner color (simple background detection)
    final colorCounts = <int, int>{};
    for (final pixel in cornerPixels) {
      final r = pixel.r.toInt();
      final g = pixel.g.toInt();
      final b = pixel.b.toInt();
      final key = (r << 16) | (g << 8) | b;
      colorCounts[key] = (colorCounts[key] ?? 0) + 1;
    }
    
    final backgroundColor = colorCounts.entries.reduce((a, b) => a.value > b.value ? a : b).key;
    final bgR = (backgroundColor >> 16) & 0xFF;
    final bgG = (backgroundColor >> 8) & 0xFF;
    final bgB = backgroundColor & 0xFF;
    
    // Create new image with transparency
    final result = img.Image(width: width, height: height, numChannels: 4);
    
    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        final pixel = image.getPixel(x, y);
        final r = pixel.r.toInt();
        final g = pixel.g.toInt();
        final b = pixel.b.toInt();
        
        // Simple color distance threshold for background removal
        final distance = ((r - bgR) * (r - bgR) + (g - bgG) * (g - bgG) + (b - bgB) * (b - bgB));
        
        if (distance < 2000) { // Threshold for background similarity
          // Make transparent
          result.setPixelRgba(x, y, r, g, b, 0);
        } else {
          // Keep original pixel
          result.setPixelRgba(x, y, r, g, b, 255);
        }
      }
    }
    
    return result;
  }

  /// Extract dominant colors from image
  static Future<List<Color>> _extractColorsFromImage(img.Image image, int maxColors) async {
    // Convert img.Image to Flutter Image for PaletteGenerator
    final bytes = img.encodePng(image);
    final imageProvider = MemoryImage(Uint8List.fromList(bytes));
    
    try {
      final paletteGenerator = await PaletteGenerator.fromImageProvider(
        imageProvider,
        maximumColorCount: maxColors,
      );
      
      final colors = <Color>[];
      
      // Get colors in order of prominence
      if (paletteGenerator.dominantColor != null) {
        colors.add(paletteGenerator.dominantColor!.color);
      }
      
      if (paletteGenerator.vibrantColor != null && 
          !colors.contains(paletteGenerator.vibrantColor!.color)) {
        colors.add(paletteGenerator.vibrantColor!.color);
      }
      
      if (paletteGenerator.mutedColor != null && 
          !colors.contains(paletteGenerator.mutedColor!.color)) {
        colors.add(paletteGenerator.mutedColor!.color);
      }
      
      // Add other colors from palette
      for (final swatch in paletteGenerator.paletteColors) {
        if (colors.length >= maxColors) break;
        if (!colors.contains(swatch.color)) {
          colors.add(swatch.color);
        }
      }
      
      return colors.take(maxColors).toList();
    } catch (e) {
      // Fallback: extract colors manually
      return _extractColorsManually(image, maxColors);
    }
  }

  /// Fallback color extraction method
  static List<Color> _extractColorsManually(img.Image image, int maxColors) {
    final colorCounts = <int, int>{};
    final width = image.width;
    final height = image.height;
    
    // Sample every nth pixel for performance
    final step = (width * height / 10000).round().clamp(1, 10);
    
    for (int y = 0; y < height; y += step) {
      for (int x = 0; x < width; x += step) {
        final pixel = image.getPixel(x, y);
        final r = pixel.r.toInt();
        final g = pixel.g.toInt();
        final b = pixel.b.toInt();
        
        // Group similar colors together
        final key = ((r >> 3) << 10) | ((g >> 3) << 5) | (b >> 3);
        colorCounts[key] = (colorCounts[key] ?? 0) + 1;
      }
    }
    
    // Sort by frequency and convert to colors
    final sortedColors = colorCounts.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    
    return sortedColors
        .take(maxColors)
        .map((entry) {
          final key = entry.key;
          final r = ((key >> 10) & 0x1F) << 3;
          final g = ((key >> 5) & 0x1F) << 3;
          final b = (key & 0x1F) << 3;
          return Color.fromARGB(255, r, g, b);
        })
        .toList();
  }
}