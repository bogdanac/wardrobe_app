import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ColorPaletteService {
  static const String _colorsKey = 'custom_color_palette';

  // Default color palette with names and hex values
  static final List<Map<String, String>> _defaultColors = [
    {'name': 'white', 'hex': '#FFFFFF'},
    {'name': 'light gray', 'hex': '#6B6B6B'},
    {'name': 'cream', 'hex': '#E8E3D6'},
    {'name': 'beige', 'hex': '#A89074'},
    {'name': 'pastel yellow', 'hex': '#FDFD96'},
    {'name': 'light peach', 'hex': '#FF7F6E'},
    {'name': 'light pink', 'hex': '#FFB6C1'},
    {'name': 'dust pink', 'hex': '#C08585'},
    {'name': 'light green', 'hex': '#77DD77'},
    {'name': 'light blue', 'hex': '#89CFF0'},
    {'name': 'lavender', 'hex': '#C8A2C8'},
    {'name': 'strong pink', 'hex': '#FF69B4'},
    {'name': 'pure red', 'hex': '#FF0000'},
    {'name': 'burgundy', 'hex': '#800020'},
    {'name': 'purple', 'hex': '#9370DB'},
    {'name': 'royal blue', 'hex': '#2C5AA0'},
    {'name': 'navy', 'hex': '#001F3F'},
    {'name': 'brown', 'hex': '#4A3728'},
    {'name': 'black', 'hex': '#000000'},
  ];

  Future<List<Map<String, String>>> getColors() async {
    final prefs = await SharedPreferences.getInstance();
    final colorsJson = prefs.getString(_colorsKey);

    if (colorsJson == null) {
      // Return default colors if none saved
      return List.from(_defaultColors);
    }

    try {
      final List<dynamic> decoded = json.decode(colorsJson);
      return decoded.map((item) => Map<String, String>.from(item)).toList();
    } catch (e) {
      return List.from(_defaultColors);
    }
  }

  Future<void> saveColors(List<Map<String, String>> colors) async {
    final prefs = await SharedPreferences.getInstance();
    final colorsJson = json.encode(colors);
    await prefs.setString(_colorsKey, colorsJson);
  }

  Future<void> addColor(String name, String hex) async {
    final colors = await getColors();
    colors.add({'name': name, 'hex': hex});
    await saveColors(colors);
  }

  Future<void> updateColor(int index, String name, String hex) async {
    final colors = await getColors();
    if (index >= 0 && index < colors.length) {
      colors[index] = {'name': name, 'hex': hex};
      await saveColors(colors);
    }
  }

  Future<void> deleteColor(int index) async {
    final colors = await getColors();
    if (index >= 0 && index < colors.length) {
      colors.removeAt(index);
      await saveColors(colors);
    }
  }

  Future<void> resetToDefaults() async {
    await saveColors(List.from(_defaultColors));
  }

  /// Find the closest color from the palette to a given color
  Map<String, String> findClosestColor(Color targetColor) {
    final colors = _defaultColors; // Use sync version for now

    double minDistance = double.infinity;
    Map<String, String> closestColor = colors.first;

    for (final colorData in colors) {
      final paletteColor = _hexToColor(colorData['hex']!);
      final distance = _colorDistance(targetColor, paletteColor);

      if (distance < minDistance) {
        minDistance = distance;
        closestColor = colorData;
      }
    }

    return closestColor;
  }

  /// Calculate color distance using Euclidean distance in RGB space
  double _colorDistance(Color c1, Color c2) {
    final rDiff = c1.red - c2.red;
    final gDiff = c1.green - c2.green;
    final bDiff = c1.blue - c2.blue;
    return (rDiff * rDiff + gDiff * gDiff + bDiff * bDiff).toDouble();
  }

  Color _hexToColor(String hex) {
    try {
      return Color(int.parse(hex.substring(1), radix: 16) + 0xFF000000);
    } catch (e) {
      return Colors.grey;
    }
  }

  String colorToHex(Color color) {
    return '#${color.value.toRadixString(16).substring(2).toUpperCase()}';
  }
}
