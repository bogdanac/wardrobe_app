import 'dart:convert';
import 'dart:io';
import 'package:archive/archive_io.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import '../../domain/entities/clothing_item.dart';
import '../../domain/entities/outfit.dart';
import '../../domain/repositories/clothing_repository.dart';
import '../../domain/repositories/outfit_repository.dart';
import '../../domain/repositories/category_repository.dart';
import '../../domain/repositories/custom_color_repository.dart';
import '../../domain/repositories/outfit_style_repository.dart';

class BackupExportService {
  final ClothingRepository _clothingRepository;
  final OutfitRepository _outfitRepository;
  final CategoryRepository _categoryRepository;
  final CustomColorRepository _customColorRepository;
  final OutfitStyleRepository _outfitStyleRepository;

  BackupExportService(
    this._clothingRepository,
    this._outfitRepository,
    this._categoryRepository,
    this._customColorRepository,
    this._outfitStyleRepository,
  );

  /// Export complete backup with data JSON and images ZIP
  /// Returns paths to the created files
  Future<Map<String, String>> exportCompleteBackup() async {
    try {
      final timestamp = DateTime.now().toIso8601String().replaceAll(':', '-');
      final tempDir = await getTemporaryDirectory();

      // 1. Export data to JSON
      final jsonPath = await _exportDataToJson(tempDir.path, timestamp);

      // 2. Export images to ZIP
      final zipPath = await _exportImagesToZip(tempDir.path, timestamp);

      return {
        'json': jsonPath,
        'zip': zipPath,
      };
    } catch (e) {
      throw Exception('Failed to create backup: $e');
    }
  }

  /// Export all data (items, outfits) to JSON file
  Future<String> _exportDataToJson(String dirPath, String timestamp) async {
    try {
      // Fetch all data
      final clothingItems = await _clothingRepository.getAllClothingItems();
      final archivedItems = await _clothingRepository.getArchivedClothingItems();
      final allItems = [...clothingItems, ...archivedItems];

      final outfits = await _outfitRepository.getAllOutfits();
      final archivedOutfits = await _outfitRepository.getArchivedOutfits();
      final allOutfits = [...outfits, ...archivedOutfits];

      final categories = await _categoryRepository.getAllCategories();
      final customColors = await _customColorRepository.getAllColors();
      final outfitStyles = await _outfitStyleRepository.getAllOutfitStyles();

      // Create backup data structure
      final backupData = {
        'version': '1.3.0',
        'exportDate': DateTime.now().toIso8601String(),
        'clothingItems': allItems.map((item) => _clothingItemToJson(item)).toList(),
        'outfits': allOutfits.map((outfit) => _outfitToJson(outfit)).toList(),
        'categories': categories.map((cat) => cat.toJson()).toList(),
        'customColors': customColors.map((color) => color.toJson()).toList(),
        'outfitStyles': outfitStyles.map((style) => style.toJson()).toList(),
      };

      // Write to file
      final jsonFile = File('$dirPath/wardrobe_data_$timestamp.json');
      await jsonFile.writeAsString(
        const JsonEncoder.withIndent('  ').convert(backupData),
      );

      return jsonFile.path;
    } catch (e) {
      throw Exception('Failed to export data to JSON: $e');
    }
  }

  /// Export all images to ZIP file
  Future<String> _exportImagesToZip(String dirPath, String timestamp) async {
    try {
      final clothingItems = await _clothingRepository.getAllClothingItems();
      final archivedItems = await _clothingRepository.getArchivedClothingItems();
      final allItems = [...clothingItems, ...archivedItems];

      // Create archive
      final archive = Archive();

      // Add all clothing item images
      // ignore: unused_local_variable
      int imageCount = 0;
      for (final item in allItems) {
        // Main image
        if (item.imagePath != null && item.imagePath!.isNotEmpty) {
          await _addImageToArchive(archive, item.imagePath!, 'clothing_${item.id}_main');
          imageCount++;
        }

        // Additional images
        for (int i = 0; i < item.additionalImages.length; i++) {
          final imagePath = item.additionalImages[i];
          await _addImageToArchive(archive, imagePath, 'clothing_${item.id}_extra_$i');
          imageCount++;
        }
      }

      // Add outfit preview images
      final outfits = await _outfitRepository.getAllOutfits();
      final archivedOutfits = await _outfitRepository.getArchivedOutfits();
      final allOutfits = [...outfits, ...archivedOutfits];

      for (final outfit in allOutfits) {
        if (outfit.imagePreviewPath != null && outfit.imagePreviewPath!.isNotEmpty) {
          await _addImageToArchive(archive, outfit.imagePreviewPath!, 'outfit_${outfit.id}_preview');
          imageCount++;
        }
      }

      // Write ZIP file
      final zipFile = File('$dirPath/wardrobe_images_$timestamp.zip');
      final outputStream = OutputFileStream(zipFile.path);
      ZipEncoder().encode(archive, output: outputStream);
      await outputStream.close();

      return zipFile.path;
    } catch (e) {
      throw Exception('Failed to export images to ZIP: $e');
    }
  }

  /// Add image file to archive
  Future<void> _addImageToArchive(Archive archive, String imagePath, String archiveName) async {
    try {
      final imageFile = File(imagePath);
      if (await imageFile.exists()) {
        final bytes = await imageFile.readAsBytes();
        final extension = imagePath.split('.').last;
        archive.addFile(ArchiveFile('$archiveName.$extension', bytes.length, bytes));
      }
    } catch (e) {
      // Skip this image if it fails
    }
  }

  /// Share backup files with user
  Future<void> shareBackupFiles(Map<String, String> backupPaths) async {
    try {
      final files = [
        XFile(backupPaths['json']!),
        XFile(backupPaths['zip']!),
      ];

      await Share.shareXFiles(
        files,
        subject: 'Wardrobe App Backup',
        text: 'Your complete wardrobe backup including data and images.',
      );
    } catch (e) {
      throw Exception('Failed to share backup files: $e');
    }
  }

  /// Convert ClothingItem to JSON
  Map<String, dynamic> _clothingItemToJson(ClothingItem item) {
    return {
      'id': item.id,
      'name': item.name,
      'brand': item.brand,
      'type': item.type.name,
      'imagePath': item.imagePath,
      'additionalImages': item.additionalImages,
      'colors': item.colors,
      'categories': item.categories,
      'seasons': item.seasons.map((e) => e.name).toList(),
      'weatherRanges': item.weatherRanges.map((e) => e.name).toList(),
      'wearCount': item.wearCount,
      'lastWornDate': item.lastWornDate?.toIso8601String(),
      'createdAt': item.createdAt.toIso8601String(),
      'updatedAt': item.updatedAt.toIso8601String(),
      'notes': item.notes,
      'tags': item.tags,
      'metallicElements': item.metallicElements.name,
      'sizeFit': item.sizeFit.name,
      'isArchived': item.isArchived,
    };
  }

  /// Convert Outfit to JSON
  Map<String, dynamic> _outfitToJson(Outfit outfit) {
    return {
      'id': outfit.id,
      'name': outfit.name,
      'clothingItemIds': outfit.clothingItemIds,
      'imagePreviewPath': outfit.imagePreviewPath,
      'categories': outfit.categories, // Deprecated: kept for backward compatibility
      'outfitStyles': outfit.outfitStyles,
      'seasons': outfit.seasons.map((e) => e.name).toList(),
      'weatherRanges': outfit.weatherRanges.map((e) => e.name).toList(),
      'isFavorite': outfit.isFavorite,
      'wearCount': outfit.wearCount,
      'lastWornDate': outfit.lastWornDate?.toIso8601String(),
      'createdAt': outfit.createdAt.toIso8601String(),
      'updatedAt': outfit.updatedAt.toIso8601String(),
      'tags': outfit.tags,
      'notes': outfit.notes,
      'isArchived': outfit.isArchived,
      'dateArchived': outfit.dateArchived?.toIso8601String(),
    };
  }
}
