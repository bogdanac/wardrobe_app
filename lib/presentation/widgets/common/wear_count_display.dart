import 'package:flutter/material.dart';
import '../../../core/utils/datetime_utils.dart';

class WearCountDisplay extends StatelessWidget {
  final int wearCount;
  final DateTime? lastWornDate;
  final DateTime? createdAt;
  final bool showFrequency;
  final MainAxisAlignment alignment;
  final TextStyle? wearCountStyle;
  final TextStyle? lastWornStyle;

  const WearCountDisplay({
    super.key,
    required this.wearCount,
    this.lastWornDate,
    this.createdAt,
    this.showFrequency = true,
    this.alignment = MainAxisAlignment.spaceBetween,
    this.wearCountStyle,
    this.lastWornStyle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final defaultWearCountStyle = wearCountStyle ?? theme.textTheme.bodyMedium?.copyWith(
      fontWeight: FontWeight.bold,
    );
    final defaultLastWornStyle = lastWornStyle ?? theme.textTheme.bodySmall?.copyWith(
      color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.7),
    );

    return Row(
      mainAxisAlignment: alignment,
      children: [
        // Wear count
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.analytics_outlined,
              size: 16,
              color: theme.textTheme.bodySmall?.color,
            ),
            const SizedBox(width: 4),
            Text(
              '$wearCount ${wearCount == 1 ? 'wear' : 'wears'}',
              style: defaultWearCountStyle,
            ),
          ],
        ),
        
        // Frequency or last worn
        if (showFrequency && createdAt != null)
          Flexible(
            child: Text(
              DateTimeUtils.formatWearFrequency(wearCount, createdAt!),
              style: defaultLastWornStyle,
              overflow: TextOverflow.ellipsis,
            ),
          )
        else
          Flexible(
            child: Text(
              DateTimeUtils.getLastWornText(lastWornDate),
              style: defaultLastWornStyle,
              overflow: TextOverflow.ellipsis,
            ),
          ),
      ],
    );
  }
}

class WearCountIndicator extends StatelessWidget {
  final int wearCount;
  final double size;
  final Color? color;
  final Color? backgroundColor;

  const WearCountIndicator({
    super.key,
    required this.wearCount,
    this.size = 24.0,
    this.color,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final indicatorColor = color ?? _getWearCountColor(wearCount, theme);
    final bgColor = backgroundColor ?? theme.cardColor;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: bgColor,
        shape: BoxShape.circle,
        border: Border.all(color: indicatorColor, width: 2),
      ),
      child: Center(
        child: Text(
          wearCount > 99 ? '99+' : wearCount.toString(),
          style: TextStyle(
            fontSize: size * 0.4,
            fontWeight: FontWeight.bold,
            color: indicatorColor,
          ),
        ),
      ),
    );
  }

  Color _getWearCountColor(int count, ThemeData theme) {
    if (count == 0) {
      return Colors.grey;
    } else if (count <= 3) {
      return Colors.green;
    } else if (count <= 10) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }
}

class WearCountChart extends StatelessWidget {
  final int wearCount;
  final int maxWearCount;
  final double height;
  final Color? color;
  final Color? backgroundColor;

  const WearCountChart({
    super.key,
    required this.wearCount,
    required this.maxWearCount,
    this.height = 6.0,
    this.color,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final barColor = color ?? theme.primaryColor;
    final bgColor = backgroundColor ?? theme.primaryColor.withValues(alpha: 0.2);
    
    final progress = maxWearCount > 0 ? wearCount / maxWearCount : 0.0;

    return Container(
      height: height,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(height / 2),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: progress.clamp(0.0, 1.0),
        child: Container(
          decoration: BoxDecoration(
            color: barColor,
            borderRadius: BorderRadius.circular(height / 2),
          ),
        ),
      ),
    );
  }
}