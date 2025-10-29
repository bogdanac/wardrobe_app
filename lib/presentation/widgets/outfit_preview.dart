import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:io';
import '../../core/themes/app_theme.dart';
import '../providers/clothing_provider.dart';

/// Reusable outfit preview widget that displays clothing items in a smart layout
class OutfitPreview extends ConsumerWidget {
  final List<String> clothingItemIds;
  final double height;

  const OutfitPreview({
    super.key,
    required this.clothingItemIds,
    this.height = 200,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (clothingItemIds.isEmpty) {
      return SizedBox(
        height: height,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppTheme.lightGray,
          ),
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.palette_outlined,
                  size: 48,
                  color: AppTheme.mediumGray,
                ),
                SizedBox(height: 8),
                Text(
                  'No items selected',
                  style: TextStyle(
                    color: AppTheme.mediumGray,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return SizedBox(
      height: height,
      child: FutureBuilder(
        future: _organizeItemsByType(ref),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppTheme.lightGray,
              ),
              child: const Center(
                child: CircularProgressIndicator(
                  color: AppTheme.pastelPink,
                ),
              ),
            );
          }

          if (!snapshot.hasData) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppTheme.lightGray,
              ),
              child: const Center(
                child: Icon(
                  Icons.error_outline,
                  size: 48,
                  color: AppTheme.mediumGray,
                ),
              ),
            );
          }

          final organized = snapshot.data as Map<String, List<String>>;

          // If activewear, use simple grid
          if (organized['activewear']!.isNotEmpty) {
            return _buildSimpleGrid(organized);
          }

          return _buildSmartLayout(organized);
        },
      ),
    );
  }

  Future<Map<String, List<String>>> _organizeItemsByType(WidgetRef ref) async {
    final Map<String, List<String>> organized = {
      'outerwear': [],
      'top': [],
      'bottom': [],
      'dress': [],
      'shoes': [],
      'bag': [],
      'accessory': [],
      'swimwear': [],
      'activewear': [],
    };

    for (final itemId in clothingItemIds) {
      try {
        final item = await ref.read(clothingItemByIdProvider(itemId).future);
        if (item != null) {
          organized[item.type.name]?.add(item.imagePath ?? '');
        }
      } catch (e) {
        // Skip items that fail to load
      }
    }

    return organized;
  }

  Widget _buildSimpleGrid(Map<String, List<String>> organized) {
    final List<String> allItems = [
      ...organized['activewear']!,
      ...organized['outerwear']!,
      ...organized['accessory']!,
      ...organized['bag']!,
      ...organized['shoes']!,
    ];

    final displayCount = allItems.length > 4 ? 4 : allItems.length;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppTheme.lightGray,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: displayCount == 1 ? 1 : 2,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              childAspectRatio: 1,
            ),
            itemCount: displayCount,
            itemBuilder: (context, index) {
              return _buildItemBox(allItems[index]);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSmartLayout(Map<String, List<String>> organized) {
    String mainItem = '';
    bool isFullBodyItem = false;

    if (organized['dress']!.isNotEmpty) {
      mainItem = organized['dress']!.first;
      isFullBodyItem = true;
    } else if (organized['swimwear']!.isNotEmpty) {
      mainItem = organized['swimwear']!.first;
      isFullBodyItem = true;
    } else if (organized['top']!.isNotEmpty) {
      mainItem = organized['top']!.first;
      isFullBodyItem = false;
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppTheme.lightGray,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left side: Outerwear or first accessory
              if (organized['outerwear']!.isNotEmpty || organized['accessory']!.isNotEmpty)
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Expanded(
                        child: _buildItemBox(
                          organized['outerwear']!.isNotEmpty
                              ? organized['outerwear']!.first
                              : organized['accessory']!.first,
                        ),
                      ),
                    ],
                  ),
                ),
              if (organized['outerwear']!.isNotEmpty || organized['accessory']!.isNotEmpty)
                const SizedBox(width: 2),
              // Center column: Top and Bottom
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    // Top / Dress / Swimwear
                    Expanded(
                      flex: 2,
                      child: _buildItemBox(mainItem),
                    ),
                    const SizedBox(height: 2),
                    // Bottom (slightly offset to the right) - only show if not a full-body item
                    if (!isFullBodyItem && organized['bottom']!.isNotEmpty)
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: _buildItemBox(organized['bottom']!.first),
                        ),
                      ),
                    // Shoes (if no bottom or is full-body item, show shoes here)
                    if ((organized['bottom']!.isEmpty || isFullBodyItem) && organized['shoes']!.isNotEmpty)
                      Expanded(
                        child: _buildItemBox(organized['shoes']!.first),
                      ),
                  ],
                ),
              ),
              // Right side: Bag, second accessory, or shoes
              if (organized['bag']!.isNotEmpty || organized['accessory']!.length > 1 ||
                  (organized['shoes']!.isNotEmpty && !isFullBodyItem && organized['bottom']!.isNotEmpty)) ...[
                const SizedBox(width: 2),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      // Bag or accessory on top
                      if (organized['bag']!.isNotEmpty || organized['accessory']!.length > 1)
                        Expanded(
                          child: _buildItemBox(
                            organized['bag']!.isNotEmpty
                                ? organized['bag']!.first
                                : organized['accessory']![1],
                          ),
                        ),
                      if ((organized['bag']!.isNotEmpty || organized['accessory']!.length > 1) &&
                          organized['shoes']!.isNotEmpty &&
                          !isFullBodyItem &&
                          organized['bottom']!.isNotEmpty)
                        const SizedBox(height: 2),
                      // Shoes on bottom right (if bottom exists and not full-body)
                      if (organized['shoes']!.isNotEmpty && !isFullBodyItem && organized['bottom']!.isNotEmpty)
                        Expanded(
                          child: _buildItemBox(organized['shoes']!.first),
                        ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemBox(String imagePath) {
    if (imagePath.isEmpty) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(
          Icons.checkroom,
          color: AppTheme.mediumGray,
          size: 24,
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: _buildClothingItemImage(imagePath),
        ),
      ),
    );
  }

  Widget _buildClothingItemImage(String imagePath) {
    final isNetworkImage = imagePath.startsWith('http://') || imagePath.startsWith('https://');

    if (isNetworkImage) {
      return CachedNetworkImage(
        imageUrl: imagePath,
        fit: BoxFit.contain,
        placeholder: (context, url) => Container(
          color: AppTheme.lightGray,
          child: const Center(
            child: SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ),
        ),
        errorWidget: (context, url, error) => Container(
          color: AppTheme.lightGray,
          child: const Icon(
            Icons.checkroom,
            color: AppTheme.mediumGray,
            size: 20,
          ),
        ),
        maxHeightDiskCache: 500,
        maxWidthDiskCache: 500,
      );
    } else {
      return Image.file(
        File(imagePath),
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) => Container(
          color: AppTheme.lightGray,
          child: const Icon(
            Icons.checkroom,
            color: AppTheme.mediumGray,
            size: 20,
          ),
        ),
      );
    }
  }
}
