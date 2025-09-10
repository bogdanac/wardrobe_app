import 'package:flutter/material.dart';

class CategoryColors {
  static const Map<String, Color> _predefinedColors = {
    'brunch with the girls': Color(0xFFFF4081),
    'period safe': Color(0xFFBA68C8),
    'mall/errands': Color(0xFF00ACC1),
    'work': Color(0xFF5C6BC0),
    'elegant': Color(0xFFFF7043),
    'classy events': Color(0xFF66BB6A),
    'festivals': Color(0xFFFFC107),
    'romantic dates': Color(0xFFEC407A),
    'comfortable': Color(0xFF8D6E63),
  };

  static const List<Color> _fallbackColors = [
    Color(0xFF2196F3), // Bright Blue
    Color(0xFF4CAF50), // Bright Green
    Color(0xFFFF5722), // Deep Orange
    Color(0xFF9C27B0), // Purple
    Color(0xFFF44336), // Red
    Color(0xFF00BCD4), // Cyan
    Color(0xFF009688), // Teal
    Color(0xFFFFEB3B), // Yellow
    Color(0xFF673AB7), // Deep Purple
    Color(0xFF3F51B5), // Indigo
  ];

  static Color getCategoryColor(String category) {
    // Check if it's a predefined category with a specific color
    if (_predefinedColors.containsKey(category)) {
      return _predefinedColors[category]!;
    }
    
    // Generate a color based on the category name hash for consistent colors
    final hash = category.hashCode;
    return _fallbackColors[hash.abs() % _fallbackColors.length];
  }
}