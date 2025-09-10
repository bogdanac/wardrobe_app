import 'package:flutter/material.dart';
import 'dart:io';
import '../../domain/entities/clothing_item.dart';
import '../../core/themes/app_theme.dart';

class ClothingItemCard extends StatelessWidget {
  final ClothingItem item;
  final VoidCallback? onTap;
  final bool isSelected;

  const ClothingItemCard({
    super.key,
    required this.item,
    this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
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
                child: item.imagePath != null
                    ? ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(12),
                        ),
                        child: Image.file(
                          File(item.imagePath!),
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              _buildPlaceholder(),
                        ),
                      )
                    : _buildPlaceholder(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _getTypeLabel(item.type),
                    style: const TextStyle(
                      color: AppTheme.mediumGray,
                      fontSize: 12,
                    ),
                  ),
                  if (item.colors.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    _buildColorDots(),
                  ],
                  if (item.categories.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    _buildCategories(),
                  ],
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Worn ${item.wearCount}x',
                        style: const TextStyle(
                          fontSize: 10,
                          color: AppTheme.mediumGray,
                        ),
                      ),
                      if (item.lastWornDate != null)
                        Text(
                          _getLastWornText(item.lastWornDate!),
                          style: const TextStyle(
                            fontSize: 10,
                            color: AppTheme.mediumGray,
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

  Widget _buildPlaceholder() {
    return Center(
      child: Icon(
        _getTypeIcon(item.type),
        size: 48,
        color: AppTheme.mediumGray,
      ),
    );
  }

  Widget _buildColorDots() {
    return Row(
      children: item.colors.take(4).map((colorHex) {
        return Container(
          width: 12,
          height: 12,
          margin: const EdgeInsets.only(right: 4),
          decoration: BoxDecoration(
            color: _hexToColor(colorHex),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.shade300, width: 0.5),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCategories() {
    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: item.categories.take(2).map((category) {
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
          ),
        );
      }).toList(),
    );
  }

  String _getTypeLabel(ClothingType type) {
    switch (type) {
      case ClothingType.top:
        return 'Top';
      case ClothingType.bottom:
        return 'Bottom';
      case ClothingType.shoes:
        return 'Shoes';
      case ClothingType.accessory:
        return 'Accessory';
      case ClothingType.outerwear:
        return 'Outerwear';
      case ClothingType.undergarment:
        return 'Undergarment';
      case ClothingType.jewelry:
        return 'Jewelry';
      case ClothingType.bag:
        return 'Bag';
      case ClothingType.hat:
        return 'Hat';
      case ClothingType.scarf:
        return 'Scarf';
      case ClothingType.belt:
        return 'Belt';
      case ClothingType.gloves:
        return 'Gloves';
      case ClothingType.swimwear:
        return 'Swimwear';
      case ClothingType.sleepwear:
        return 'Sleepwear';
      case ClothingType.activewear:
        return 'Activewear';
      case ClothingType.dress:
        return 'Dress';
      case ClothingType.jumpsuit:
        return 'Jumpsuit';
      case ClothingType.suit:
        return 'Suit';
    }
  }

  IconData _getTypeIcon(ClothingType type) {
    switch (type) {
      case ClothingType.top:
        return Icons.checkroom;
      case ClothingType.bottom:
        return Icons.checkroom;
      case ClothingType.shoes:
        return Icons.directions_walk;
      case ClothingType.accessory:
        return Icons.diamond;
      case ClothingType.outerwear:
        return Icons.checkroom;
      case ClothingType.undergarment:
        return Icons.checkroom;
      case ClothingType.jewelry:
        return Icons.diamond;
      case ClothingType.bag:
        return Icons.work_outline;
      case ClothingType.hat:
        return Icons.face;
      case ClothingType.scarf:
        return Icons.checkroom;
      case ClothingType.belt:
        return Icons.circle_outlined;
      case ClothingType.gloves:
        return Icons.back_hand;
      case ClothingType.swimwear:
        return Icons.pool;
      case ClothingType.sleepwear:
        return Icons.bedtime;
      case ClothingType.activewear:
        return Icons.fitness_center;
      case ClothingType.dress:
        return Icons.checkroom;
      case ClothingType.jumpsuit:
        return Icons.checkroom;
      case ClothingType.suit:
        return Icons.checkroom;
    }
  }

  Color _hexToColor(String hex) {
    try {
      return Color(int.parse(hex.substring(1), radix: 16) + 0xFF000000);
    } catch (e) {
      return AppTheme.mediumGray;
    }
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
