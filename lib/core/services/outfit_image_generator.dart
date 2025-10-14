import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import '../../domain/entities/clothing_item.dart';
import '../../domain/entities/outfit.dart';
import '../../domain/repositories/clothing_repository.dart';

/// Service for generating combined outfit preview images
class OutfitImageGenerator {
  final ClothingRepository _clothingRepository;
  static const int _previewWidth = 400;
  static const int _previewHeight = 600;

  OutfitImageGenerator(this._clothingRepository);

  /// Generate a combined outfit preview image
  Future<String?> generateOutfitPreview({
    required Outfit outfit,
    PreviewStyle style = PreviewStyle.flatLay,
    bool cacheResult = true,
  }) async {
    try {
      // Get clothing items
      final items = <ClothingItem>[];
      for (final itemId in outfit.clothingItemIds) {
        final item = await _clothingRepository.getClothingItemById(itemId);
        if (item != null) items.add(item);
      }

      if (items.isEmpty) return null;

      // Check cache first
      if (cacheResult) {
        final cachedPath = await _getCachedPreview(outfit.id, style);
        if (cachedPath != null && await File(cachedPath).exists()) {
          return cachedPath;
        }
      }

      // Generate new preview
      final previewPath = await _generatePreviewImage(items, outfit.id, style);
      
      return previewPath;
    } catch (e) {
      throw Exception('Failed to generate outfit preview: $e');
    }
  }

  /// Generate preview with custom layout
  Future<String?> generateCustomPreview({
    required List<ClothingItem> items,
    required String outfitId,
    required CustomLayout layout,
  }) async {
    try {
      final previewPath = await _generateCustomLayoutImage(items, outfitId, layout);
      return previewPath;
    } catch (e) {
      throw Exception('Failed to generate custom preview: $e');
    }
  }

  /// Generate multiple preview styles for an outfit
  Future<Map<PreviewStyle, String?>> generateMultipleStyles({
    required Outfit outfit,
    List<PreviewStyle> styles = const [
      PreviewStyle.flatLay,
      PreviewStyle.hangerDisplay,
      PreviewStyle.modelSilhouette,
    ],
  }) async {
    final results = <PreviewStyle, String?>{};
    
    for (final style in styles) {
      try {
        final previewPath = await generateOutfitPreview(
          outfit: outfit,
          style: style,
          cacheResult: true,
        );
        results[style] = previewPath;
      } catch (e) {
        results[style] = null;
      }
    }

    return results;
  }

  /// Generate the actual preview image
  Future<String> _generatePreviewImage(
    List<ClothingItem> items,
    String outfitId,
    PreviewStyle style,
  ) async {
    // Load item images
    final itemImages = <ui.Image>[];
    for (final item in items) {
      if (item.imagePath != null && await File(item.imagePath!).exists()) {
        final image = await _loadImageFromFile(item.imagePath!);
        if (image != null) itemImages.add(image);
      }
    }

    if (itemImages.isEmpty) {
      throw Exception('No valid images found for outfit items');
    }

    // Create canvas and arrange items
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    
    // Set background
    final backgroundPaint = Paint()..color = Colors.white;
    canvas.drawRect(
      Rect.fromLTWH(0, 0, _previewWidth.toDouble(), _previewHeight.toDouble()),
      backgroundPaint,
    );

    // Arrange items based on style
    switch (style) {
      case PreviewStyle.flatLay:
        await _drawFlatLayLayout(canvas, items, itemImages);
        break;
      case PreviewStyle.hangerDisplay:
        await _drawHangerLayout(canvas, items, itemImages);
        break;
      case PreviewStyle.modelSilhouette:
        await _drawModelLayout(canvas, items, itemImages);
        break;
      case PreviewStyle.grid:
        await _drawGridLayout(canvas, items, itemImages);
        break;
    }

    // Convert to image and save
    final picture = recorder.endRecording();
    final image = await picture.toImage(_previewWidth, _previewHeight);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    
    if (byteData == null) {
      throw Exception('Failed to convert image to bytes');
    }

    return await _savePreviewImage(byteData.buffer.asUint8List(), outfitId, style);
  }

  /// Generate custom layout image
  Future<String> _generateCustomLayoutImage(
    List<ClothingItem> items,
    String outfitId,
    CustomLayout layout,
  ) async {
    final itemImages = <ui.Image>[];
    for (final item in items) {
      if (item.imagePath != null && await File(item.imagePath!).exists()) {
        final image = await _loadImageFromFile(item.imagePath!);
        if (image != null) itemImages.add(image);
      }
    }

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    
    // Set custom background
    final backgroundPaint = Paint()..color = layout.backgroundColor;
    canvas.drawRect(
      Rect.fromLTWH(0, 0, layout.width.toDouble(), layout.height.toDouble()),
      backgroundPaint,
    );

    // Draw items at custom positions
    for (int i = 0; i < itemImages.length && i < layout.itemPositions.length; i++) {
      final image = itemImages[i];
      final position = layout.itemPositions[i];
      
      await _drawItemAtPosition(canvas, image, position);
    }

    final picture = recorder.endRecording();
    final finalImage = await picture.toImage(layout.width, layout.height);
    final byteData = await finalImage.toByteData(format: ui.ImageByteFormat.png);
    
    if (byteData == null) {
      throw Exception('Failed to convert custom layout to bytes');
    }

    return await _savePreviewImage(
      byteData.buffer.asUint8List(),
      '${outfitId}_custom',
      PreviewStyle.flatLay,
    );
  }

  /// Draw flat lay layout (items arranged as if laid flat)
  Future<void> _drawFlatLayLayout(
    Canvas canvas,
    List<ClothingItem> items,
    List<ui.Image> images,
  ) async {
    final itemsByType = <ClothingType, List<ItemWithImage>>{};
    
    // Group items by type
    for (int i = 0; i < items.length && i < images.length; i++) {
      final item = items[i];
      final image = images[i];
      itemsByType.putIfAbsent(item.type, () => []).add(ItemWithImage(item, image));
    }

    // Define layout positions for flat lay
    final positions = <ClothingType, Rect>{
      ClothingType.top: const Rect.fromLTWH(150, 80, 100, 120),
      ClothingType.bottom: const Rect.fromLTWH(150, 220, 100, 140),
      ClothingType.dress: const Rect.fromLTWH(150, 80, 100, 200),
      ClothingType.shoes: const Rect.fromLTWH(120, 380, 80, 60),
      ClothingType.accessory: const Rect.fromLTWH(280, 120, 60, 60),
      ClothingType.bag: const Rect.fromLTWH(60, 150, 70, 80),
      ClothingType.outerwear: const Rect.fromLTWH(100, 60, 120, 140),
    };

    // Draw items at their designated positions
    for (final entry in itemsByType.entries) {
      final type = entry.key;
      final itemsWithImages = entry.value;
      final basePosition = positions[type];
      
      if (basePosition != null) {
        for (int i = 0; i < itemsWithImages.length; i++) {
          final itemWithImage = itemsWithImages[i];
          // Offset multiple items of same type slightly
          final offset = Offset(i * 10.0, i * 10.0);
          final position = ItemPosition(
            x: basePosition.left + offset.dx,
            y: basePosition.top + offset.dy,
            width: basePosition.width,
            height: basePosition.height,
            rotation: 0,
            scale: 1.0,
          );
          
          await _drawItemAtPosition(canvas, itemWithImage.image, position);
        }
      }
    }
  }

  /// Draw hanger display layout (items arranged as if on hangers)
  Future<void> _drawHangerLayout(
    Canvas canvas,
    List<ClothingItem> items,
    List<ui.Image> images,
  ) async {
    // Draw hanger background
    final hangerPaint = Paint()
      ..color = Colors.brown
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    // Draw hanger hook
    canvas.drawLine(
      const Offset(200, 20),
      const Offset(200, 50),
      hangerPaint,
    );

    // Draw hanger bar
    canvas.drawLine(
      const Offset(120, 50),
      const Offset(280, 50),
      hangerPaint,
    );

    // Arrange items in hanging positions
    final hangingPositions = <ClothingType, ItemPosition>{
      ClothingType.top: ItemPosition(x: 150, y: 60, width: 100, height: 120),
      ClothingType.dress: ItemPosition(x: 150, y: 60, width: 100, height: 200),
      ClothingType.outerwear: ItemPosition(x: 140, y: 55, width: 120, height: 140),
      ClothingType.bottom: ItemPosition(x: 150, y: 200, width: 100, height: 120),
      ClothingType.shoes: ItemPosition(x: 130, y: 350, width: 70, height: 50),
    };

    for (int i = 0; i < items.length && i < images.length; i++) {
      final item = items[i];
      final image = images[i];
      final position = hangingPositions[item.type];
      
      if (position != null) {
        await _drawItemAtPosition(canvas, image, position);
      }
    }
  }

  /// Draw model silhouette layout
  Future<void> _drawModelLayout(
    Canvas canvas,
    List<ClothingItem> items,
    List<ui.Image> images,
  ) async {
    // Draw simple model silhouette
    final silhouettePaint = Paint()
      ..color = Colors.grey.withValues(alpha: 0.3)
      ..style = PaintingStyle.fill;

    // Head
    canvas.drawCircle(const Offset(200, 80), 25, silhouettePaint);
    
    // Body
    canvas.drawRect(
      const Rect.fromLTWH(175, 105, 50, 150),
      silhouettePaint,
    );
    
    // Arms
    canvas.drawRect(
      const Rect.fromLTWH(140, 115, 20, 100),
      silhouettePaint,
    );
    canvas.drawRect(
      const Rect.fromLTWH(240, 115, 20, 100),
      silhouettePaint,
    );
    
    // Legs
    canvas.drawRect(
      const Rect.fromLTWH(185, 255, 15, 120),
      silhouettePaint,
    );
    canvas.drawRect(
      const Rect.fromLTWH(200, 255, 15, 120),
      silhouettePaint,
    );

    // Position items on the model
    final modelPositions = <ClothingType, ItemPosition>{
      ClothingType.top: ItemPosition(x: 170, y: 110, width: 60, height: 80),
      ClothingType.bottom: ItemPosition(x: 175, y: 180, width: 50, height: 75),
      ClothingType.dress: ItemPosition(x: 170, y: 110, width: 60, height: 130),
      ClothingType.shoes: ItemPosition(x: 180, y: 370, width: 40, height: 30),
      ClothingType.accessory: ItemPosition(x: 210, y: 140, width: 30, height: 30),
    };

    for (int i = 0; i < items.length && i < images.length; i++) {
      final item = items[i];
      final image = images[i];
      final position = modelPositions[item.type];
      
      if (position != null) {
        await _drawItemAtPosition(canvas, image, position);
      }
    }
  }

  /// Draw grid layout
  Future<void> _drawGridLayout(
    Canvas canvas,
    List<ClothingItem> items,
    List<ui.Image> images,
  ) async {
    const itemsPerRow = 2;
    const itemWidth = 180.0;
    const itemHeight = 200.0;
    const padding = 20.0;

    for (int i = 0; i < images.length; i++) {
      final row = i ~/ itemsPerRow;
      final col = i % itemsPerRow;
      
      final x = padding + col * (itemWidth + padding);
      final y = padding + row * (itemHeight + padding);
      
      final position = ItemPosition(
        x: x,
        y: y,
        width: itemWidth,
        height: itemHeight,
      );
      
      await _drawItemAtPosition(canvas, images[i], position);
    }
  }

  /// Draw item at specific position
  Future<void> _drawItemAtPosition(
    Canvas canvas,
    ui.Image image,
    ItemPosition position,
  ) async {
    canvas.save();
    
    // Apply transformations
    canvas.translate(position.x + position.width / 2, position.y + position.height / 2);
    canvas.rotate(position.rotation * 3.14159 / 180); // Convert to radians
    canvas.scale(position.scale);
    canvas.translate(-position.width / 2, -position.height / 2);
    
    // Draw the image
    final srcRect = Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble());
    final dstRect = Rect.fromLTWH(0, 0, position.width, position.height);
    
    canvas.drawImageRect(image, srcRect, dstRect, Paint());
    
    canvas.restore();
  }

  /// Load image from file
  Future<ui.Image?> _loadImageFromFile(String imagePath) async {
    try {
      final file = File(imagePath);
      if (!await file.exists()) return null;
      
      final bytes = await file.readAsBytes();
      final codec = await ui.instantiateImageCodec(bytes);
      final frame = await codec.getNextFrame();
      return frame.image;
    } catch (e) {
      return null;
    }
  }

  /// Save preview image to storage
  Future<String> _savePreviewImage(
    Uint8List imageBytes,
    String outfitId,
    PreviewStyle style,
  ) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final previewsDir = Directory('${directory.path}/outfit_previews');
      
      if (!await previewsDir.exists()) {
        await previewsDir.create(recursive: true);
      }
      
      final fileName = '${outfitId}_${style.name}.png';
      final file = File('${previewsDir.path}/$fileName');
      
      await file.writeAsBytes(imageBytes);
      
      return file.path;
    } catch (e) {
      throw Exception('Failed to save preview image: $e');
    }
  }

  /// Check for cached preview
  Future<String?> _getCachedPreview(String outfitId, PreviewStyle style) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final fileName = '${outfitId}_${style.name}.png';
      final filePath = '${directory.path}/outfit_previews/$fileName';
      
      final file = File(filePath);
      if (await file.exists()) {
        // Check if cache is not too old (e.g., 7 days)
        final lastModified = await file.lastModified();
        final age = DateTime.now().difference(lastModified);
        
        if (age.inDays < 7) {
          return filePath;
        }
      }
      
      return null;
    } catch (e) {
      return null;
    }
  }

  /// Clear cached previews
  Future<void> clearCache() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final previewsDir = Directory('${directory.path}/outfit_previews');
      
      if (await previewsDir.exists()) {
        await previewsDir.delete(recursive: true);
      }
    } catch (e) {
      // Ignore cache clearing errors
    }
  }

  /// Get cache size
  Future<int> getCacheSize() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final previewsDir = Directory('${directory.path}/outfit_previews');
      
      if (!await previewsDir.exists()) return 0;
      
      int totalSize = 0;
      await for (final entity in previewsDir.list()) {
        if (entity is File) {
          final size = await entity.length();
          totalSize += size;
        }
      }
      
      return totalSize;
    } catch (e) {
      return 0;
    }
  }
}

/// Preview styles
enum PreviewStyle {
  flatLay,      // Items laid flat as if on a bed
  hangerDisplay, // Items arranged on hangers
  modelSilhouette, // Items positioned on a model silhouette
  grid,         // Simple grid layout
}

/// Item position for custom layouts
class ItemPosition {
  final double x;
  final double y;
  final double width;
  final double height;
  final double rotation; // in degrees
  final double scale;

  ItemPosition({
    required this.x,
    required this.y,
    required this.width,
    required this.height,
    this.rotation = 0,
    this.scale = 1.0,
  });
}

/// Custom layout configuration
class CustomLayout {
  final int width;
  final int height;
  final Color backgroundColor;
  final List<ItemPosition> itemPositions;

  CustomLayout({
    required this.width,
    required this.height,
    required this.backgroundColor,
    required this.itemPositions,
  });
}

/// Helper class for pairing items with images
class ItemWithImage {
  final ClothingItem item;
  final ui.Image image;

  ItemWithImage(this.item, this.image);
}