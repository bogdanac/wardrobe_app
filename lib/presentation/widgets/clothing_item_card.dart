import 'package:flutter/material.dart';
import '../../domain/entities/clothing_item.dart';
import '../../core/themes/app_theme.dart';
import 'adaptive_clothing_image.dart';

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
        elevation: isSelected ? 6 : 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: isSelected
              ? const BorderSide(color: AppTheme.pastelPink, width: 2)
              : BorderSide.none,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: AdaptiveClothingImage(
              imagePath: item.imagePath,
              type: item.type,
              borderRadius: BorderRadius.circular(12),
              placeholder: _buildPlaceholder(),
            ),
          ),
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

  IconData _getTypeIcon(ClothingType type) {
    switch (type) {
      case ClothingType.top:
        return Icons.checkroom;
      case ClothingType.bottom:
        return Icons.straighten;
      case ClothingType.dress:
        return Icons.woman;
      case ClothingType.shoes:
        return Icons.elevator_rounded;
      case ClothingType.bag:
        return Icons.shopping_bag_outlined;
      case ClothingType.accessory:
        return Icons.star;
      case ClothingType.outerwear:
        return Icons.ac_unit;
      case ClothingType.activewear:
        return Icons.directions_run;
      case ClothingType.swimwear:
        return Icons.pool;
    }
  }
}
