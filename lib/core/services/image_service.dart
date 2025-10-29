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
      print('🟢 removeBackground called, preferred method: $preferredMethod');
      print('🟢 API configured: ${ApiConfig.isRemoveBgConfigured}');

      // Use preferred method if available
      if (preferredMethod == RemovalMethod.ai && ApiConfig.isRemoveBgConfigured) {
        print('🟢 Using AI method');
        return await _removeBackgroundWithAPI(imageFile);
      } else if (preferredMethod == RemovalMethod.local) {
        print('🟢 Using local method');
        return await _removeBackgroundWithEdgeDetection(imageFile);
      } else {
        // Fallback logic: if preferred AI isn't available, use local
        if (preferredMethod == RemovalMethod.ai && !ApiConfig.isRemoveBgConfigured) {
          print('🟢 AI preferred but not configured, using local method');
          return await _removeBackgroundWithEdgeDetection(imageFile);
        } else {
          // This shouldn't happen, but fallback to local just in case
          print('🟢 Fallback to local method');
          return await _removeBackgroundWithEdgeDetection(imageFile);
        }
      }
    } catch (e) {
      print('🔴 Primary method failed: $e');
      // If primary method fails, try the fallback method
      try {
        final preferredMethod = await BackgroundRemovalConfig.getPreferredMethod();
        if (preferredMethod == RemovalMethod.ai) {
          // AI failed, try local
          print('🟢 AI failed, trying local method');
          return await _removeBackgroundWithEdgeDetection(imageFile);
        } else {
          // Local failed, try AI if available
          if (ApiConfig.isRemoveBgConfigured) {
            print('🟢 Local failed, trying AI method');
            return await _removeBackgroundWithAPI(imageFile);
          } else {
            print('🔴 Both methods failed');
            throw Exception('Both background removal methods failed');
          }
        }
      } catch (fallbackError) {
        print('🔴 Fallback also failed: $fallbackError');
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
      print('🔵 Starting local background removal...');
      final bytes = await imageFile.readAsBytes();
      print('🔵 Image loaded, size: ${bytes.length} bytes');

      final image = img.decodeImage(bytes);

      if (image == null) {
        print('🔴 Failed to decode image');
        throw Exception('Failed to decode image');
      }

      print('🔵 Image decoded: ${image.width}x${image.height}');
      print('🔵 Starting smart background removal...');
      final processedImage = _smartBackgroundRemoval(image);
      print('🔵 Background removal complete');

      final processedBytes = img.encodePng(processedImage);
      print('🔵 Image encoded to PNG, size: ${processedBytes.length} bytes');

      final directory = await getApplicationDocumentsDirectory();
      final processedFile = File('${directory.path}/processed_${_uuid.v4()}.png');
      await processedFile.writeAsBytes(processedBytes);
      print('🔵 File saved: ${processedFile.path}');

      return processedFile;
    } catch (e, stackTrace) {
      print('🔴 Error in edge detection: $e');
      print('🔴 Stack trace: $stackTrace');
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

    // Step 4: For white backgrounds, erode mask to remove white borders
    if (isWhiteBackground) {
      _erodeMaskToRemoveWhiteBorders(image, mask);
    }

    // Step 5: Apply edge-aware smoothing
    _applyEdgeAwareSmoothing(mask, image);

    // Step 6: Find bounding box and crop to center the item
    final boundingBox = _findItemBoundingBox(mask);

    // Step 7: Apply mask to create transparent background with aggressive white removal
    _applyMaskToImage(processed, mask, isWhiteBackground);

    // Step 8: For white backgrounds, remove any remaining white border pixels
    if (isWhiteBackground) {
      _removeWhiteBorderPixels(processed);
    }

    // Step 9: Crop and center the item properly
    final croppedImage = _cropAndCenterItem(processed, boundingBox);

    // Step 10: Post-process for edge refinement
    _postProcessEdges(croppedImage, mask);

    return croppedImage;
  }

  /// Detect if background is predominantly white
  bool _isWhiteBackground(img.Image image) {
    int whitePixelCount = 0;
    int totalBorderPixels = 0;
    const whiteThreshold = 230; // Lowered threshold to catch more white backgrounds
    const borderSize = 30; // Increased border size for better sampling

    // Sample border pixels from all four edges
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

          // Check if pixel is white-ish (also check that colors are similar - not colorful)
          final colorDiff = (r - g).abs() + (g - b).abs() + (r - b).abs();
          if (r > whiteThreshold && g > whiteThreshold && b > whiteThreshold && colorDiff < 30) {
            whitePixelCount++;
          }
        }
      }
    }

    return whitePixelCount > (totalBorderPixels * 0.6); // 60% threshold for more sensitivity
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

    // For white backgrounds, use edge detection to find the actual subject
    if (isWhiteBackground) {
      // First pass: detect edges to find where the subject likely is
      final edgeMap = List.generate(height, (_) => List.filled(width, 0.0));

      for (int y = 1; y < height - 1; y++) {
        for (int x = 1; x < width - 1; x++) {
          final gradMag = _calculateGradientMagnitude(image, x, y);
          edgeMap[y][x] = gradMag;
        }
      }

      // Find the region with the most edges (likely the subject)
      double maxEdgeDensity = 0;
      int bestCenterX = centerX;
      int bestCenterY = centerY;

      final windowSize = math.min(width, height) ~/ 4;
      for (int cy = windowSize; cy < height - windowSize; cy += windowSize ~/ 2) {
        for (int cx = windowSize; cx < width - windowSize; cx += windowSize ~/ 2) {
          double edgeDensity = 0;
          for (int y = cy - windowSize; y < cy + windowSize && y < height; y++) {
            for (int x = cx - windowSize; x < cx + windowSize && x < width; x++) {
              if (y >= 0 && x >= 0) {
                edgeDensity += edgeMap[y][x];
              }
            }
          }
          if (edgeDensity > maxEdgeDensity) {
            maxEdgeDensity = edgeDensity;
            bestCenterX = cx;
            bestCenterY = cy;
          }
        }
      }

      // Use the detected center for masking
      final radiusX = width ~/ 5;
      final radiusY = height ~/ 5;

      for (int y = 0; y < height; y++) {
        for (int x = 0; x < width; x++) {
          final dx = (x - bestCenterX).abs();
          final dy = (y - bestCenterY).abs();

          // Use edge information to refine the mask
          final edgeStrength = edgeMap[y][x];

          if (dx < radiusX && dy < radiusY) {
            // Center region - likely foreground
            mask[y][x] = 255;
          } else if (edgeStrength > 30) {
            // Strong edge - likely part of the subject
            mask[y][x] = 200;
          } else if (x < 20 || x >= width - 20 || y < 20 || y >= height - 20) {
            // Border regions - likely background
            mask[y][x] = 0;
          } else {
            // Unknown region
            mask[y][x] = 128;
          }
        }
      }
    } else {
      // Original logic for non-white backgrounds
      final radiusX = width ~/ 3;
      final radiusY = height ~/ 3;
      final borderSize = math.max(10, math.min(width, height) ~/ 20);

      for (int y = 0; y < height; y++) {
        for (int x = 0; x < width; x++) {
          final dx = (x - centerX).abs();
          final dy = (y - centerY).abs();

          if (dx < radiusX && dy < radiusY) {
            mask[y][x] = 255;
          } else if (x < borderSize || x >= width - borderSize ||
              y < borderSize || y >= height - borderSize) {
            mask[y][x] = 0;
          } else {
            mask[y][x] = 128;
          }
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

    // For white backgrounds, use texture and edge-based segmentation
    if (isWhiteBackground) {
      // Calculate texture variance for each pixel region
      final textureMap = List.generate(image.height, (_) => List.filled(image.width, 0.0));

      for (int y = 2; y < image.height - 2; y++) {
        for (int x = 2; x < image.width - 2; x++) {
          // Calculate local variance (texture indicator)
          double meanIntensity = 0;
          final samples = <double>[];

          for (int dy = -2; dy <= 2; dy++) {
            for (int dx = -2; dx <= 2; dx++) {
              final pixel = image.getPixel(x + dx, y + dy);
              final intensity = (pixel.r + pixel.g + pixel.b) / 3;
              samples.add(intensity);
              meanIntensity += intensity;
            }
          }
          meanIntensity /= samples.length;

          // Calculate variance
          double variance = 0;
          for (final intensity in samples) {
            variance += (intensity - meanIntensity) * (intensity - meanIntensity);
          }
          variance /= samples.length;
          textureMap[y][x] = variance;
        }
      }

      // Refine mask using texture and gradient information
      for (int y = 0; y < image.height; y++) {
        for (int x = 0; x < image.width; x++) {
          if (mask[y][x] <= 200) {
            final pixel = image.getPixel(x, y);
            final color = [pixel.r.toInt(), pixel.g.toInt(), pixel.b.toInt()];

            final fgDist = _colorDistanceRGB(color, fgMean);
            final bgDist = _colorDistanceRGB(color, bgMean);
            final gradMag = _calculateGradientMagnitude(image, x, y);
            final texture = textureMap[y][x];

            // White backgrounds typically have low texture
            // Foreground items have higher texture even if they're light colored
            if (texture > 100 || gradMag > 20) {
              // High texture or edge - likely foreground
              mask[y][x] = 200;
            } else if (fgDist < bgDist * 0.9 && gradMag > 15) {
              // Color similar to foreground and has some edge
              mask[y][x] = 180;
            } else if (bgDist < fgDist * 1.2 && texture < 50) {
              // Color similar to background and low texture
              mask[y][x] = 0;
            } else if (mask[y][x] == 128) {
              // Unknown - use conservative threshold
              mask[y][x] = fgDist < bgDist ? 150 : 50;
            }
          }
        }
      }
    } else {
      // Original logic for non-white backgrounds
      for (int y = 0; y < image.height; y++) {
        for (int x = 0; x < image.width; x++) {
          if (mask[y][x] == 128) {
            final pixel = image.getPixel(x, y);
            final color = [pixel.r.toInt(), pixel.g.toInt(), pixel.b.toInt()];

            final fgDist = _colorDistanceRGB(color, fgMean);
            final bgDist = _colorDistanceRGB(color, bgMean);
            final gradMag = _calculateGradientMagnitude(image, x, y);

            if (fgDist < bgDist && gradMag < 30) {
              mask[y][x] = 255;
            } else if (bgDist < fgDist * 0.7) {
              mask[y][x] = 0;
            } else if (gradMag > 50) {
              mask[y][x] = 200;
            } else {
              mask[y][x] = 100;
            }
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
  
  /// Erode mask to remove white border pixels around the subject
  void _erodeMaskToRemoveWhiteBorders(img.Image image, List<List<int>> mask) {
    final height = mask.length;
    final width = mask[0].length;
    final eroded = List.generate(height, (y) => List.from(mask[y]));

    const whiteThreshold = 220; // Pixels brighter than this are considered white
    const erosionRadius = 3; // How many pixels to erode inward

    for (int y = erosionRadius; y < height - erosionRadius; y++) {
      for (int x = erosionRadius; x < width - erosionRadius; x++) {
        // Only process foreground pixels
        if (mask[y][x] > 100) {
          final pixel = image.getPixel(x, y);
          final r = pixel.r.toInt();
          final g = pixel.g.toInt();
          final b = pixel.b.toInt();
          final brightness = (r + g + b) / 3;

          // Check if this pixel is white-ish
          if (brightness > whiteThreshold) {
            // Check if this is a border pixel (has background neighbors)
            bool hasBgNeighbor = false;
            for (int dy = -1; dy <= 1; dy++) {
              for (int dx = -1; dx <= 1; dx++) {
                if (mask[y + dy][x + dx] < 100) {
                  hasBgNeighbor = true;
                  break;
                }
              }
              if (hasBgNeighbor) break;
            }

            // If it's a white pixel near the edge, erode it
            if (hasBgNeighbor) {
              eroded[y][x] = 0;
            }
          }

          // Additionally, erode any foreground pixel that has mostly background neighbors
          int bgNeighborCount = 0;
          for (int dy = -erosionRadius; dy <= erosionRadius; dy++) {
            for (int dx = -erosionRadius; dx <= erosionRadius; dx++) {
              if (dx == 0 && dy == 0) continue;
              final ny = y + dy;
              final nx = x + dx;
              if (ny >= 0 && ny < height && nx >= 0 && nx < width) {
                if (mask[ny][nx] < 50) bgNeighborCount++;
              }
            }
          }

          // If more than 60% of neighbors are background, this is likely a border pixel
          final totalNeighbors = (erosionRadius * 2 + 1) * (erosionRadius * 2 + 1) - 1;
          if (bgNeighborCount > totalNeighbors * 0.6) {
            final neighborPixel = image.getPixel(x, y);
            final neighborBrightness = (neighborPixel.r + neighborPixel.g + neighborPixel.b) / 3;

            // Only erode if it's white-ish
            if (neighborBrightness > 200) {
              eroded[y][x] = 0;
            }
          }
        }
      }
    }

    // Copy eroded values back to mask
    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        mask[y][x] = eroded[y][x];
      }
    }
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
  void _applyMaskToImage(img.Image image, List<List<int>> mask, bool isWhiteBackground) {
    const whiteThreshold = 215; // Pixels brighter than this might be background

    for (int y = 0; y < image.height; y++) {
      for (int x = 0; x < image.width; x++) {
        final alpha = mask[y][x];
        final pixel = image.getPixel(x, y);
        final r = pixel.r.toInt();
        final g = pixel.g.toInt();
        final b = pixel.b.toInt();
        final brightness = (r + g + b) / 3;

        if (alpha < 50) {
          // Background - make transparent
          image.setPixelRgba(x, y, 0, 0, 0, 0);
        } else if (alpha < 200) {
          // Edge region - apply partial transparency
          // For white backgrounds, be more aggressive with bright pixels
          if (isWhiteBackground && brightness > whiteThreshold) {
            // Check if this is really an edge or just white background
            final colorVariance = ((r - g).abs() + (g - b).abs() + (r - b).abs()) / 3;

            // If it's very white and has low color variance, make it more transparent
            if (colorVariance < 15 && brightness > 225) {
              image.setPixelRgba(x, y, 0, 0, 0, 0);
            } else if (colorVariance < 25 && brightness > 220) {
              // Very light and uniform - mostly transparent
              final newAlpha = (alpha * 0.3).round().clamp(0, 255);
              image.setPixelRgba(x, y, r, g, b, newAlpha);
            } else {
              // Less transparent but still reduced
              final newAlpha = (alpha * 0.7).round().clamp(0, 255);
              image.setPixelRgba(x, y, r, g, b, newAlpha);
            }
          } else {
            // Normal edge handling for non-white pixels
            final newAlpha = (alpha * 255 / 200).round().clamp(0, 255);
            image.setPixelRgba(x, y, r, g, b, newAlpha);
          }
        } else {
          // Foreground region
          // For white backgrounds, still check if foreground pixels are actually white background
          if (isWhiteBackground && brightness > 230) {
            final colorVariance = ((r - g).abs() + (g - b).abs() + (r - b).abs()) / 3;

            // If it's extremely white with no color variation, it might be background bleed
            if (colorVariance < 10) {
              image.setPixelRgba(x, y, 0, 0, 0, 0);
            }
          }
          // else: Keep as is with full opacity
        }
      }
    }
  }
  
  /// Aggressively remove any remaining white border pixels
  void _removeWhiteBorderPixels(img.Image image) {
    const whiteThreshold = 218;

    // Process all pixels
    for (int y = 0; y < image.height; y++) {
      for (int x = 0; x < image.width; x++) {
        final pixel = image.getPixel(x, y);
        final a = pixel.a.toInt();

        // Only process non-transparent pixels
        if (a > 0) {
          final r = pixel.r.toInt();
          final g = pixel.g.toInt();
          final b = pixel.b.toInt();
          final brightness = (r + g + b) / 3;
          final colorVariance = ((r - g).abs() + (g - b).abs() + (r - b).abs()) / 3;

          // Check if this pixel is white-ish and uniform
          if (brightness > whiteThreshold && colorVariance < 20) {
            // Check if this pixel is near a transparent pixel (edge detection)
            bool nearTransparent = false;
            int transparentNeighbors = 0;

            for (int dy = -2; dy <= 2; dy++) {
              for (int dx = -2; dx <= 2; dx++) {
                final nx = x + dx;
                final ny = y + dy;

                if (nx >= 0 && nx < image.width && ny >= 0 && ny < image.height) {
                  final neighborPixel = image.getPixel(nx, ny);
                  if (neighborPixel.a < 10) {
                    nearTransparent = true;
                    transparentNeighbors++;
                  }
                }
              }
            }

            // If this white pixel is near transparency, it's likely a border artifact
            if (nearTransparent) {
              if (transparentNeighbors > 3) {
                // Many transparent neighbors - definitely remove
                image.setPixelRgba(x, y, 0, 0, 0, 0);
              } else if (brightness > 235 && colorVariance < 10) {
                // Very white and uniform - likely background
                image.setPixelRgba(x, y, 0, 0, 0, 0);
              } else if (transparentNeighbors > 1) {
                // Some transparent neighbors - fade it out
                final newAlpha = (a * 0.3).round().clamp(0, 255);
                image.setPixelRgba(x, y, r, g, b, newAlpha);
              }
            }
          }
        }
      }
    }

    // Second pass: remove isolated white pixels
    final toRemove = <Map<String, int>>[];

    for (int y = 1; y < image.height - 1; y++) {
      for (int x = 1; x < image.width - 1; x++) {
        final pixel = image.getPixel(x, y);
        final a = pixel.a.toInt();

        if (a > 0) {
          final r = pixel.r.toInt();
          final g = pixel.g.toInt();
          final b = pixel.b.toInt();
          final brightness = (r + g + b) / 3;

          // Very bright pixels
          if (brightness > 230) {
            // Count non-white neighbors
            int coloredNeighbors = 0;

            for (int dy = -1; dy <= 1; dy++) {
              for (int dx = -1; dx <= 1; dx++) {
                if (dx == 0 && dy == 0) continue;

                final neighborPixel = image.getPixel(x + dx, y + dy);
                if (neighborPixel.a > 0) {
                  final neighborBrightness = (neighborPixel.r + neighborPixel.g + neighborPixel.b) / 3;
                  if (neighborBrightness < 200) {
                    coloredNeighbors++;
                  }
                }
              }
            }

            // If surrounded by darker pixels or transparent pixels, keep it
            // Otherwise it's isolated white - remove it
            if (coloredNeighbors < 2) {
              toRemove.add({'x': x, 'y': y});
            }
          }
        }
      }
    }

    // Remove isolated white pixels
    for (final pos in toRemove) {
      image.setPixelRgba(pos['x']!, pos['y']!, 0, 0, 0, 0);
    }
  }

  /// Find bounding box of the main item
  Map<String, int> _findItemBoundingBox(List<List<int>> mask) {
    int minX = mask[0].length, maxX = 0;
    int minY = mask.length, maxY = 0;

    bool foundForeground = false;

    // Use a lower threshold to catch more of the foreground
    // This is especially important for white backgrounds where edges might be subtle
    for (int y = 0; y < mask.length; y++) {
      for (int x = 0; x < mask[y].length; x++) {
        if (mask[y][x] > 50) { // Lower threshold to include more potential foreground
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

    // Add adaptive padding based on image size
    final width = mask[0].length;
    final height = mask.length;
    final padding = math.max(10, math.min(width, height) ~/ 30);

    minX = math.max(0, minX - padding);
    maxX = math.min(width - 1, maxX + padding);
    minY = math.max(0, minY - padding);
    maxY = math.min(height - 1, maxY + padding);

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