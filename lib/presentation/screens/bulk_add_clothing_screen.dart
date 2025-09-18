import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';
import '../../core/services/image_service.dart';
import '../../core/themes/app_theme.dart';
import 'add_clothing_item_screen.dart';

class BulkAddClothingScreen extends ConsumerStatefulWidget {
  const BulkAddClothingScreen({super.key});

  @override
  ConsumerState<BulkAddClothingScreen> createState() => _BulkAddClothingScreenState();
}

class _BulkAddClothingScreenState extends ConsumerState<BulkAddClothingScreen> {
  final ImageService _imageService = ImageService();
  List<File> _selectedImages = [];
  List<BulkItem> _bulkItems = [];
  int _currentIndex = 0;
  final bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Bulk Add Items'),
        backgroundColor: AppTheme.primaryBlack,
        foregroundColor: AppTheme.primaryWhite,
        actions: [
          if (_selectedImages.isNotEmpty)
            TextButton(
              onPressed: _isProcessing ? null : _startBulkProcess,
              child: Text(
                'Start Processing',
                style: TextStyle(
                  color: _isProcessing ? AppTheme.mediumGray : AppTheme.pastelPink,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
      body: _buildBody(),
      floatingActionButton: _selectedImages.isEmpty
          ? FloatingActionButton.extended(
              onPressed: _selectMultipleImages,
              backgroundColor: AppTheme.pastelPink,
              foregroundColor: AppTheme.primaryBlack,
              icon: const Icon(Icons.photo_library),
              label: const Text('Select Images'),
            )
          : null,
    );
  }

  Widget _buildBody() {
    if (_selectedImages.isEmpty) {
      return _buildEmptyState();
    } else if (_bulkItems.isEmpty) {
      return _buildImageGrid();
    } else {
      return _buildProcessingView();
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
            'Select Multiple Images',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: AppTheme.primaryWhite,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Choose multiple clothing photos to add\nitems quickly one by one',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: AppTheme.mediumGray,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageGrid() {
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
                  '${_selectedImages.length} images selected. Tap "Start Processing" to begin.',
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

  Widget _buildProcessingView() {
    final currentItem = _bulkItems[_currentIndex];

    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height -
                   AppBar().preferredSize.height -
                   MediaQuery.of(context).padding.top,
        ),
        child: Column(
          children: [
        // Progress indicator
        Container(
          padding: const EdgeInsets.all(16),
          color: AppTheme.lightGray,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Item ${_currentIndex + 1} of ${_bulkItems.length}',
                    style: const TextStyle(
                      color: AppTheme.primaryWhite,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    currentItem.status.displayName,
                    style: TextStyle(
                      color: currentItem.status.color,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              LinearProgressIndicator(
                value: (_currentIndex + 1) / _bulkItems.length,
                backgroundColor: AppTheme.mediumGray,
                valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.pastelPink),
              ),
            ],
          ),
        ),
        
        // Current item processing
        Expanded(
          child: _buildCurrentItemView(currentItem),
        ),
        
        // Navigation buttons
        _buildNavigationButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentItemView(BulkItem item) {
    switch (item.status) {
      case BulkItemStatus.pending:
        return _buildPendingView(item);
      case BulkItemStatus.processing:
        return _buildProcessingItemView(item);
      case BulkItemStatus.ready:
        return _buildReadyView(item);
      case BulkItemStatus.completed:
        return _buildCompletedView(item);
      case BulkItemStatus.skipped:
        return _buildSkippedView(item);
    }
  }

  Widget _buildPendingView(BulkItem item) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: FileImage(item.originalImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Ready to Process',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppTheme.primaryWhite,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'This image will be processed for background removal and color extraction',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: AppTheme.mediumGray,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => _processCurrentItem(),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.pastelPink,
              foregroundColor: AppTheme.primaryBlack,
            ),
            icon: const Icon(Icons.auto_fix_high),
            label: const Text('Process Image'),
          ),
        ],
      ),
    );
  }

  Widget _buildProcessingItemView(BulkItem item) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: CircularProgressIndicator(
              strokeWidth: 6,
              valueColor: AlwaysStoppedAnimation<Color>(AppTheme.pastelPink),
            ),
          ),
          SizedBox(height: 24),
          Text(
            'Processing Image...',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppTheme.primaryWhite,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Removing background and extracting colors',
            style: TextStyle(
              fontSize: 14,
              color: AppTheme.mediumGray,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReadyView(BulkItem item) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Processed Image',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppTheme.primaryWhite,
            ),
          ),
          const SizedBox(height: 16),
          
          // Before/After comparison
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    const Text('Original', style: TextStyle(color: AppTheme.mediumGray)),
                    const SizedBox(height: 8),
                    Container(
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: FileImage(item.originalImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  children: [
                    const Text('Processed', style: TextStyle(color: AppTheme.mediumGray)),
                    const SizedBox(height: 8),
                    Container(
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: FileImage(item.processedImage!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 24),
          
          // Extracted colors
          const Text(
            'Extracted Colors',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppTheme.primaryWhite,
            ),
          ),
          const SizedBox(height: 8),
          if (item.extractedColors.isNotEmpty)
            Row(
              children: item.extractedColors.map((color) {
                return Container(
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                );
              }).toList(),
            )
          else
            const Text(
              'No colors extracted',
              style: TextStyle(color: AppTheme.mediumGray),
            ),
          
          const SizedBox(height: 32),
          
          // Action buttons
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => _createClothingItem(item),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.pastelPink,
                    foregroundColor: AppTheme.primaryBlack,
                  ),
                  icon: const Icon(Icons.add),
                  label: const Text('Create Item'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => _skipItem(item),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppTheme.mediumGray,
                  ),
                  icon: const Icon(Icons.skip_next),
                  label: const Text('Skip'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCompletedView(BulkItem item) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.check_circle,
            size: 80,
            color: Colors.green,
          ),
          SizedBox(height: 16),
          Text(
            'Item Created!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppTheme.primaryWhite,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'This clothing item has been added to your wardrobe',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: AppTheme.mediumGray,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkippedView(BulkItem item) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.skip_next,
            size: 80,
            color: AppTheme.mediumGray,
          ),
          SizedBox(height: 16),
          Text(
            'Item Skipped',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppTheme.primaryWhite,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'This image was skipped and not added to your wardrobe',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: AppTheme.mediumGray,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationButtons() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.lightGray,
        border: Border(top: BorderSide(color: AppTheme.mediumGray.withValues(alpha: 0.3))),
      ),
      child: Row(
        children: [
          if (_currentIndex > 0)
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () => _previousItem(),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppTheme.primaryWhite,
                ),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Previous'),
              ),
            ),
          if (_currentIndex > 0) const SizedBox(width: 16),
          if (_currentIndex < _bulkItems.length - 1)
            Expanded(
              child: ElevatedButton.icon(
                onPressed: _canGoNext() ? () => _nextItem() : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.pastelPink,
                  foregroundColor: AppTheme.primaryBlack,
                ),
                icon: const Icon(Icons.arrow_forward),
                label: const Text('Next'),
              ),
            )
          else
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () => _finishBulkAdd(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                icon: const Icon(Icons.done),
                label: const Text('Finish'),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _selectMultipleImages() async {
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

  void _startBulkProcess() {
    setState(() {
      _bulkItems = _selectedImages.map((image) => BulkItem(
        originalImage: image,
        status: BulkItemStatus.pending,
        extractedColors: [],
      )).toList();
      _currentIndex = 0;
    });
  }

  Future<void> _processCurrentItem() async {
    final item = _bulkItems[_currentIndex];
    
    setState(() {
      item.status = BulkItemStatus.processing;
    });

    try {
      // Process background removal
      final processedImage = await _imageService.removeBackground(item.originalImage);
      
      // Extract colors
      final colors = await _imageService.extractColors(processedImage, maxColors: 3);
      
      setState(() {
        item.processedImage = processedImage;
        item.extractedColors = colors;
        item.status = BulkItemStatus.ready;
      });
    } catch (e) {
      _showErrorSnackBar('Failed to process image: $e');
      setState(() {
        item.status = BulkItemStatus.pending;
      });
    }
  }

  Future<void> _createClothingItem(BulkItem item) async {
    final result = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (context) => AddClothingItemScreen(
          initialImage: item.processedImage!,
          initialColors: item.extractedColors,
        ),
      ),
    );
    
    if (result == true) {
      setState(() {
        item.status = BulkItemStatus.completed;
      });
      _nextItem();
    }
  }

  void _skipItem(BulkItem item) {
    setState(() {
      item.status = BulkItemStatus.skipped;
    });
    _nextItem();
  }

  void _previousItem() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
    }
  }

  void _nextItem() {
    if (_currentIndex < _bulkItems.length - 1) {
      setState(() {
        _currentIndex++;
      });
    }
  }

  bool _canGoNext() {
    final currentItem = _bulkItems[_currentIndex];
    return currentItem.status == BulkItemStatus.completed || 
           currentItem.status == BulkItemStatus.skipped;
  }

  void _finishBulkAdd() {
    final completedCount = _bulkItems.where((item) => item.status == BulkItemStatus.completed).length;
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Bulk Add Complete'),
        content: Text('Successfully added $completedCount items to your wardrobe.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context, completedCount); // Return to previous screen
            },
            child: const Text('Done'),
          ),
        ],
      ),
    );
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

// Data classes
class BulkItem {
  final File originalImage;
  File? processedImage;
  List<Color> extractedColors;
  BulkItemStatus status;

  BulkItem({
    required this.originalImage,
    this.processedImage,
    required this.extractedColors,
    required this.status,
  });
}

enum BulkItemStatus {
  pending,
  processing,
  ready,
  completed,
  skipped;

  String get displayName {
    switch (this) {
      case BulkItemStatus.pending:
        return 'Pending';
      case BulkItemStatus.processing:
        return 'Processing...';
      case BulkItemStatus.ready:
        return 'Ready to Add';
      case BulkItemStatus.completed:
        return 'Completed';
      case BulkItemStatus.skipped:
        return 'Skipped';
    }
  }

  Color get color {
    switch (this) {
      case BulkItemStatus.pending:
        return AppTheme.mediumGray;
      case BulkItemStatus.processing:
        return AppTheme.pastelPink;
      case BulkItemStatus.ready:
        return Colors.orange;
      case BulkItemStatus.completed:
        return Colors.green;
      case BulkItemStatus.skipped:
        return AppTheme.mediumGray;
    }
  }
}