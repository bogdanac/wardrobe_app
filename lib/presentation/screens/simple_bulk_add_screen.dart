import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';
import '../../core/services/image_service.dart';
import '../../core/themes/app_theme.dart';
import '../providers/clothing_provider.dart';
import '../../domain/entities/clothing_item.dart';
import 'package:uuid/uuid.dart';

class SimpleBulkAddScreen extends ConsumerStatefulWidget {
  const SimpleBulkAddScreen({super.key});

  @override
  ConsumerState<SimpleBulkAddScreen> createState() => _SimpleBulkAddScreenState();
}

class _SimpleBulkAddScreenState extends ConsumerState<SimpleBulkAddScreen> {
  final ImageService _imageService = ImageService();
  final _uuid = const Uuid();
  
  List<File> _selectedImages = [];
  bool _isProcessing = false;
  int _currentProcessing = 0;
  int _successCount = 0;
  int _errorCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quick Add Multiple Items'),
        backgroundColor: AppTheme.primaryBlack,
        foregroundColor: AppTheme.primaryWhite,
      ),
      body: _buildBody(),
      floatingActionButton: _selectedImages.isNotEmpty && !_isProcessing
          ? FloatingActionButton.extended(
              onPressed: _processAllImages,
              backgroundColor: AppTheme.pastelPink,
              foregroundColor: AppTheme.primaryBlack,
              icon: const Icon(Icons.auto_awesome),
              label: Text('Quick Add ${_selectedImages.length} Items'),
            )
          : _selectedImages.isEmpty
              ? FloatingActionButton.extended(
                  onPressed: _selectImages,
                  backgroundColor: AppTheme.pastelPink,
                  foregroundColor: AppTheme.primaryBlack,
                  icon: const Icon(Icons.photo_library),
                  label: const Text('Select Images'),
                )
              : null,
    );
  }

  Widget _buildBody() {
    if (_selectedImages.isEmpty && !_isProcessing) {
      return _buildEmptyState();
    } else if (_isProcessing) {
      return _buildProcessingState();
    } else if (_selectedImages.isNotEmpty) {
      return _buildImagePreview();
    } else {
      return _buildCompletedState();
    }
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.photo_library_outlined,
            size: 80,
            color: AppTheme.mediumGray,
          ),
          SizedBox(height: 16),
          Text(
            'Quick Add Multiple Items',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: AppTheme.primaryWhite,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Select multiple photos and we\'ll automatically:\n• Remove backgrounds\n• Extract colors\n• Create clothing items\n• Add default categories',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: AppTheme.mediumGray,
            ),
          ),
          SizedBox(height: 24),
          Text(
            'You can edit each item later in your closet',
            style: TextStyle(
              fontSize: 14,
              color: AppTheme.mediumGray,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProcessingState() {
    final progress = _currentProcessing / _selectedImages.length;
    
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                strokeWidth: 8,
                valueColor: AlwaysStoppedAnimation<Color>(AppTheme.pastelPink),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Processing Images...',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: AppTheme.primaryWhite,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '$_currentProcessing of ${_selectedImages.length} images processed',
              style: const TextStyle(
                fontSize: 16,
                color: AppTheme.mediumGray,
              ),
            ),
            const SizedBox(height: 24),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: AppTheme.mediumGray,
              valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.pastelPink),
            ),
            const SizedBox(height: 16),
            const Text(
              'Please wait while we process your images...',
              style: TextStyle(
                fontSize: 14,
                color: AppTheme.mediumGray,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImagePreview() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          color: AppTheme.lightGray,
          child: Row(
            children: [
              const Icon(Icons.info_outline, color: AppTheme.pastelPink, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  '${_selectedImages.length} images selected. Tap "Quick Add" to process all automatically.',
                  style: const TextStyle(color: AppTheme.primaryWhite, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1,
            ),
            itemCount: _selectedImages.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: FileImage(_selectedImages[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 4,
                    right: 4,
                    child: GestureDetector(
                      onTap: () => _removeImage(index),
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCompletedState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle,
              size: 100,
              color: Colors.green,
            ),
            const SizedBox(height: 24),
            const Text(
              'Bulk Add Complete!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: AppTheme.primaryWhite,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Successfully added: $_successCount items',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.green,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (_errorCount > 0)
              Text(
                'Failed to process: $_errorCount items',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.orange,
                ),
              ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context, _successCount),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.pastelPink,
                foregroundColor: AppTheme.primaryBlack,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              icon: const Icon(Icons.done),
              label: const Text('Done'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectImages() async {
    try {
      final images = await _imageService.pickMultipleImagesFromGallery();
      if (images.isNotEmpty) {
        setState(() {
          _selectedImages = images;
        });
      }
    } catch (e) {
      _showErrorSnackBar('Failed to select images: $e');
    }
  }

  void _removeImage(int index) {
    setState(() {
      _selectedImages.removeAt(index);
    });
  }

  Future<void> _processAllImages() async {
    setState(() {
      _isProcessing = true;
      _currentProcessing = 0;
      _successCount = 0;
      _errorCount = 0;
    });

    final repository = ref.read(clothingRepositoryProvider);

    for (int i = 0; i < _selectedImages.length; i++) {
      final image = _selectedImages[i];
      
      setState(() {
        _currentProcessing = i + 1;
      });

      try {
        // Process image
        final processedImage = await _imageService.removeBackground(image);
        final colors = await _imageService.extractColors(processedImage, maxColors: 3);
        final imagePath = await _imageService.saveImage(processedImage);

        // Create clothing item with smart defaults
        final item = ClothingItem(
          id: _uuid.v4(),
          name: 'Item ${DateTime.now().millisecondsSinceEpoch}',
          type: _getSmartClothingType(colors), // Smart guess based on colors/size
          imagePath: imagePath,
          colors: colors.map((color) => _imageService.colorToHex(color)).toList(),
          categories: const ['unassigned'], // Default category
          season: null, // User can set later
          weatherRanges: const [], // User can set later
          wearCount: 0,
          lastWornDate: null,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          notes: 'Added via bulk import',
          tags: const ['bulk-import'],
          metallicElements: MetallicElements.none,
        );

        await repository.saveClothingItem(item);
        _successCount++;
        
      } catch (e) {
        if (kDebugMode) {
          print('Failed to process image ${i + 1}: $e');
        }
        _errorCount++;
      }
    }

    // Refresh the clothing items list
    ref.invalidate(allClothingItemsProvider);
    ref.invalidate(filteredClothingItemsProvider);

    setState(() {
      _isProcessing = false;
      _selectedImages.clear(); // Clear to show completed state
    });
  }

  ClothingType _getSmartClothingType(List<Color> colors) {
    // Simple heuristic - you could make this smarter
    // For now, default to tops since they're most common
    return ClothingType.top;
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }
}