import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import '../../domain/entities/outfit.dart';
import '../../core/themes/app_theme.dart';
import '../providers/clothing_provider.dart';

class OutfitCard extends ConsumerWidget {
  final Outfit outfit;
  final VoidCallback? onTap;
  final VoidCallback? onFavorite;
  final VoidCallback? onWear;
  final VoidCallback? onVariantsTap; // Callback when variant badge is tapped
  final bool isSelected;

  const OutfitCard({
    super.key,
    required this.outfit,
    this.onTap,
    this.onFavorite,
    this.onWear,
    this.onVariantsTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: isSelected ? 6 : 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: isSelected
              ? const BorderSide(color: AppTheme.pastelPink, width: 2)
              : BorderSide.none,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 0.75, // Taller/rectangular preview (3:4 ratio)
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                      color: AppTheme.lightGray,
                    ),
                    child: outfit.imagePreviewPath != null
                        ? ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                            child: _buildOutfitImage(outfit.imagePreviewPath!, ref),
                          )
                        : _buildPlaceholder(ref),
                  ),
                  // Variant badge in top-right corner
                  if (outfit.variantCount > 0)
                    Positioned(
                      top: 8,
                      right: 8,
                      child: GestureDetector(
                        onTap: onVariantsTap,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppTheme.pastelPink,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.2),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.content_copy,
                                size: 14,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${outfit.variantCount}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          outfit.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (outfit.isFavorite)
                        const Icon(
                          Icons.favorite,
                          color: AppTheme.pastelPink,
                          size: 16,
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${outfit.clothingItemIds.length} items',
                    style: const TextStyle(
                      color: AppTheme.mediumGray,
                      fontSize: 12,
                    ),
                  ),
                  if (outfit.categories.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    _buildCategories(),
                  ],
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Worn ${outfit.wearCount}x',
                        style: const TextStyle(
                          fontSize: 10,
                          color: AppTheme.mediumGray,
                        ),
                      ),
                      if (outfit.lastWornDate != null)
                        Text(
                          _getLastWornText(outfit.lastWornDate!),
                          style: const TextStyle(
                            fontSize: 10,
                            color: AppTheme.mediumGray,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: onWear,
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            minimumSize: Size.zero,
                          ),
                          child: const Text(
                            'Wear Today',
                            style: TextStyle(fontSize: 11),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        onPressed: onFavorite,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: Icon(
                          outfit.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: AppTheme.pastelPink,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceholder(WidgetRef ref) {
    // Show a grid of clothing item images
    if (outfit.clothingItemIds.isEmpty) {
      return const Center(
        child: Icon(
          Icons.palette_outlined,
          size: 48,
          color: AppTheme.mediumGray,
        ),
      );
    }

    // Fetch all items and organize by type
    return FutureBuilder(
      future: _organizeItemsByType(ref),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppTheme.pastelPink,
            ),
          );
        }

        if (!snapshot.hasData) {
          return const Center(
            child: Icon(
              Icons.error_outline,
              size: 48,
              color: AppTheme.mediumGray,
            ),
          );
        }

        final organized = snapshot.data as Map<String, List<String>>;
        return _buildSmartLayout(organized, ref);
      },
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

    for (final itemId in outfit.clothingItemIds) {
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

  Widget _buildSmartLayout(Map<String, List<String>> organized, WidgetRef ref) {
    // If outfit has activewear, use simple grid (can't distinguish top/bottom)
    if (organized['activewear']!.isNotEmpty) {
      return _buildSimpleGrid(organized, ref);
    }

    // Determine main item (dress, swimwear as full-body, or top)
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
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
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
                    // Top / Dress / Swimwear / Activewear
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

  Widget _buildSimpleGrid(Map<String, List<String>> organized, WidgetRef ref) {
    // Collect all items for grid
    final List<String> allItems = [
      ...organized['activewear']!,
      ...organized['outerwear']!,
      ...organized['accessory']!,
      ...organized['bag']!,
      ...organized['shoes']!,
    ];

    final displayCount = allItems.length > 4 ? 4 : allItems.length;

    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
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

  Widget _buildOutfitImage(String imagePath, WidgetRef ref) {
    final isNetworkImage = imagePath.startsWith('http://') || imagePath.startsWith('https://');

    if (isNetworkImage) {
      return CachedNetworkImage(
        imageUrl: imagePath,
        fit: BoxFit.contain,
        placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(
            color: AppTheme.pastelPink,
          ),
        ),
        errorWidget: (context, url, error) => _buildPlaceholder(ref),
        maxHeightDiskCache: 1000,
        maxWidthDiskCache: 1000,
      );
    } else {
      return Image.file(
        File(imagePath),
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) => _buildPlaceholder(ref),
      );
    }
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

  Widget _buildCategories() {
    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: outfit.categories.take(2).map((category) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: AppTheme.pastelPink.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            category,
            style: const TextStyle(
              fontSize: 10,
              color: AppTheme.primaryBlack,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        );
      }).toList(),
    );
  }

  String _getLastWornText(DateTime lastWorn) {
    final now = DateTime.now();
    final difference = now.difference(lastWorn);
    
    if (difference.inDays == 0) {
      return 'Today';
    } else if (difference.inDays == 1) {
      return '1 day ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays < 30) {
      return '${difference.inDays ~/ 7} weeks ago';
    } else {
      return '${difference.inDays ~/ 30} months ago';
    }
  }
}