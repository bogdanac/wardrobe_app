import 'dart:convert';
import 'dart:io';
import 'package:archive/archive_io.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../domain/entities/clothing_item.dart';
import '../../domain/entities/outfit.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/custom_color.dart';
import '../../domain/entities/outfit_style.dart';
import '../../domain/repositories/clothing_repository.dart';
import '../../domain/repositories/outfit_repository.dart';
import '../../domain/repositories/category_repository.dart';
import '../../domain/repositories/custom_color_repository.dart';
import '../../domain/repositories/outfit_style_repository.dart';

class BackupImportService {
  final ClothingRepository _clothingRepository;
  final OutfitRepository _outfitRepository;
  final CategoryRepository _categoryRepository;
  final CustomColorRepository _customColorRepository;
  final OutfitStyleRepository _outfitStyleRepository;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  BackupImportService(
    this._clothingRepository,
    this._outfitRepository,
    this._categoryRepository,
    this._customColorRepository,
    this._outfitStyleRepository,
  );

  /// Import complete backup from JSON and ZIP files
  /// Supports both old Isar format and new Firebase format
  /// Returns statistics about the import
  Future<ImportResult> importCompleteBackup({
    required String jsonFilePath,
    String? zipFilePath,
    Function(String)? onProgress,
  }) async {
    try {
      onProgress?.call('Reading backup files...');

      // 1. Read and parse JSON
      final jsonFile = File(jsonFilePath);
      final jsonContent = await jsonFile.readAsString();
      final backupData = json.decode(jsonContent) as Map<String, dynamic>;

      // 2. Extract images to temp directory (if ZIP provided)
      final imageFiles = <String, File>{};
      String? extractPath;

      if (zipFilePath != null) {
        onProgress?.call('Extracting images...');
        final tempDir = await getTemporaryDirectory();
        extractPath = '${tempDir.path}/wardrobe_restore_${DateTime.now().millisecondsSinceEpoch}';
        await _extractZipFile(zipFilePath, extractPath);

        // 3. Create image lookup map (filename -> extracted file)
        final extractDir = Directory(extractPath);
        if (await extractDir.exists()) {
          await for (final fileEntity in extractDir.list(recursive: true)) {
            if (fileEntity is File) {
              final filename = fileEntity.path.split(Platform.pathSeparator).last;
              imageFiles[filename] = fileEntity;
              onProgress?.call('Found image: $filename');
            }
          }
        }
        onProgress?.call('Total images found in ZIP: ${imageFiles.length}');
      } else {
        onProgress?.call('No ZIP file provided - images will be copied from local paths');
      }

      int itemsImported = 0;
      int outfitsImported = 0;
      int categoriesImported = 0;
      int customColorsImported = 0;
      int outfitStylesImported = 0;
      int imagesUploaded = 0;
      final errors = <String>[];

      // 4. Import categories first (if available)
      final categoriesData = backupData['categories'] as List? ?? [];
      if (categoriesData.isNotEmpty) {
        onProgress?.call('Importing ${categoriesData.length} categories...');

        for (final categoryData in categoriesData) {
          try {
            final category = Category.fromJson(categoryData as Map<String, dynamic>);
            await _categoryRepository.saveCategory(category);
            categoriesImported++;
          } catch (e) {
            errors.add('Failed to import category: $e');
          }
        }
      }

      // 4.5. Import custom colors (if available)
      final customColorsData = backupData['customColors'] as List? ?? [];
      if (customColorsData.isNotEmpty) {
        onProgress?.call('Importing ${customColorsData.length} custom colors...');

        for (final colorData in customColorsData) {
          try {
            final customColor = CustomColor.fromJson(colorData as Map<String, dynamic>);
            await _customColorRepository.saveColor(customColor);
            customColorsImported++;
          } catch (e) {
            errors.add('Failed to import custom color: $e');
          }
        }
      }

      // 4.6. Import outfit styles (if available)
      final outfitStylesData = backupData['outfitStyles'] as List? ?? [];
      if (outfitStylesData.isNotEmpty) {
        onProgress?.call('Importing ${outfitStylesData.length} outfit styles...');

        for (final styleData in outfitStylesData) {
          try {
            final outfitStyle = OutfitStyle.fromJson(styleData as Map<String, dynamic>);
            await _outfitStyleRepository.saveOutfitStyle(outfitStyle);
            outfitStylesImported++;
          } catch (e) {
            errors.add('Failed to import outfit style: $e');
          }
        }
      }

      // 5. Import clothing items
      final clothingItemsData = backupData['clothingItems'] as List? ?? [];
      onProgress?.call('Importing ${clothingItemsData.length} clothing items...');

      for (int i = 0; i < clothingItemsData.length; i++) {
        try {
          final itemData = clothingItemsData[i] as Map<String, dynamic>;
          onProgress?.call('Importing item ${i + 1}/${clothingItemsData.length}...');

          // Upload images to Firebase Storage and get URLs
          String? mainImageUrl;
          final additionalImageUrls = <String>[];

          // Upload main image
          if (itemData['imagePath'] != null) {
            final localPath = itemData['imagePath'] as String;
            File? imageFile;

            // Try to find in extracted ZIP first
            if (imageFiles.isNotEmpty) {
              imageFile = _findImageFile(imageFiles, itemData['id'], 'main');
            }

            // If not in ZIP, try local file path (old Isar backup)
            if (imageFile == null && localPath.isNotEmpty) {
              final localFile = File(localPath);
              if (await localFile.exists()) {
                imageFile = localFile;
              }
            }

            if (imageFile != null) {
              mainImageUrl = await _uploadImageToFirebase(
                imageFile,
                'clothing_items/${itemData['id']}/main.jpg',
              );
              imagesUploaded++;
            }
          }

          // Upload additional images
          final additionalImages = itemData['additionalImages'] as List? ?? [];
          for (int j = 0; j < additionalImages.length; j++) {
            File? imageFile;

            // Try to find in extracted ZIP first
            if (imageFiles.isNotEmpty) {
              imageFile = _findImageFile(imageFiles, itemData['id'], 'extra_$j');
            }

            // If not in ZIP, try local file path (old Isar backup)
            if (imageFile == null && j < additionalImages.length) {
              final localPath = additionalImages[j] as String;
              if (localPath.isNotEmpty) {
                final localFile = File(localPath);
                if (await localFile.exists()) {
                  imageFile = localFile;
                }
              }
            }

            if (imageFile != null) {
              final url = await _uploadImageToFirebase(
                imageFile,
                'clothing_items/${itemData['id']}/extra_$j.jpg',
              );
              additionalImageUrls.add(url);
              imagesUploaded++;
            }
          }

          // Create ClothingItem with Firebase URLs
          final item = _clothingItemFromJson(itemData, mainImageUrl, additionalImageUrls);
          await _clothingRepository.saveClothingItem(item);
          itemsImported++;
        } catch (e) {
          errors.add('Failed to import clothing item: $e');
        }
      }

      // 6. Import outfits
      final outfitsData = backupData['outfits'] as List? ?? [];
      onProgress?.call('Importing ${outfitsData.length} outfits...');

      for (int i = 0; i < outfitsData.length; i++) {
        try {
          final outfitData = outfitsData[i] as Map<String, dynamic>;
          onProgress?.call('Importing outfit ${i + 1}/${outfitsData.length}...');

          // Upload outfit preview image
          String? previewImageUrl;
          if (outfitData['imagePreviewPath'] != null) {
            final localPath = outfitData['imagePreviewPath'] as String;
            File? imageFile;

            // Try to find in extracted ZIP first
            if (imageFiles.isNotEmpty) {
              imageFile = _findImageFile(imageFiles, outfitData['id'], 'preview', isOutfit: true);
            }

            // If not in ZIP, try local file path (old Isar backup)
            if (imageFile == null && localPath.isNotEmpty) {
              final localFile = File(localPath);
              if (await localFile.exists()) {
                imageFile = localFile;
              }
            }

            if (imageFile != null) {
              previewImageUrl = await _uploadImageToFirebase(
                imageFile,
                'outfits/${outfitData['id']}/preview.jpg',
              );
              imagesUploaded++;
            }
          }

          // Create Outfit with Firebase URL
          final outfit = _outfitFromJson(outfitData, previewImageUrl);
          await _outfitRepository.saveOutfit(outfit);
          outfitsImported++;
        } catch (e) {
          errors.add('Failed to import outfit: $e');
        }
      }

      // 7. Cleanup temp directory
      onProgress?.call('Cleaning up...');
      if (extractPath != null) {
        try {
          final extractDir = Directory(extractPath);
          if (await extractDir.exists()) {
            await extractDir.delete(recursive: true);
          }
        } catch (e) {
          // Ignore cleanup errors
        }
      }

      onProgress?.call('Import complete!');

      return ImportResult(
        itemsImported: itemsImported,
        outfitsImported: outfitsImported,
        categoriesImported: categoriesImported,
        customColorsImported: customColorsImported,
        outfitStylesImported: outfitStylesImported,
        imagesUploaded: imagesUploaded,
        errors: errors,
      );
    } catch (e) {
      throw Exception('Failed to import backup: $e');
    }
  }

  /// Extract ZIP file to directory
  Future<void> _extractZipFile(String zipPath, String extractPath) async {
    final zipFile = File(zipPath);
    final bytes = await zipFile.readAsBytes();
    final archive = ZipDecoder().decodeBytes(bytes);

    final extractDir = Directory(extractPath);
    if (!await extractDir.exists()) {
      await extractDir.create(recursive: true);
    }

    for (final file in archive) {
      final filename = file.name;
      if (file.isFile) {
        final data = file.content as List<int>;
        final outputFile = File('$extractPath/$filename');
        await outputFile.create(recursive: true);
        await outputFile.writeAsBytes(data);
      }
    }
  }

  /// Find image file in extracted files
  File? _findImageFile(
    Map<String, File> imageFiles,
    String itemId,
    String suffix, {
    bool isOutfit = false,
  }) {
    // Try both old format (guid_main.jpg) and new format (clothing_guid_main.jpg)
    final prefix = isOutfit ? 'outfit_' : 'clothing_';
    final newPattern = '$prefix${itemId}_$suffix';
    final oldPattern = '${itemId}_$suffix';


    // Search by filename (imageFiles keys are now just filenames)
    for (final entry in imageFiles.entries) {
      final filename = entry.key;
      // Try new format first, then old format
      if (filename.startsWith(newPattern) || filename.startsWith(oldPattern)) {
        return entry.value;
      }
    }

    return null;
  }

  /// Upload image to Firebase Storage and return download URL
  Future<String> _uploadImageToFirebase(File imageFile, String storagePath) async {
    try {
      final ref = _storage.ref().child(storagePath);
      await ref.putFile(imageFile);
      final downloadUrl = await ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      throw Exception('Failed to upload image to Firebase: $e');
    }
  }

  /// Convert JSON to ClothingItem with Firebase URLs
  ClothingItem _clothingItemFromJson(
    Map<String, dynamic> json,
    String? firebaseImageUrl,
    List<String> firebaseAdditionalUrls,
  ) {
    return ClothingItem(
      id: json['id'] as String,
      name: json['name'] as String,
      brand: json['brand'] as String?,
      type: ClothingType.values.firstWhere((e) => e.name == json['type']),
      imagePath: firebaseImageUrl,
      additionalImages: firebaseAdditionalUrls,
      colors: (json['colors'] as List?)?.cast<String>() ?? [],
      categories: (json['categories'] as List?)?.cast<String>() ?? [],
      seasons: json['season'] != null
          ? [Season.values.firstWhere((e) => e.name == json['season'])]
          : (json['seasons'] as List?)
              ?.map((e) => Season.values.firstWhere((s) => s.name == e))
              .toList() ?? [],
      weatherRanges: (json['weatherRanges'] as List?)
          ?.map((e) => WeatherRange.values.firstWhere((wr) => wr.name == e))
          .toList() ?? [],
      wearCount: json['wearCount'] as int? ?? 0,
      lastWornDate: json['lastWornDate'] != null
          ? DateTime.parse(json['lastWornDate'] as String)
          : null,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      notes: json['notes'] as String?,
      tags: (json['tags'] as List?)?.cast<String>() ?? [],
      metallicElements: MetallicElements.values.firstWhere(
        (e) => e.name == json['metallicElements'],
        orElse: () => MetallicElements.none,
      ),
      sizeFit: SizeFit.values.firstWhere(
        (e) => e.name == json['sizeFit'],
        orElse: () => SizeFit.perfect,
      ),
      isArchived: json['isArchived'] as bool? ?? false,
    );
  }

  /// Convert JSON to Outfit with Firebase URL
  Outfit _outfitFromJson(Map<String, dynamic> json, String? firebasePreviewUrl) {
    return Outfit(
      id: json['id'] as String,
      name: json['name'] as String,
      clothingItemIds: (json['clothingItemIds'] as List?)?.cast<String>() ?? [],
      imagePreviewPath: firebasePreviewUrl,
      categories: (json['categories'] as List?)?.cast<String>() ?? [], // Backward compatibility
      outfitStyles: (json['outfitStyles'] as List?)?.cast<String>() ?? [],
      seasons: json['season'] != null
          ? [Season.values.firstWhere((e) => e.name == json['season'])]
          : (json['seasons'] as List?)
              ?.map((e) => Season.values.firstWhere((s) => s.name == e))
              .toList() ?? [],
      weatherRanges: (json['weatherRanges'] as List?)
          ?.map((e) => WeatherRange.values.firstWhere((wr) => wr.name == e))
          .toList() ?? [],
      isFavorite: json['isFavorite'] as bool? ?? false,
      wearCount: json['wearCount'] as int? ?? 0,
      lastWornDate: json['lastWornDate'] != null
          ? DateTime.parse(json['lastWornDate'] as String)
          : null,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      tags: (json['tags'] as List?)?.cast<String>() ?? [],
      notes: json['notes'] as String?,
      isArchived: json['isArchived'] as bool? ?? false,
      dateArchived: json['dateArchived'] != null
          ? DateTime.parse(json['dateArchived'] as String)
          : null,
    );
  }
}

/// Result of backup import operation
class ImportResult {
  final int itemsImported;
  final int outfitsImported;
  final int categoriesImported;
  final int customColorsImported;
  final int outfitStylesImported;
  final int imagesUploaded;
  final List<String> errors;

  ImportResult({
    required this.itemsImported,
    required this.outfitsImported,
    required this.categoriesImported,
    required this.customColorsImported,
    required this.outfitStylesImported,
    required this.imagesUploaded,
    required this.errors,
  });

  bool get hasErrors => errors.isNotEmpty;
  bool get isSuccess => itemsImported > 0 || outfitsImported > 0 || categoriesImported > 0 || customColorsImported > 0 || outfitStylesImported > 0;
}
