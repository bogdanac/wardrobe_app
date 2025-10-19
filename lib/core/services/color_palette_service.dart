import 'package:flutter/material.dart';
import '../../domain/repositories/custom_color_repository.dart';

class ColorPaletteService {
  final CustomColorRepository _colorRepository;

  ColorPaletteService(this._colorRepository);

  /// Get all colors from repository (for backward compatibility)
  Future<List<Map<String, String>>> getColors() async {
    final customColors = await _colorRepository.getAllColors();
    return customColors.map((c) => {'name': c.name, 'hex': c.hex}).toList();
  }

  /// Find the closest color from the palette to a given color
  Future<Map<String, String>> findClosestColor(Color targetColor) async {
    final customColors = await _colorRepository.getAllColors();

    // If no custom colors, use defaults
    if (customColors.isEmpty) {
      return _findClosestColorFromDefaults(targetColor);
    }

    double minDistance = double.infinity;
    Map<String, String> closestColor = {'name': customColors.first.name, 'hex': customColors.first.hex};

    for (final customColor in customColors) {
      final distance = _colorDistance(targetColor, customColor.color);

      if (distance < minDistance) {
        minDistance = distance;
        closestColor = {'name': customColor.name, 'hex': customColor.hex};
      }
    }

    return closestColor;
  }

  /// Find the closest color from defaults (fallback)
  Map<String, String> _findClosestColorFromDefaults(Color targetColor) {
    // Simple fallback - return black or white based on brightness
    final r = (targetColor.r * 255.0).round() & 0xff;
    final g = (targetColor.g * 255.0).round() & 0xff;
    final b = (targetColor.b * 255.0).round() & 0xff;
    final brightness = (r * 299 + g * 587 + b * 114) / 1000;
    if (brightness > 128) {
      return {'name': 'white', 'hex': '#FFFFFF'};
    } else {
      return {'name': 'black', 'hex': '#000000'};
    }
  }

  /// Calculate color distance using Euclidean distance in RGB space
  double _colorDistance(Color c1, Color c2) {
    final r1 = (c1.r * 255.0).round() & 0xff;
    final g1 = (c1.g * 255.0).round() & 0xff;
    final b1 = (c1.b * 255.0).round() & 0xff;
    final r2 = (c2.r * 255.0).round() & 0xff;
    final g2 = (c2.g * 255.0).round() & 0xff;
    final b2 = (c2.b * 255.0).round() & 0xff;
    final rDiff = r1 - r2;
    final gDiff = g1 - g2;
    final bDiff = b1 - b2;
    return (rDiff * rDiff + gDiff * gDiff + bDiff * bDiff).toDouble();
  }


  String colorToHex(Color color) {
    return '#${color.toARGB32().toRadixString(16).substring(2).toUpperCase()}';
  }
}
