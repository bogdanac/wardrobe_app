import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  final Color? color;
  final Color? textColor;
  final VoidCallback? onTap;
  final VoidCallback? onDeleted;
  final IconData? icon;
  final bool isSelected;
  final double fontSize;

  const CategoryChip({
    super.key,
    required this.label,
    this.color,
    this.textColor,
    this.onTap,
    this.onDeleted,
    this.icon,
    this.isSelected = false,
    this.fontSize = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final chipColor = color ?? (isSelected ? theme.primaryColor : theme.chipTheme.backgroundColor);
    final chipTextColor = textColor ?? (isSelected ? Colors.white : theme.textTheme.bodySmall?.color);

    if (onDeleted != null) {
      return Chip(
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: fontSize + 2,
                color: chipTextColor,
              ),
              const SizedBox(width: 4),
            ],
            Text(
              label,
              style: TextStyle(
                fontSize: fontSize,
                color: chipTextColor,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
        backgroundColor: chipColor,
        deleteIcon: const Icon(Icons.close, size: 16),
        onDeleted: onDeleted,
        elevation: isSelected ? 4.0 : 1.0,
      );
    } else {
      return ActionChip(
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: fontSize + 2,
                color: chipTextColor,
              ),
              const SizedBox(width: 4),
            ],
            Text(
              label,
              style: TextStyle(
                fontSize: fontSize,
                color: chipTextColor,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
        backgroundColor: chipColor,
        onPressed: onTap,
        elevation: isSelected ? 4.0 : 1.0,
        pressElevation: 6.0,
      );
    }
  }
}

class CategoryChipList extends StatelessWidget {
  final List<String> categories;
  final List<String> selectedCategories;
  final Function(String)? onCategoryTap;
  final Function(String)? onCategoryDelete;
  final Color? chipColor;
  final WrapAlignment alignment;
  final double spacing;
  final double runSpacing;

  const CategoryChipList({
    super.key,
    required this.categories,
    this.selectedCategories = const [],
    this.onCategoryTap,
    this.onCategoryDelete,
    this.chipColor,
    this.alignment = WrapAlignment.start,
    this.spacing = 8.0,
    this.runSpacing = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    if (categories.isEmpty) {
      return const SizedBox.shrink();
    }

    return Wrap(
      alignment: alignment,
      spacing: spacing,
      runSpacing: runSpacing,
      children: categories.map((category) {
        final isSelected = selectedCategories.contains(category);
        
        return CategoryChip(
          label: category,
          color: chipColor,
          isSelected: isSelected,
          onTap: onCategoryTap != null ? () => onCategoryTap!(category) : null,
          onDeleted: onCategoryDelete != null ? () => onCategoryDelete!(category) : null,
        );
      }).toList(),
    );
  }
}