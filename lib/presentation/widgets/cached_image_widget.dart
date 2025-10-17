import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../core/themes/app_theme.dart';

/// A reusable widget for displaying images from various sources with caching support.
///
/// Supports:
/// - Firebase Storage URLs (https://)
/// - Local file paths (for backward compatibility)
/// - Automatic caching for network images
/// - Loading and error placeholders
class CachedImageWidget extends StatelessWidget {
  final String? imagePath;
  final BoxFit fit;
  final double? width;
  final double? height;
  final Widget? placeholder;
  final Widget? errorWidget;
  final BorderRadius? borderRadius;

  const CachedImageWidget({
    super.key,
    required this.imagePath,
    this.fit = BoxFit.contain,
    this.width,
    this.height,
    this.placeholder,
    this.errorWidget,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    // If no image path, show default icon
    if (imagePath == null || imagePath!.isEmpty) {
      return _buildDefaultWidget();
    }

    // Check if it's a network URL (Firebase Storage)
    if (_isNetworkUrl(imagePath!)) {
      return _buildNetworkImage();
    } else {
      // Fall back to local file (for backward compatibility)
      return _buildLocalImage();
    }
  }

  /// Check if the path is a network URL
  bool _isNetworkUrl(String path) {
    return path.startsWith('http://') ||
           path.startsWith('https://') ||
           path.contains('firebasestorage.googleapis.com') ||
           path.contains('firebasestorage.app');
  }

  /// Build cached network image
  Widget _buildNetworkImage() {
    Widget image = CachedNetworkImage(
      imageUrl: imagePath!,
      fit: fit,
      width: width,
      height: height,
      placeholder: (context, url) => placeholder ?? _buildLoadingPlaceholder(),
      errorWidget: (context, url, error) => errorWidget ?? _buildErrorWidget(),
      // Enable memory cache
      memCacheWidth: width?.toInt(),
      memCacheHeight: height?.toInt(),
      // Max cache size (100 MB)
      maxWidthDiskCache: 1000,
      maxHeightDiskCache: 1000,
    );

    if (borderRadius != null) {
      image = ClipRRect(
        borderRadius: borderRadius!,
        child: image,
      );
    }

    return image;
  }

  /// Build local file image
  Widget _buildLocalImage() {
    Widget image = Image.file(
      File(imagePath!),
      fit: fit,
      width: width,
      height: height,
      errorBuilder: (context, error, stackTrace) {
        return errorWidget ?? _buildErrorWidget();
      },
    );

    if (borderRadius != null) {
      image = ClipRRect(
        borderRadius: borderRadius!,
        child: image,
      );
    }

    return image;
  }

  /// Build loading placeholder
  Widget _buildLoadingPlaceholder() {
    return Container(
      width: width,
      height: height,
      color: AppTheme.lightGray,
      child: const Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(AppTheme.pastelPink),
        ),
      ),
    );
  }

  /// Build error widget
  Widget _buildErrorWidget() {
    return Container(
      width: width,
      height: height,
      color: AppTheme.lightGray,
      child: const Icon(
        Icons.broken_image_outlined,
        color: AppTheme.mediumGray,
        size: 32,
      ),
    );
  }

  /// Build default widget when no image path is provided
  Widget _buildDefaultWidget() {
    return Container(
      width: width,
      height: height,
      color: AppTheme.lightGray,
      child: const Icon(
        Icons.checkroom,
        color: AppTheme.mediumGray,
        size: 32,
      ),
    );
  }
}
