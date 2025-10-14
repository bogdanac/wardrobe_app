import 'package:flutter/material.dart';
import 'dart:io';
import '../../domain/entities/clothing_item.dart';
import '../../core/themes/app_theme.dart';

class AdaptiveClothingImage extends StatelessWidget {
  final String? imagePath;
  final ClothingType? type;
  final double? maxHeight;
  final double? maxWidth;
  final BorderRadius? borderRadius;
  final Widget? placeholder;
  
  const AdaptiveClothingImage({
    super.key,
    this.imagePath,
    this.type,
    this.maxHeight,
    this.maxWidth,
    this.borderRadius,
    this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    if (imagePath == null) {
      return placeholder ?? _buildDefaultPlaceholder();
    }

    // Determine optimal height based on clothing type
    final height = maxHeight ?? _getOptimalHeight();
    
    return Container(
      height: height,
      width: maxWidth ?? double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.lightGray.withValues(alpha: 0.1),
        borderRadius: borderRadius,
      ),
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: Padding(
          padding: _getPaddingForType(),
          child: Image.file(
            File(imagePath!),
            fit: _getFitForType(),
            errorBuilder: (context, error, stackTrace) => 
                placeholder ?? _buildDefaultPlaceholder(),
          ),
        ),
      ),
    );
  }

  double _getOptimalHeight() {
    if (type == null) return 200;

    switch (type!) {
      case ClothingType.dress:
      case ClothingType.outerwear:
        return 240; // Taller for long items
      case ClothingType.accessory:
        return 150; // Shorter for small items
      case ClothingType.shoes:
      case ClothingType.bag:
        return 160; // Medium for accessories
      default:
        return 180; // Standard for tops, bottoms, etc.
    }
  }

  EdgeInsets _getPaddingForType() {
    if (type == null) return const EdgeInsets.all(8);

    switch (type!) {
      case ClothingType.accessory:
        return const EdgeInsets.all(16); // More padding for small items
      case ClothingType.dress:
        return const EdgeInsets.symmetric(horizontal: 8, vertical: 4); // Less vertical padding for long items
      default:
        return const EdgeInsets.all(8);
    }
  }

  BoxFit _getFitForType() {
    if (type == null) return BoxFit.contain;

    switch (type!) {
      case ClothingType.dress:
      case ClothingType.outerwear:
        return BoxFit.contain; // Show full item for long garments
      case ClothingType.accessory:
      case ClothingType.bag:
        return BoxFit.contain; // Show full item for accessories
      default:
        return BoxFit.contain; // Changed from cover to contain for better visibility
    }
  }

  Widget _buildDefaultPlaceholder() {
    return Center(
      child: Icon(
        _getIconForType(),
        size: 48,
        color: AppTheme.mediumGray,
      ),
    );
  }

  IconData _getIconForType() {
    if (type == null) return Icons.checkroom;

    switch (type!) {
      case ClothingType.top:
        return Icons.checkroom;
      case ClothingType.bottom:
        return Icons.checkroom_outlined;
      case ClothingType.dress:
        return Icons.checkroom;
      case ClothingType.shoes:
        return Icons.sports_soccer;
      case ClothingType.accessory:
        return Icons.auto_awesome;
      case ClothingType.bag:
        return Icons.shopping_bag;
      case ClothingType.outerwear:
        return Icons.severe_cold;
      case ClothingType.activewear:
        return Icons.fitness_center;
      case ClothingType.swimwear:
        return Icons.pool;
      }
  }
}