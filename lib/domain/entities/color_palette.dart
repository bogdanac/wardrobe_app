import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ColorPalette extends Equatable {
  final String id;
  final String? name;
  final List<Color> colors; // 2-3 colors
  final String? imagePath; // Optional reference image
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? description;
  final bool isCustom;

  const ColorPalette({
    required this.id,
    this.name,
    required this.colors,
    this.imagePath,
    required this.createdAt,
    required this.updatedAt,
    this.description,
    this.isCustom = true,
  });

  /// Validate that the palette has 2-3 colors
  bool get isValid => colors.length >= 2 && colors.length <= 3;

  ColorPalette copyWith({
    String? id,
    String? name,
    List<Color>? colors,
    String? imagePath,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? description,
    bool? isCustom,
  }) {
    return ColorPalette(
      id: id ?? this.id,
      name: name ?? this.name,
      colors: colors ?? this.colors,
      imagePath: imagePath ?? this.imagePath,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      description: description ?? this.description,
      isCustom: isCustom ?? this.isCustom,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        colors,
        imagePath,
        createdAt,
        updatedAt,
        description,
        isCustom,
      ];
}