import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'package:palette_generator/palette_generator.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
import '../config/api_config.dart';
import '../config/background_removal_config.dart';

// Type alias for cleaner code  
typedef RemovalMethod = BackgroundRemovalMethod;

class ImageService {
  static const _uuid = Uuid();
  final ImagePicker _picker = ImagePicker();

  Future<File?> pickImageFromCamera() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1200,
        maxHeight: 1200,
        imageQuality: 85,
      );
      return image != null ? File(image.path) : null;
    } catch (e) {
      throw Exception('Failed to pick image from camera: $e');
    }
  }

  Future<File?> pickImageFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1200,
        maxHeight: 1200,
        imageQuality: 85,
      );
      return image != null ? File(image.path) : null;
    } catch (e) {
      throw Exception('Failed to pick image from gallery: $e');
    }
  }

  /// Removes background based on user preference and availability
  /// Respects user's choice between AI-powered and local removal
  Future<File> removeBackground(File imageFile) async {
    try {
      final preferredMethod = await BackgroundRemovalConfig.getPreferredMethod();
      
      // Use preferred method if available
      if (preferredMethod == RemovalMethod.ai && ApiConfig.isRemoveBgConfigured) {
        return await _removeBackgroundWithAPI(imageFile);
      } else if (preferredMethod == RemovalMethod.local) {
        return await _removeBackgroundWithEdgeDetection(imageFile);
      } else {
        // Fallback logic: if preferred AI isn't available, use local
        if (preferredMethod == RemovalMethod.ai && !ApiConfig.isRemoveBgConfigured) {
          return await _removeBackgroundWithEdgeDetection(imageFile);
        } else {
          // This shouldn't happen, but fallback to local just in case
          return await _removeBackgroundWithEdgeDetection(imageFile);
        }
      }
    } catch (e) {
      // If primary method fails, try the fallback method
      try {
        final preferredMethod = await BackgroundRemovalConfig.getPreferredMethod();
        if (preferredMethod == RemovalMethod.ai) {
          // AI failed, try local
          return await _removeBackgroundWithEdgeDetection(imageFile);
        } else {
          // Local failed, try AI if available
          if (ApiConfig.isRemoveBgConfigured) {
            return await _removeBackgroundWithAPI(imageFile);
          } else {
            throw Exception('Both background removal methods failed');
          }
        }
      } catch (fallbackError) {
        throw Exception('Failed to remove background: $e');
      }
    }
  }

  /// AI-powered background removal using Remove.bg API
  Future<File> _removeBackgroundWithAPI(File imageFile) async {
    try {
      final bytes = await imageFile.readAsBytes();
      
      final request = http.MultipartRequest(
        'POST', 
        Uri.parse(ApiConfig.removeBgEndpoint)
      );
      
      request.headers['X-Api-Key'] = ApiConfig.getRemoveBgApiKey();
      request.files.add(
        http.MultipartFile.fromBytes(
          'image_file',
          bytes,
          filename: 'image.jpg',
        ),
      );
      request.fields['size'] = 'auto';
      request.fields['format'] = 'png';

      final response = await request.send();
      
      if (response.statusCode == 200) {
        final responseBytes = await response.stream.toBytes();
        
        final directory = await getApplicationDocumentsDirectory();
        final processedFile = File('${directory.path}/processed_${_uuid.v4()}.png');
        await processedFile.writeAsBytes(responseBytes);
        
        return processedFile;
      } else {
        throw Exception('API request failed: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to remove background with API: $e');
    }
  }

  /// Smart edge detection background removal (fallback method)
  Future<File> _removeBackgroundWithEdgeDetection(File imageFile) async {
    try {
      final bytes = await imageFile.readAsBytes();
      final image = img.decodeImage(bytes);
      
      if (image == null) {
        throw Exception('Failed to decode image');
      }

      final processedImage = _smartBackgroundRemoval(image);
      final processedBytes = img.encodePng(processedImage);
      
      final directory = await getApplicationDocumentsDirectory();
      final processedFile = File('${directory.path}/processed_${_uuid.v4()}.png');
      await processedFile.writeAsBytes(processedBytes);
      
      return processedFile;
    } catch (e) {
      throw Exception('Failed to remove background with edge detection: $e');
    }
  }

  /// Smart background removal using edge detection and color analysis
  img.Image _smartBackgroundRemoval(img.Image image) {
    // Create a copy of the image
    final processed = img.Image.from(image);
    
    // Analyze corners to determine likely background colors
    final backgroundColors = _detectBackgroundColors(image);
    
    // Remove background using flood fill from corners
    _floodFillRemoval(processed, backgroundColors);
    
    // Clean up noise and smooth edges
    _cleanupEdges(processed);
    
    return processed;
  }

  /// Detect likely background colors by sampling image corners
  List<int> _detectBackgroundColors(img.Image image) {
    final cornerSamples = <int>[];
    const sampleSize = 10;
    
    // Sample from all four corners
    for (int x = 0; x < sampleSize && x < image.width; x++) {
      for (int y = 0; y < sampleSize && y < image.height; y++) {
        final pixel = image.getPixel(x, y);
        final colorValue = (pixel.r.toInt() << 16) | (pixel.g.toInt() << 8) | pixel.b.toInt();
        cornerSamples.add(colorValue);
      }
    }

    // Sample from top-right corner
    for (int x = image.width - sampleSize; x < image.width; x++) {
      for (int y = 0; y < sampleSize && y < image.height; y++) {
        if (x >= 0) {
          final pixel = image.getPixel(x, y);
          final colorValue = (pixel.r.toInt() << 16) | (pixel.g.toInt() << 8) | pixel.b.toInt();
          cornerSamples.add(colorValue);
        }
      }
    }
    
    // Sample from bottom corners
    for (int x = 0; x < sampleSize && x < image.width; x++) {
      for (int y = image.height - sampleSize; y < image.height; y++) {
        if (y >= 0) {
          final pixel = image.getPixel(x, y);
          final colorValue = (pixel.r.toInt() << 16) | (pixel.g.toInt() << 8) | pixel.b.toInt();
          cornerSamples.add(colorValue);
        }
      }
    }
    
    // Find most common colors (likely background)
    final colorCounts = <int, int>{};
    for (final color in cornerSamples) {
      colorCounts[color] = (colorCounts[color] ?? 0) + 1;
    }
    
    // Return top background colors
    final sortedColors = colorCounts.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    
    return sortedColors.take(3).map((e) => e.key).toList();
  }

  /// Remove background using flood fill algorithm
  void _floodFillRemoval(img.Image image, List<int> backgroundColors) {
    const tolerance = 40;
    final visited = <String>{};
    
    // Start flood fill from corners
    final startPoints = [
      [0, 0], // top-left
      [image.width - 1, 0], // top-right
      [0, image.height - 1], // bottom-left
      [image.width - 1, image.height - 1], // bottom-right
    ];
    
    for (final point in startPoints) {
      _floodFill(image, point[0], point[1], backgroundColors, tolerance, visited);
    }
  }

  /// Flood fill algorithm to remove similar colors
  void _floodFill(img.Image image, int startX, int startY, List<int> backgroundColors, 
                  int tolerance, Set<String> visited) {
    final stack = <List<int>>[];
    stack.add([startX, startY]);
    
    while (stack.isNotEmpty) {
      final current = stack.removeLast();
      final x = current[0];
      final y = current[1];
      
      if (x < 0 || x >= image.width || y < 0 || y >= image.height) continue;
      
      final key = '$x,$y';
      if (visited.contains(key)) continue;
      visited.add(key);
      
      final pixel = image.getPixel(x, y);
      final pixelColor = (pixel.r.toInt() << 16) | (pixel.g.toInt() << 8) | pixel.b.toInt();
      
      // Check if pixel matches any background color within tolerance
      bool isBackground = false;
      for (final bgColor in backgroundColors) {
        if (_colorDistance(pixelColor, bgColor) < tolerance) {
          isBackground = true;
          break;
        }
      }
      
      if (isBackground) {
        // Make pixel transparent
        image.setPixelRgba(x, y, 0, 0, 0, 0);
        
        // Add adjacent pixels to stack
        stack.addAll([
          [x + 1, y], [x - 1, y], [x, y + 1], [x, y - 1],
          [x + 1, y + 1], [x - 1, y - 1], [x + 1, y - 1], [x - 1, y + 1]
        ]);
      }
    }
  }

  /// Calculate color distance between two colors
  double _colorDistance(int color1, int color2) {
    final r1 = (color1 >> 16) & 0xFF;
    final g1 = (color1 >> 8) & 0xFF;
    final b1 = color1 & 0xFF;
    
    final r2 = (color2 >> 16) & 0xFF;
    final g2 = (color2 >> 8) & 0xFF;
    final b2 = color2 & 0xFF;
    
    return ((r1 - r2) * (r1 - r2) + (g1 - g2) * (g1 - g2) + (b1 - b2) * (b1 - b2)).toDouble();
  }

  /// Clean up edges and remove noise
  void _cleanupEdges(img.Image image) {
    // Apply a simple median filter to smooth edges
    final temp = img.Image.from(image);
    
    for (int x = 1; x < image.width - 1; x++) {
      for (int y = 1; y < image.height - 1; y++) {
        final neighbors = <int>[];
        for (int dx = -1; dx <= 1; dx++) {
          for (int dy = -1; dy <= 1; dy++) {
            neighbors.add(temp.getPixel(x + dx, y + dy).a.toInt());
          }
        }
        neighbors.sort();
        
        final median = neighbors[neighbors.length ~/ 2];
        final currentPixel = temp.getPixel(x, y);
        
        if (median < 128) {
          image.setPixelRgba(x, y, 0, 0, 0, 0);
        } else {
          image.setPixelRgba(x, y, currentPixel.r.toInt(), currentPixel.g.toInt(), currentPixel.b.toInt(), 255);
        }
      }
    }
  }

  Future<List<Color>> extractColors(File imageFile, {int maxColors = 5}) async {
    try {
      final imageProvider = FileImage(imageFile);
      final paletteGenerator = await PaletteGenerator.fromImageProvider(
        imageProvider,
        maximumColorCount: maxColors,
      );

      final colors = <Color>[];
      
      if (paletteGenerator.dominantColor != null) {
        colors.add(paletteGenerator.dominantColor!.color);
      }
      
      for (final color in paletteGenerator.colors) {
        if (colors.length >= maxColors) break;
        if (!colors.contains(color)) {
          colors.add(color);
        }
      }

      return colors.isEmpty ? [Colors.grey] : colors;
    } catch (e) {
      throw Exception('Failed to extract colors: $e');
    }
  }

  Future<String> saveImage(File imageFile) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final fileName = '${_uuid.v4()}.jpg';
      final savedFile = File('${directory.path}/$fileName');
      
      await imageFile.copy(savedFile.path);
      return savedFile.path;
    } catch (e) {
      throw Exception('Failed to save image: $e');
    }
  }

  Future<void> deleteImage(String imagePath) async {
    try {
      final file = File(imagePath);
      if (await file.exists()) {
        await file.delete();
      }
    } catch (e) {
      throw Exception('Failed to delete image: $e');
    }
  }

  String colorToHex(Color color) {
    return '#${color.value.toRadixString(16).padLeft(8, '0').substring(2)}';
  }

  Color hexToColor(String hex) {
    return Color(int.parse(hex.substring(1), radix: 16) + 0xFF000000);
  }
}