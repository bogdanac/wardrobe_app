import 'package:flutter/material.dart';
import '../../domain/entities/clothing_item.dart';

class AppColors {
  // Primary colors
  static const Color primaryBlack = Color(0xFF1A1A1A);
  static const Color primaryWhite = Color(0xFFFFFFFF);
  static const Color pastelPink = Color(0xFFFFB3D1);
  static const Color gold = Color(0xFFFFD700);
  static const Color lightGray = Color(0xFF2A2A2A);
  static const Color mediumGray = Color(0xFF9E9E9E);
  static const Color darkGray = Color(0xFF424242);
  
  // Extended color palette
  static const Color softMint = Color(0xFF98E4D6);
  static const Color lavender = Color(0xFFB19CD9);
  static const Color peach = Color(0xFFFFB79A);
  static const Color skyBlue = Color(0xFF87CEEB);
  static const Color blush = Color(0xFFFFB6C1);
  static const Color sage = Color(0xFF9CAF88);
  static const Color cream = Color(0xFFF5F5DC);
  static const Color dustyRose = Color(0xFFD4A5A5);
  
  // Seasonal color palettes
  static const Map<Season, List<Color>> seasonalPalettes = {
    Season.spring: [
      Color(0xFFFFB3D1), // Pastel pink
      Color(0xFF98E4D6), // Soft mint
      Color(0xFFFFD700), // Gold/yellow
      Color(0xFFB19CD9), // Lavender
      Color(0xFF87CEEB), // Sky blue
      Color(0xFF9CAF88), // Sage green
    ],
    Season.summer: [
      Color(0xFF87CEEB), // Sky blue
      Color(0xFFFFB79A), // Peach
      Color(0xFF98E4D6), // Soft mint
      Color(0xFFFFFFFF), // Crisp white
      Color(0xFFFFD700), // Bright yellow
      Color(0xFFFFB6C1), // Light pink
    ],
    Season.autumn: [
      Color(0xFFFFB79A), // Peach/orange
      Color(0xFFD4A5A5), // Dusty rose
      Color(0xFF8B4513), // Saddle brown
      Color(0xFFFFD700), // Warm gold
      Color(0xFF9CAF88), // Olive green
      Color(0xFFF5F5DC), // Cream
    ],
    Season.winter: [
      Color(0xFF1A1A1A), // Deep black
      Color(0xFFFFFFFF), // Pure white
      Color(0xFF4682B4), // Steel blue
      Color(0xFF696969), // Dim gray
      Color(0xFFB19CD9), // Cool purple
      Color(0xFF2F4F4F), // Dark slate gray
    ],
  };
  
  // Status colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFF44336);
  static const Color info = Color(0xFF2196F3);
  
  // Neutral shades
  static const Color neutral50 = Color(0xFFFAFAFA);
  static const Color neutral100 = Color(0xFFF5F5F5);
  static const Color neutral200 = Color(0xFFE5E5E5);
  static const Color neutral300 = Color(0xFFD4D4D4);
  static const Color neutral400 = Color(0xFFA3A3A3);
  static const Color neutral500 = Color(0xFF737373);
  static const Color neutral600 = Color(0xFF525252);
  static const Color neutral700 = Color(0xFF404040);
  static const Color neutral800 = Color(0xFF262626);
  static const Color neutral900 = Color(0xFF171717);
  
  // Color categories for clothing
  static const Map<String, Color> clothingColors = {
    // Basic colors
    'black': Color(0xFF000000),
    'white': Color(0xFFFFFFFF),
    'gray': Color(0xFF808080),
    'brown': Color(0xFFA0522D),
    'beige': Color(0xFFF5F5DC),
    'cream': Color(0xFFF5F5DC),
    
    // Primary colors
    'red': Color(0xFFFF0000),
    'blue': Color(0xFF0000FF),
    'yellow': Color(0xFFFFFF00),
    
    // Secondary colors
    'green': Color(0xFF008000),
    'orange': Color(0xFFFFA500),
    'purple': Color(0xFF800080),
    'pink': Color(0xFFFFC0CB),
    
    // Pastel colors
    'pastel_pink': Color(0xFFFFB3D1),
    'pastel_blue': Color(0xFFADD8E6),
    'pastel_green': Color(0xFF90EE90),
    'pastel_yellow': Color(0xFFFFFFE0),
    'pastel_purple': Color(0xFFDDA0DD),
    
    // Earth tones
    'olive': Color(0xFF808000),
    'khaki': Color(0xFFF0E68C),
    'tan': Color(0xFFD2B48C),
    'rust': Color(0xFFB7410E),
    'burgundy': Color(0xFF800020),
    'navy': Color(0xFF000080),
    'forest_green': Color(0xFF228B22),
    'maroon': Color(0xFF800000),
    
    // Metallics
    'gold': Color(0xFFFFD700),
    'silver': Color(0xFFC0C0C0),
    'copper': Color(0xFFB87333),
    'bronze': Color(0xFFCD7F32),
  };
  
  // Get colors for a specific season
  static List<Color> getSeasonalColors(Season season) {
    return seasonalPalettes[season] ?? seasonalPalettes[Season.allSeason] ?? [];
  }
  
  // Get complementary colors for outfit coordination
  static List<Color> getComplementaryColors(Color baseColor) {
    final hsl = HSLColor.fromColor(baseColor);
    return [
      // Complementary (opposite hue)
      hsl.withHue((hsl.hue + 180) % 360).toColor(),
      // Analogous (adjacent hues)
      hsl.withHue((hsl.hue + 30) % 360).toColor(),
      hsl.withHue((hsl.hue - 30) % 360).toColor(),
      // Triadic
      hsl.withHue((hsl.hue + 120) % 360).toColor(),
      hsl.withHue((hsl.hue + 240) % 360).toColor(),
    ];
  }
  
  // Get neutral colors that go with any color
  static List<Color> getNeutralColors() {
    return [
      primaryBlack,
      primaryWhite,
      neutral300,
      neutral600,
      neutral800,
      const Color(0xFF8B4513), // Brown
      const Color(0xFFF5F5DC), // Cream
    ];
  }
  
  // Check if colors are compatible for outfit coordination
  static bool areColorsCompatible(Color color1, Color color2) {
    final hsl1 = HSLColor.fromColor(color1);
    final hsl2 = HSLColor.fromColor(color2);
    
    // Same color family
    if ((hsl1.hue - hsl2.hue).abs() < 30) return true;
    
    // Complementary colors
    if ((hsl1.hue - hsl2.hue).abs() > 150 && (hsl1.hue - hsl2.hue).abs() < 210) return true;
    
    // One is neutral
    if (hsl1.saturation < 0.1 || hsl2.saturation < 0.1) return true;
    
    // Analogous colors
    if ((hsl1.hue - hsl2.hue).abs() < 60) return true;
    
    return false;
  }
  
  // Get color name from hex value (approximate)
  static String getColorName(Color color) {
    double minDistance = double.infinity;
    String closestColorName = 'unknown';
    
    for (final entry in clothingColors.entries) {
      final distance = _colorDistance(color, entry.value);
      if (distance < minDistance) {
        minDistance = distance;
        closestColorName = entry.key;
      }
    }
    
    return closestColorName.replaceAll('_', ' ');
  }
  
  // Calculate distance between two colors
  static double _colorDistance(Color c1, Color c2) {
    final r = c1.red - c2.red;
    final g = c1.green - c2.green;
    final b = c1.blue - c2.blue;
    return (r * r + g * g + b * b).toDouble();
  }
}