import 'package:flutter/material.dart';

class AppColors {
  // Primary colors
  static const Color primary = Color(0xFFE8B4CB);
  static const Color secondary = Color(0xFF8E24AA);
  static const Color accent = Color(0xFFFFB74D);

  // Basic colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color red = Color(0xFFFF0000);
  static const Color green = Color(0xFF00FF00);
  static const Color blue = Color(0xFF0000FF);
  static const Color yellow = Color(0xFFFFFF00);
  static const Color orange = Color(0xFFFFA500);
  static const Color purple = Color(0xFF800080);
  static const Color pink = Color(0xFFFFC0CB);
  static const Color brown = Color(0xFFA52A2A);
  static const Color gray = Color(0xFF808080);
  static const Color beige = Color(0xFFF5F5DC);

  // Additional neutral colors
  static const Color neutralGray = Color(0xFF888888);
  static const Color lightGray = Color(0xFFCCCCCC);

  // Color name mapping
  static final Map<Color, String> _colorNames = {
    white: 'White',
    black: 'Black',
    red: 'Red',
    green: 'Green',
    blue: 'Blue',
    yellow: 'Yellow',
    orange: 'Orange',
    purple: 'Purple',
    pink: 'Pink',
    brown: 'Brown',
    gray: 'Gray',
    beige: 'Beige',
  };

  static String getColorName(Color? color) {
    if (color == null) return 'Unknown';

    // Find exact match
    String? exactMatch = _colorNames[color];
    if (exactMatch != null) return exactMatch;

    // Find closest match by color distance
    double minDistance = double.infinity;
    String closestName = 'Unknown';

    for (final entry in _colorNames.entries) {
      final distance = _calculateColorDistance(color, entry.key);
      if (distance < minDistance) {
        minDistance = distance;
        closestName = entry.value;
      }
    }

    return closestName;
  }

  static double _calculateColorDistance(Color color1, Color color2) {
    final r1 = (color1.r * 255.0).round() & 0xff;
    final g1 = (color1.g * 255.0).round() & 0xff;
    final b1 = (color1.b * 255.0).round() & 0xff;
    final r2 = (color2.r * 255.0).round() & 0xff;
    final g2 = (color2.g * 255.0).round() & 0xff;
    final b2 = (color2.b * 255.0).round() & 0xff;

    return ((r1 - r2) * (r1 - r2) + (g1 - g2) * (g1 - g2) + (b1 - b2) * (b1 - b2)).toDouble();
  }
}