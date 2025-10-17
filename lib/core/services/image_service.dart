import 'dart:io';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'package:palette_generator/palette_generator.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
import '../config/api_config.dart';
import '../config/background_removal_config.dart';
import '../errors/app_exceptions.dart';
import 'image_processing_isolate.dart';
import 'color_palette_service.dart';

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
    } on PermissionException {
      rethrow;
    } catch (e) {
      throw ImageProcessingException(
        'Failed to access camera',
        code: 'camera_access_failed',
        originalError: e,
      );
    }
  }

  Future<File?> pickImageFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1200,
        maxHeight: 1200,
        imageQuality: 85,
        preferredCameraDevice: CameraDevice.rear,
        requestFullMetadata: false,
      );
      return image != null ? File(image.path) : null;
    } on PermissionException {
      rethrow;
    } catch (e) {
      throw ImageProcessingException(
        'Failed to access gallery',
        code: 'gallery_access_failed',
        originalError: e,
      );
    }
  }

  Future<List<File>> pickMultipleImagesFromGallery() async {
    try {
      final List<XFile> images = await _picker.pickMultiImage(
        maxWidth: 1200,
        maxHeight: 1200,
        imageQuality: 85,
      );
      return images.map((image) => File(image.path)).toList();
    } catch (e) {
      throw Exception('Failed to pick multiple images from gallery: $e');
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
    
    // Step 1: Detect if background is predominantly white
    final isWhiteBackground = _isWhiteBackground(image);
    
    // Step 2: Apply GrabCut-like algorithm for initial segmentation
    final mask = _createInitialMask(image, isWhiteBackground);
    
    // Step 3: Refine mask using color clustering and edge detection
    _refineMaskWithClustering(image, mask, isWhiteBackground);
    
    // Step 4: Apply edge-aware smoothing
    _applyEdgeAwareSmoothing(mask, image);
    
    // Step 5: Find bounding box and crop to center the item
    final boundingBox = _findItemBoundingBox(mask);
    
    // Step 6: Apply mask to create transparent background
    _applyMaskToImage(processed, mask);
    
    // Step 7: Crop and center the item properly
    final croppedImage = _cropAndCenterItem(processed, boundingBox);
    
    // Step 8: Post-process for edge refinement
    _postProcessEdges(croppedImage, mask);
    
    return croppedImage;
  }

  /// Detect if background is predominantly white
  bool _isWhiteBackground(img.Image image) {
    int whitePixelCount = 0;
    int totalBorderPixels = 0;
    const whiteThreshold = 240; // RGB values above this are considered white
    const borderSize = 20;
    
    // Sample border pixels
    for (int y = 0; y < image.height; y++) {
      for (int x = 0; x < image.width; x++) {
        // Check if pixel is on the border
        if (x < borderSize || x >= image.width - borderSize ||
            y < borderSize || y >= image.height - borderSize) {
          final pixel = image.getPixel(x, y);
          final r = pixel.r.toInt();
          final g = pixel.g.toInt();
          final b = pixel.b.toInt();
          
          totalBorderPixels++;
          
          // Check if pixel is white-ish
          if (r > whiteThreshold && g > whiteThreshold && b > whiteThreshold) {
            whitePixelCount++;
          }
        }
      }
    }
    
    return whitePixelCount > (totalBorderPixels * 0.7); // 70% threshold
  }
  
  /// Create initial mask using improved foreground/background detection
  List<List<int>> _createInitialMask(img.Image image, bool isWhiteBackground) {
    final width = image.width;
    final height = image.height;
    final mask = List.generate(height, (_) => List.filled(width, 0));
    
    // Initialize mask with probable foreground/background regions
    // 0 = definite background, 128 = unknown, 255 = definite foreground
    
    // Adaptive center region based on image aspect ratio
    final centerX = width ~/ 2;
    final centerY = height ~/ 2;
    
    // Make foreground region more conservative for white backgrounds
    final radiusX = isWhiteBackground ? width ~/ 4 : width ~/ 3;
    final radiusY = isWhiteBackground ? height ~/ 4 : height ~/ 3;
    
    // Border size adaptive to image size
    final borderSize = math.max(10, math.min(width, height) ~/ 20);
    
    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        // Calculate distance from center
        final dx = (x - centerX).abs();
        final dy = (y - centerY).abs();
        
        if (dx < radiusX && dy < radiusY) {
          // Center region - likely foreground
          mask[y][x] = 255;
        } else if (x < borderSize || x >= width - borderSize || 
                   y < borderSize || y >= height - borderSize) {
          // Border regions - likely background
          mask[y][x] = 0;
        } else {
          // Unknown region
          mask[y][x] = 128;
        }
      }
    }
    
    return mask;
  }
  
  /// Refine mask using K-means color clustering and gradient analysis
  void _refineMaskWithClustering(img.Image image, List<List<int>> mask, bool isWhiteBackground) {
    // Perform simple K-means clustering with K=2 (foreground/background)
    final foregroundColors = <List<int>>[];
    final backgroundColors = <List<int>>[];
    
    // Collect color samples based on initial mask
    for (int y = 0; y < image.height; y++) {
      for (int x = 0; x < image.width; x++) {
        final pixel = image.getPixel(x, y);
        final color = [pixel.r.toInt(), pixel.g.toInt(), pixel.b.toInt()];
        
        if (mask[y][x] == 255) {
          foregroundColors.add(color);
        } else if (mask[y][x] == 0) {
          backgroundColors.add(color);
        }
      }
    }
    
    // Calculate mean colors for foreground and background
    final fgMean = _calculateMeanColor(foregroundColors);
    final bgMean = _calculateMeanColor(backgroundColors);
    
    // Refine unknown regions based on color distance
    for (int y = 0; y < image.height; y++) {
      for (int x = 0; x < image.width; x++) {
        if (mask[y][x] == 128) {
          final pixel = image.getPixel(x, y);
          final color = [pixel.r.toInt(), pixel.g.toInt(), pixel.b.toInt()];
          
          final fgDist = _colorDistanceRGB(color, fgMean);
          final bgDist = _colorDistanceRGB(color, bgMean);
          
          // Also consider gradient magnitude for edge detection
          final gradMag = _calculateGradientMagnitude(image, x, y);
          
          // Combine color distance and gradient for better segmentation
          // Adjust thresholds for white backgrounds
          final edgeThreshold = isWhiteBackground ? 25 : 50;
          final colorThreshold = isWhiteBackground ? 0.8 : 0.7;
          
          if (fgDist < bgDist && gradMag < 30) {
            mask[y][x] = 255;
          } else if (bgDist < fgDist * colorThreshold) {
            mask[y][x] = 0;
          } else if (gradMag > edgeThreshold) {
            // Strong edge - likely foreground boundary
            mask[y][x] = 200;
          } else {
            mask[y][x] = 100;
          }
        }
      }
    }
  }
  
  /// Calculate mean color from a list of RGB values
  List<int> _calculateMeanColor(List<List<int>> colors) {
    if (colors.isEmpty) return [128, 128, 128];
    
    int sumR = 0, sumG = 0, sumB = 0;
    for (final color in colors) {
      sumR += color[0];
      sumG += color[1];
      sumB += color[2];
    }
    
    return [
      sumR ~/ colors.length,
      sumG ~/ colors.length,
      sumB ~/ colors.length
    ];
  }
  
  /// Calculate color distance between two RGB colors
  double _colorDistanceRGB(List<int> c1, List<int> c2) {
    final dr = c1[0] - c2[0];
    final dg = c1[1] - c2[1];
    final db = c1[2] - c2[2];
    return (dr * dr + dg * dg + db * db).toDouble();
  }
  
  /// Calculate gradient magnitude at a pixel using Sobel operator
  double _calculateGradientMagnitude(img.Image image, int x, int y) {
    if (x <= 0 || x >= image.width - 1 || y <= 0 || y >= image.height - 1) {
      return 0;
    }
    
    // Sobel operators
    final sobelX = [
      [-1, 0, 1],
      [-2, 0, 2],
      [-1, 0, 1]
    ];
    
    final sobelY = [
      [-1, -2, -1],
      [0, 0, 0],
      [1, 2, 1]
    ];
    
    double gx = 0, gy = 0;
    
    for (int dy = -1; dy <= 1; dy++) {
      for (int dx = -1; dx <= 1; dx++) {
        final pixel = image.getPixel(x + dx, y + dy);
        final gray = (0.299 * pixel.r + 0.587 * pixel.g + 0.114 * pixel.b);
        
        gx += gray * sobelX[dy + 1][dx + 1];
        gy += gray * sobelY[dy + 1][dx + 1];
      }
    }
    
    return math.sqrt(gx * gx + gy * gy);
  }
  
  /// Apply edge-aware smoothing to the mask
  void _applyEdgeAwareSmoothing(List<List<int>> mask, img.Image image) {
    final height = mask.length;
    final width = mask[0].length;
    final smoothed = List.generate(height, (y) => List.from(mask[y]));
    
    // Apply guided filter for edge-preserving smoothing
    const radius = 3;
    const epsilon = 0.01;
    
    for (int y = radius; y < height - radius; y++) {
      for (int x = radius; x < width - radius; x++) {
        double sum = 0;
        double weightSum = 0;
        
        final centerPixel = image.getPixel(x, y);
        final centerIntensity = (centerPixel.r + centerPixel.g + centerPixel.b) / 3;
        
        for (int dy = -radius; dy <= radius; dy++) {
          for (int dx = -radius; dx <= radius; dx++) {
            final nx = x + dx;
            final ny = y + dy;
            
            final pixel = image.getPixel(nx, ny);
            final intensity = (pixel.r + pixel.g + pixel.b) / 3;
            
            // Calculate weight based on color similarity
            final diff = (centerIntensity - intensity).abs();
            final weight = 1.0 / (1.0 + diff * diff / epsilon);
            
            sum += mask[ny][nx] * weight;
            weightSum += weight;
          }
        }
        
        smoothed[y][x] = (sum / weightSum).round().clamp(0, 255);
      }
    }
    
    // Copy smoothed values back to mask
    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        mask[y][x] = smoothed[y][x];
      }
    }
  }
  
  /// Apply the mask to create transparent background
  void _applyMaskToImage(img.Image image, List<List<int>> mask) {
    for (int y = 0; y < image.height; y++) {
      for (int x = 0; x < image.width; x++) {
        final alpha = mask[y][x];
        
        if (alpha < 50) {
          // Background - make transparent
          image.setPixelRgba(x, y, 0, 0, 0, 0);
        } else if (alpha < 200) {
          // Edge region - apply partial transparency
          final pixel = image.getPixel(x, y);
          final newAlpha = (alpha * 255 / 200).round().clamp(0, 255);
          image.setPixelRgba(x, y, pixel.r.toInt(), pixel.g.toInt(), pixel.b.toInt(), newAlpha);
        }
        // else: Foreground - keep as is
      }
    }
  }
  
  /// Find bounding box of the main item
  Map<String, int> _findItemBoundingBox(List<List<int>> mask) {
    int minX = mask[0].length, maxX = 0;
    int minY = mask.length, maxY = 0;
    
    bool foundForeground = false;
    
    for (int y = 0; y < mask.length; y++) {
      for (int x = 0; x < mask[y].length; x++) {
        if (mask[y][x] > 100) { // Foreground or edge pixel
          foundForeground = true;
          minX = math.min(minX, x);
          maxX = math.max(maxX, x);
          minY = math.min(minY, y);
          maxY = math.max(maxY, y);
        }
      }
    }
    
    // If no foreground found, use center region
    if (!foundForeground) {
      minX = mask[0].length ~/ 4;
      maxX = (mask[0].length * 3) ~/ 4;
      minY = mask.length ~/ 4;
      maxY = (mask.length * 3) ~/ 4;
    }
    
    // Add padding to avoid cutting off edges
    const padding = 20;
    minX = math.max(0, minX - padding);
    maxX = math.min(mask[0].length - 1, maxX + padding);
    minY = math.max(0, minY - padding);
    maxY = math.min(mask.length - 1, maxY + padding);
    
    return {
      'minX': minX,
      'maxX': maxX,
      'minY': minY,
      'maxY': maxY,
    };
  }
  
  /// Crop and center the item properly maintaining aspect ratio
  img.Image _cropAndCenterItem(img.Image image, Map<String, int> boundingBox) {
    final minX = boundingBox['minX']!;
    final maxX = boundingBox['maxX']!;
    final minY = boundingBox['minY']!;
    final maxY = boundingBox['maxY']!;

    final itemWidth = maxX - minX + 1;
    final itemHeight = maxY - minY + 1;

    // Add small padding around the item (5% of dimensions)
    final padding = math.max(itemWidth, itemHeight) * 0.05;

    // Calculate crop area with padding
    final cropMinX = math.max(0, minX - padding.round());
    final cropMaxX = math.min(image.width - 1, maxX + padding.round());
    final cropMinY = math.max(0, minY - padding.round());
    final cropMaxY = math.min(image.height - 1, maxY + padding.round());

    final cropWidth = cropMaxX - cropMinX + 1;
    final cropHeight = cropMaxY - cropMinY + 1;

    // Crop to the content area first
    final cropped = img.copyCrop(image,
        x: cropMinX,
        y: cropMinY,
        width: cropWidth,
        height: cropHeight);

    // If already roughly square, return as is
    final aspectRatio = cropWidth / cropHeight;
    if (aspectRatio > 0.85 && aspectRatio < 1.15) {
      return cropped;
    }

    // Create a square canvas with transparent background
    final targetSize = math.max(cropWidth, cropHeight);
    final squared = img.Image(width: targetSize, height: targetSize);

    // Fill with transparent pixels
    for (int y = 0; y < squared.height; y++) {
      for (int x = 0; x < squared.width; x++) {
        squared.setPixelRgba(x, y, 0, 0, 0, 0);
      }
    }

    // Center the cropped image on the transparent canvas
    final offsetX = (targetSize - cropWidth) ~/ 2;
    final offsetY = (targetSize - cropHeight) ~/ 2;

    img.compositeImage(squared, cropped, dstX: offsetX, dstY: offsetY);

    return squared;
  }
  
  /// Post-process edges for better quality
  void _postProcessEdges(img.Image image, List<List<int>> mask) {
    // Apply anti-aliasing to edges
    final temp = img.Image.from(image);
    
    for (int y = 1; y < image.height - 1; y++) {
      for (int x = 1; x < image.width - 1; x++) {
        final currentAlpha = mask[y][x];
        
        // Check if this is an edge pixel
        if (currentAlpha > 50 && currentAlpha < 200) {
          // Calculate weighted average of surrounding pixels
          double sumR = 0, sumG = 0, sumB = 0, sumA = 0;
          double weightSum = 0;
          
          for (int dy = -1; dy <= 1; dy++) {
            for (int dx = -1; dx <= 1; dx++) {
              final pixel = temp.getPixel(x + dx, y + dy);
              final weight = 1.0 / (1 + dx.abs() + dy.abs());
              
              sumR += pixel.r * weight;
              sumG += pixel.g * weight;
              sumB += pixel.b * weight;
              sumA += pixel.a * weight;
              weightSum += weight;
            }
          }
          
          // Apply smoothed values
          image.setPixelRgba(
            x, y,
            (sumR / weightSum).round(),
            (sumG / weightSum).round(),
            (sumB / weightSum).round(),
            (sumA / weightSum).round()
          );
        }
      }
    }
  }


  /// Process image using isolate for better performance
  Future<ImageProcessingResult> processImageWithIsolate(File imageFile, {
    int maxColors = 5,
    bool removeBackground = false,
    int? targetWidth,
    int? targetHeight,
  }) async {
    try {
      final params = ImageProcessingParams(
        imagePath: imageFile.path,
        maxColors: maxColors,
        removeBackground: removeBackground,
        targetWidth: targetWidth,
        targetHeight: targetHeight,
      );
      
      return await ImageProcessingIsolate.processImage(params);
    } catch (e) {
      throw ImageProcessingException(
        'Failed to process image',
        code: 'processing_failed',
        originalError: e,
      );
    }
  }

  Future<List<Color>> extractColors(File imageFile, {required dynamic customColorRepository, int maxColors = 3}) async {
    try {
      final imageProvider = FileImage(imageFile);
      final paletteGenerator = await PaletteGenerator.fromImageProvider(
        imageProvider,
        maximumColorCount: 20, // Extract more colors for better matching
      );

      final detectedColors = <Color>[];

      if (paletteGenerator.dominantColor != null) {
        final dominantColor = paletteGenerator.dominantColor!.color;
        if (!_isMetallicColor(dominantColor)) {
          detectedColors.add(dominantColor);
        }
      }

      for (final color in paletteGenerator.colors) {
        if (detectedColors.length >= 10) break;
        if (!detectedColors.contains(color) && !_isMetallicColor(color)) {
          detectedColors.add(color);
        }
      }

      // Map detected colors to custom palette
      final colorService = ColorPaletteService(customColorRepository);
      final mappedColors = <Color>[];
      final usedPaletteColors = <Color>{};

      for (final detectedColor in detectedColors) {
        if (mappedColors.length >= maxColors) break;

        final closestMatch = await colorService.findClosestColor(detectedColor);
        final matchedColor = _hexToColor(closestMatch['hex']!);

        // Only add if we haven't used this palette color yet
        if (!usedPaletteColors.contains(matchedColor)) {
          mappedColors.add(matchedColor);
          usedPaletteColors.add(matchedColor);
        }
      }

      return mappedColors.isEmpty ? [Colors.grey] : mappedColors;
    } catch (e) {
      throw Exception('Failed to extract colors: $e');
    }
  }

  Color _hexToColor(String hex) {
    try {
      return Color(int.parse(hex.substring(1), radix: 16) + 0xFF000000);
    } catch (e) {
      return Colors.grey;
    }
  }

  /// Check if a color is metallic (gold/silver) and should be excluded from fabric colors
  bool _isMetallicColor(Color color) {
    final r = (color.r * 255).round();
    final g = (color.g * 255).round();
    final b = (color.b * 255).round();
    
    // Gold color ranges (yellow-ish metallics)
    if (_isGoldColor(r, g, b)) return true;
    
    // Silver color ranges (gray-ish metallics with high brightness)
    if (_isSilverColor(r, g, b)) return true;
    
    return false;
  }
  
  /// Detect gold-like colors
  bool _isGoldColor(int r, int g, int b) {
    // Gold characteristics: high red/green, lower blue, yellowish
    final isYellowish = g > b && r > b;
    final hasGoldHue = (r > 180 && g > 150 && b < 100) || // Bright gold
                       (r > 120 && g > 100 && b < 80 && r >= g * 0.8); // Muted gold
    
    return isYellowish && hasGoldHue;
  }
  
  /// Detect silver-like colors  
  bool _isSilverColor(int r, int g, int b) {
    // Silver characteristics: similar RGB values (gray), high brightness, metallic sheen
    final isGrayish = (r - g).abs() < 30 && (g - b).abs() < 30 && (r - b).abs() < 30;
    final isBright = (r + g + b) / 3 > 120; // Bright enough to be metallic
    final isMetallicGray = r > 100 && g > 100 && b > 100; // Not too dark
    
    return isGrayish && isBright && isMetallicGray;
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
    final r = ((color.r * 255.0).round() & 0xff).toRadixString(16).padLeft(2, '0');
    final g = ((color.g * 255.0).round() & 0xff).toRadixString(16).padLeft(2, '0');
    final b = ((color.b * 255.0).round() & 0xff).toRadixString(16).padLeft(2, '0');
    return '#$r$g$b';
  }

  Color hexToColor(String hex) {
    return Color(int.parse(hex.substring(1), radix: 16) + 0xFF000000);
  }
}