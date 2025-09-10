import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ColorPalette extends Equatable {
  final String id;
  final String name;
  final List<Color> colors;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? description;
  final bool isCustom;

  const ColorPalette({
    required this.id,
    required this.name,
    required this.colors,
    required this.createdAt,
    required this.updatedAt,
    this.description,
    this.isCustom = true,
  });

  ColorPalette copyWith({
    String? id,
    String? name,
    List<Color>? colors,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? description,
    bool? isCustom,
  }) {
    return ColorPalette(
      id: id ?? this.id,
      name: name ?? this.name,
      colors: colors ?? this.colors,
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
        createdAt,
        updatedAt,
        description,
        isCustom,
      ];
}