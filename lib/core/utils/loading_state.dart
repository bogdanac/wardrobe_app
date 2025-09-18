import 'package:flutter/material.dart';
import '../themes/app_theme.dart';

/// Enum for different loading states
enum LoadingType {
  initial,
  loading,
  refreshing,
  loadingMore,
  uploading,
  processing,
  generating,
  saving,
}

/// Loading state data class
class LoadingState {
  final LoadingType type;
  final String? message;
  final double? progress; // For progress indicators (0.0 to 1.0)
  final bool isVisible;

  const LoadingState({
    this.type = LoadingType.loading,
    this.message,
    this.progress,
    this.isVisible = true,
  });

  LoadingState copyWith({
    LoadingType? type,
    String? message,
    double? progress,
    bool? isVisible,
  }) {
    return LoadingState(
      type: type ?? this.type,
      message: message ?? this.message,
      progress: progress ?? this.progress,
      isVisible: isVisible ?? this.isVisible,
    );
  }

  static const LoadingState hidden = LoadingState(isVisible: false);
}

/// Custom loading widgets for different states
class AppLoadingWidget extends StatelessWidget {
  final LoadingState state;
  final Color? color;
  final double? size;

  const AppLoadingWidget({
    super.key,
    required this.state,
    this.color,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    if (!state.isVisible) return const SizedBox.shrink();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildLoadingIndicator(),
        if (state.message != null) ...[
          const SizedBox(height: 16),
          Text(
            state.message!,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: color ?? AppTheme.mediumGray,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }

  Widget _buildLoadingIndicator() {
    final indicatorColor = color ?? AppTheme.pastelPink;
    final indicatorSize = size ?? 40.0;

    if (state.progress != null) {
      return SizedBox(
        width: indicatorSize,
        height: indicatorSize,
        child: CircularProgressIndicator(
          value: state.progress,
          valueColor: AlwaysStoppedAnimation<Color>(indicatorColor),
          strokeWidth: 4,
        ),
      );
    }

    switch (state.type) {
      case LoadingType.processing:
        return _buildPulsingIndicator(indicatorColor, indicatorSize);
      case LoadingType.generating:
        return _buildSparkleIndicator(indicatorColor, indicatorSize);
      case LoadingType.uploading:
        return _buildUploadIndicator(indicatorColor, indicatorSize);
      default:
        return SizedBox(
          width: indicatorSize,
          height: indicatorSize,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(indicatorColor),
            strokeWidth: 4,
          ),
        );
    }
  }

  Widget _buildPulsingIndicator(Color color, double size) {
    return SizedBox(
      width: size,
      height: size,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.5, end: 1.0),
        duration: const Duration(milliseconds: 1000),
        builder: (context, value, child) {
          return Transform.scale(
            scale: value,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color.withValues(alpha: 0.3),
              ),
              child: Center(
                child: Container(
                  width: size * 0.6,
                  height: size * 0.6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color,
                  ),
                ),
              ),
            ),
          );
        },
        onEnd: () {
          // Loop animation handled by parent widget rebuilds
        },
      ),
    );
  }

  Widget _buildSparkleIndicator(Color color, double size) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(color),
            strokeWidth: 2,
          ),
          Icon(
            Icons.auto_awesome,
            color: color,
            size: size * 0.4,
          ),
        ],
      ),
    );
  }

  Widget _buildUploadIndicator(Color color, double size) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(color),
            strokeWidth: 3,
          ),
          Icon(
            Icons.cloud_upload_outlined,
            color: color,
            size: size * 0.4,
          ),
        ],
      ),
    );
  }
}

/// Full screen loading overlay
class LoadingOverlay extends StatelessWidget {
  final LoadingState state;
  final Widget child;
  final Color? backgroundColor;

  const LoadingOverlay({
    super.key,
    required this.state,
    required this.child,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (state.isVisible)
          Container(
            color: backgroundColor ?? Colors.black.withValues(alpha: 0.5),
            child: Center(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: AppLoadingWidget(state: state),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

/// Loading button that shows progress
class LoadingButton extends StatelessWidget {
  final LoadingState state;
  final VoidCallback? onPressed;
  final Widget child;
  final ButtonStyle? style;

  const LoadingButton({
    super.key,
    required this.state,
    required this.onPressed,
    required this.child,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: state.isVisible ? null : onPressed,
      style: style,
      child: state.isVisible
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
                const SizedBox(width: 8),
                Text(state.message ?? 'Loading...'),
              ],
            )
          : child,
    );
  }
}

/// Extension to get loading messages for different types
extension LoadingStateMessages on LoadingType {
  String get defaultMessage {
    switch (this) {
      case LoadingType.initial:
        return 'Initializing...';
      case LoadingType.loading:
        return 'Loading...';
      case LoadingType.refreshing:
        return 'Refreshing...';
      case LoadingType.loadingMore:
        return 'Loading more...';
      case LoadingType.uploading:
        return 'Uploading...';
      case LoadingType.processing:
        return 'Processing image...';
      case LoadingType.generating:
        return 'Generating outfits...';
      case LoadingType.saving:
        return 'Saving...';
    }
  }
}