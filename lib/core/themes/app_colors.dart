import 'package:flutter/material.dart';
import '../../domain/entities/clothing_item.dart';

class AppColors {
  // Primary colors
  static const Color primaryBlack = Color(0xFF1A1A1A);
  static const Color primaryWhite = Color(0xFFFFFFFF);
  static const Color pastelPink = Color(0xFFFFB3D1);
  static const Color darkerPink = Color(0xFFE89AB8); // Darker pink for backgrounds
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

  // Get basic color name from HSL values (simple approximation for analytics)
  // Note: For accurate color names, use ColorPaletteService.findClosestColor
  static String getColorName(Color color) {
    final hsl = HSLColor.fromColor(color);
    final hue = hsl.hue;
    final saturation = hsl.saturation;
    final lightness = hsl.lightness;

    // Check for neutrals first
    if (saturation < 0.1) {
      if (lightness > 0.9) return 'white';
      if (lightness < 0.1) return 'black';
      if (lightness > 0.6) return 'light gray';
      if (lightness < 0.4) return 'dark gray';
      return 'gray';
    }

    // Check for pastels
    final isPastel = lightness > 0.7 && saturation < 0.5;

    // Determine hue-based color
    if (hue < 15 || hue >= 345) {
      return isPastel ? 'pastel pink' : (lightness > 0.6 ? 'pink' : 'red');
    } else if (hue < 45) {
      return isPastel ? 'pastel peach' : (lightness > 0.7 ? 'cream' : 'orange');
    } else if (hue < 75) {
      return isPastel ? 'pastel yellow' : 'yellow';
    } else if (hue < 150) {
      return isPastel ? 'pastel green' : (lightness < 0.4 ? 'forest green' : 'green');
    } else if (hue < 200) {
      return isPastel ? 'pastel turquoise' : 'blue';
    } else if (hue < 260) {
      return isPastel ? 'pastel blue' : (lightness < 0.3 ? 'navy' : 'blue');
    } else if (hue < 280) {
      return isPastel ? 'lavender' : 'purple';
    } else if (hue < 330) {
      return isPastel ? 'pastel purple' : (saturation > 0.8 ? 'fuchsia' : 'purple');
    } else {
      return isPastel ? 'pastel pink' : 'pink';
    }
  }
}