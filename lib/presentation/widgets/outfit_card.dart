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
  final bool isSelected;

  const OutfitCard({
    super.key,
    required this.outfit,
    this.onTap,
    this.onFavorite,
    this.onWear,
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
              aspectRatio: 1,
              child: Container(
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

    return GridView.builder(
      padding: const EdgeInsets.all(8),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      itemCount: outfit.clothingItemIds.length > 4 ? 4 : outfit.clothingItemIds.length,
      itemBuilder: (context, index) {
        final itemId = outfit.clothingItemIds[index];
        final itemAsync = ref.watch(clothingItemByIdProvider(itemId));
        
        return itemAsync.when(
          data: (item) {
            if (item?.imagePath != null) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: _buildClothingItemImage(item!.imagePath!),
              );
            }
            return Container(
              decoration: BoxDecoration(
                color: AppTheme.lightGray,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Icon(
                Icons.checkroom,
                color: AppTheme.mediumGray,
                size: 20,
              ),
            );
          },
          loading: () => Container(
            color: AppTheme.lightGray,
            child: const Center(
              child: SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          ),
          error: (error, stack) => Container(
            color: AppTheme.lightGray,
            child: const Icon(
              Icons.error,
              color: AppTheme.mediumGray,
              size: 16,
            ),
          ),
        );
      },
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