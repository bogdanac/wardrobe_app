import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/database_service.dart';
import '../../data/models/clothing_item_model.dart';
import '../../data/models/outfit_model.dart';
import '../../data/models/category_model.dart';
import '../../data/models/color_palette_model.dart';
import '../../domain/entities/clothing_item.dart';

class BackupData {
  final List<Map<String, dynamic>> clothingItems;
  final List<Map<String, dynamic>> outfits;
  final List<Map<String, dynamic>> categories;
  final List<Map<String, dynamic>> colorPalettes;
  final List<String> styleCategories;
  final Map<String, dynamic> metadata;

  const BackupData({
    required this.clothingItems,
    required this.outfits,
    required this.categories,
    required this.colorPalettes,
    required this.styleCategories,
    required this.metadata,
  });

  Map<String, dynamic> toJson() {
    return {
      'clothingItems': clothingItems,
      'outfits': outfits,
      'categories': categories,
      'colorPalettes': colorPalettes,
      'styleCategories': styleCategories,
      'metadata': metadata,
    };
  }

  factory BackupData.fromJson(Map<String, dynamic> json) {
    return BackupData(
      clothingItems: List<Map<String, dynamic>>.from(json['clothingItems'] ?? []),
      outfits: List<Map<String, dynamic>>.from(json['outfits'] ?? []),
      categories: List<Map<String, dynamic>>.from(json['categories'] ?? []),
      colorPalettes: List<Map<String, dynamic>>.from(json['colorPalettes'] ?? []),
      styleCategories: List<String>.from(json['styleCategories'] ?? []),
      metadata: Map<String, dynamic>.from(json['metadata'] ?? {}),
    );
  }
}

class BackupService {
  static const String _fileExtension = '.wardrobebackup';
  static const String _styleCategoriesKey = 'custom_style_categories';
  final DatabaseService _databaseService = DatabaseService.instance;

  Future<BackupData> createBackup() async {
    try {
      final isar = await _databaseService.isar;
      final prefs = await SharedPreferences.getInstance();

      // Get all data from database
      final clothingItems = await isar.clothingItemModels.where().findAll();
      final outfits = await isar.outfitModels.where().findAll();
      final categories = await isar.categoryModels.where().findAll();
      final colorPalettes = await isar.colorPaletteModels.where().findAll();
      
      // Get style categories from SharedPreferences
      final styleCategories = prefs.getStringList(_styleCategoriesKey) ?? [];

      // Convert to JSON-serializable format
      final clothingItemsJson = clothingItems.map((item) => {
        'id': item.id,
        'name': item.name,
        'type': item.type.name,
        'imagePath': item.imagePath,
        'colors': item.colors,
        'categories': item.categories,
        'season': item.season?.name,
        'weatherRanges': item.weatherRanges.map((range) => range.name).toList(),
        'wearCount': item.wearCount,
        'lastWornDate': item.lastWornDate?.toIso8601String(),
        'createdAt': item.createdAt.toIso8601String(),
        'updatedAt': item.updatedAt.toIso8601String(),
        'notes': item.notes,
        'tags': item.tags,
      }).toList();

      final outfitsJson = outfits.map((outfit) => {
        'id': outfit.id,
        'name': outfit.name,
        'clothingItemIds': outfit.clothingItemIds,
        'categories': outfit.categories,
        'season': outfit.season?.name,
        'weatherRanges': outfit.weatherRanges.map((range) => range.name).toList(),
        'wearCount': outfit.wearCount,
        'lastWornDate': outfit.lastWornDate?.toIso8601String(),
        'createdAt': outfit.createdAt.toIso8601String(),
        'updatedAt': outfit.updatedAt.toIso8601String(),
        'notes': outfit.notes,
        'tags': outfit.tags,
        'isFavorite': outfit.isFavorite,
        'imagePreviewPath': outfit.imagePreviewPath,
      }).toList();

      final categoriesJson = categories.map((category) => {
        'id': category.id,
        'name': category.name,
        'colorValue': category.colorValue,
        'createdAt': category.createdAt.toIso8601String(),
        'updatedAt': category.updatedAt.toIso8601String(),
        'description': category.description,
        'iconCodePoint': category.iconCodePoint,
      }).toList();

      final colorPalettesJson = colorPalettes.map((palette) => {
        'id': palette.id,
        'name': palette.name,
        'colorValues': palette.colorValues,
        'createdAt': palette.createdAt.toIso8601String(),
        'updatedAt': palette.updatedAt.toIso8601String(),
        'description': palette.description,
        'isCustom': palette.isCustom,
      }).toList();

      final metadata = {
        'version': '1.0.0',
        'createdAt': DateTime.now().toIso8601String(),
        'appVersion': '1.0.0',
        'itemCount': clothingItems.length,
        'outfitCount': outfits.length,
        'categoryCount': categories.length,
        'paletteCount': colorPalettes.length,
        'styleCategoryCount': styleCategories.length,
      };

      return BackupData(
        clothingItems: clothingItemsJson,
        outfits: outfitsJson,
        categories: categoriesJson,
        colorPalettes: colorPalettesJson,
        styleCategories: styleCategories,
        metadata: metadata,
      );
    } catch (e) {
      throw Exception('Failed to create backup: $e');
    }
  }

  Future<String> exportBackup() async {
    try {
      final backupData = await createBackup();
      final jsonString = jsonEncode(backupData.toJson());

      // Get app documents directory
      final directory = await getApplicationDocumentsDirectory();
      final timestamp = DateTime.now().toIso8601String().replaceAll(':', '-').split('.')[0];
      final fileName = 'wardrobe_backup_$timestamp$_fileExtension';
      final file = File('${directory.path}/$fileName');

      // Write backup to file
      await file.writeAsString(jsonString);

      return file.path;
    } catch (e) {
      throw Exception('Failed to export backup: $e');
    }
  }

  Future<void> shareBackup() async {
    try {
      final filePath = await exportBackup();
      await Share.shareXFiles([XFile(filePath)], text: 'My Wardrobe Backup');
    } catch (e) {
      throw Exception('Failed to share backup: $e');
    }
  }

  Future<BackupData> importBackup() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowedExtensions: [_fileExtension.substring(1)], // Remove the dot
      );

      if (result != null && result.files.single.path != null) {
        final file = File(result.files.single.path!);
        final jsonString = await file.readAsString();
        final jsonData = jsonDecode(jsonString) as Map<String, dynamic>;
        
        return BackupData.fromJson(jsonData);
      } else {
        throw Exception('No file selected');
      }
    } catch (e) {
      throw Exception('Failed to import backup: $e');
    }
  }

  Future<void> restoreBackup(BackupData backupData, {bool clearExisting = true}) async {
    try {
      final isar = await _databaseService.isar;

      await isar.writeTxn(() async {
        if (clearExisting) {
          // Clear existing data
          await isar.clothingItemModels.clear();
          await isar.outfitModels.clear();
          await isar.categoryModels.clear();
          await isar.colorPaletteModels.clear();
        }

        // Restore clothing items
        for (final itemJson in backupData.clothingItems) {
          try {
            final item = ClothingItemModel(
              id: itemJson['id'],
              name: itemJson['name'],
              type: _parseClothingType(itemJson['type']),
              imagePath: itemJson['imagePath'],
              colors: List<String>.from(itemJson['colors'] ?? []),
              categories: List<String>.from(itemJson['categories'] ?? []),
              season: itemJson['season'] != null ? _parseSeason(itemJson['season']) : null,
              weatherRanges: (itemJson['weatherRanges'] as List<dynamic>?)
                  ?.map((range) => _parseWeatherRange(range))
                  .toList() ?? [],
              wearCount: itemJson['wearCount'] ?? 0,
              lastWornDate: itemJson['lastWornDate'] != null
                  ? DateTime.parse(itemJson['lastWornDate'])
                  : null,
              createdAt: DateTime.parse(itemJson['createdAt']),
              updatedAt: DateTime.parse(itemJson['updatedAt']),
              notes: itemJson['notes'],
              tags: List<String>.from(itemJson['tags'] ?? []),
            );
            await isar.clothingItemModels.put(item);
          } catch (e) {
            // Skip invalid items but continue with others
            debugPrint('Skipping invalid clothing item: $e');
          }
        }

        // Restore outfits
        for (final outfitJson in backupData.outfits) {
          try {
            final outfit = OutfitModel(
              id: outfitJson['id'],
              name: outfitJson['name'],
              clothingItemIds: List<String>.from(outfitJson['clothingItemIds'] ?? []),
              categories: List<String>.from(outfitJson['categories'] ?? []),
              season: outfitJson['season'] != null ? _parseSeason(outfitJson['season']) : null,
              weatherRanges: (outfitJson['weatherRanges'] as List<dynamic>?)
                  ?.map((range) => _parseWeatherRange(range))
                  .toList() ?? [],
              wearCount: outfitJson['wearCount'] ?? 0,
              lastWornDate: outfitJson['lastWornDate'] != null
                  ? DateTime.parse(outfitJson['lastWornDate'])
                  : null,
              createdAt: DateTime.parse(outfitJson['createdAt']),
              updatedAt: DateTime.parse(outfitJson['updatedAt']),
              notes: outfitJson['notes'],
              tags: List<String>.from(outfitJson['tags'] ?? []),
              isFavorite: outfitJson['isFavorite'] ?? false,
              imagePreviewPath: outfitJson['imagePreviewPath'],
            );
            await isar.outfitModels.put(outfit);
          } catch (e) {
            debugPrint('Skipping invalid outfit: $e');
          }
        }

        // Restore categories
        for (final categoryJson in backupData.categories) {
          try {
            final category = CategoryModel(
              id: categoryJson['id'],
              name: categoryJson['name'],
              colorValue: categoryJson['colorValue'],
              createdAt: DateTime.parse(categoryJson['createdAt']),
              updatedAt: DateTime.parse(categoryJson['updatedAt']),
              description: categoryJson['description'],
              iconCodePoint: categoryJson['iconCodePoint'],
            );
            await isar.categoryModels.put(category);
          } catch (e) {
            debugPrint('Skipping invalid category: $e');
          }
        }

        // Restore color palettes
        for (final paletteJson in backupData.colorPalettes) {
          try {
            final palette = ColorPaletteModel(
              id: paletteJson['id'],
              name: paletteJson['name'],
              colorValues: List<int>.from(paletteJson['colorValues'] ?? []),
              createdAt: DateTime.parse(paletteJson['createdAt']),
              updatedAt: DateTime.parse(paletteJson['updatedAt']),
              description: paletteJson['description'],
              isCustom: paletteJson['isCustom'] ?? true,
            );
            await isar.colorPaletteModels.put(palette);
          } catch (e) {
            debugPrint('Skipping invalid color palette: $e');
          }
        }
      });
      
      // Restore style categories to SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList(_styleCategoriesKey, backupData.styleCategories);
      
    } catch (e) {
      throw Exception('Failed to restore backup: $e');
    }
  }

  // Helper methods to parse enums from strings
  ClothingType _parseClothingType(String typeName) {
    return ClothingType.values.firstWhere(
      (type) => type.name == typeName,
      orElse: () => ClothingType.top,
    );
  }

  Season _parseSeason(String seasonName) {
    return Season.values.firstWhere(
      (season) => season.name == seasonName,
      orElse: () => Season.allSeason,
    );
  }

  WeatherRange _parseWeatherRange(String rangeName) {
    return WeatherRange.values.firstWhere(
      (range) => range.name == rangeName,
      orElse: () => WeatherRange.warm,
    );
  }
}

