import 'dart:ui';
import '../themes/app_colors.dart';

class ColorUtils {
  static Color hexToColor(String hex) {
    final hexCode = hex.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  static String colorToHex(Color color) {
    return '#${color.value.toRadixString(16).substring(2).toUpperCase()}';
  }

  static bool areColorsCompatible(Color color1, Color color2) {
    final hsl1 = _colorToHSL(color1);
    final hsl2 = _colorToHSL(color2);
    
    // Check hue difference
    final hueDiff = (hsl1[0] - hsl2[0]).abs();
    final adjustedHueDiff = hueDiff > 180 ? 360 - hueDiff : hueDiff;
    
    // Compatible if complementary, analogous, or similar saturation
    return adjustedHueDiff <= 30 || // Analogous
           (adjustedHueDiff >= 150 && adjustedHueDiff <= 210) || // Complementary
           (hsl1[1] - hsl2[1]).abs() <= 0.3; // Similar saturation
  }

  static List<double> _colorToHSL(Color color) {
    final r = color.red / 255.0;
    final g = color.green / 255.0;
    final b = color.blue / 255.0;

    final max = [r, g, b].reduce((a, b) => a > b ? a : b);
    final min = [r, g, b].reduce((a, b) => a < b ? a : b);
    final diff = max - min;

    double h = 0;
    final s = max == 0 ? 0 : diff / max;
    final l = (max + min) / 2;

    if (diff != 0) {
      if (max == r) {
        h = ((g - b) / diff) % 6;
      } else if (max == g) {
        h = (b - r) / diff + 2;
      } else {
        h = (r - g) / diff + 4;
      }
      h *= 60;
      if (h < 0) h += 360;
    }

    return [h.toDouble(), s.toDouble(), l.toDouble()];
  }

  static bool isNeutralColor(Color color) {
    final neutralColors = [
      AppColors.primaryWhite,
      AppColors.primaryBlack,
      AppColors.neutral500,
      AppColors.lightGray,
      AppColors.mediumGray,
      AppColors.darkGray,
    ];

    return neutralColors.any((neutral) =>
      (color.red - neutral.red).abs() <= 30 &&
      (color.green - neutral.green).abs() <= 30 &&
      (color.blue - neutral.blue).abs() <= 30
    );
  }

  static double calculateColorHarmonyScore(List<Color> colors) {
    if (colors.length < 2) return 1.0;
    
    double totalScore = 0.0;
    int comparisons = 0;
    
    for (int i = 0; i < colors.length; i++) {
      for (int j = i + 1; j < colors.length; j++) {
        if (areColorsCompatible(colors[i], colors[j])) {
          totalScore += 1.0;
        } else if (isNeutralColor(colors[i]) || isNeutralColor(colors[j])) {
          totalScore += 0.7; // Neutrals work with most colors
        }
        comparisons++;
      }
    }
    
    return comparisons > 0 ? totalScore / comparisons : 1.0;
  }
}