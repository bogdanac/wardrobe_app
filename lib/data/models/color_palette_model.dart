import 'package:isar/isar.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/color_palette.dart';

part 'color_palette_model.g.dart';

@Collection()
class ColorPaletteModel {
  Id? isarId;
  
  @Index(unique: true)
  String id;
  
  String name;
  List<int> colorValues;
  DateTime createdAt;
  DateTime updatedAt;
  String? description;
  bool isCustom;

  ColorPaletteModel({
    this.isarId,
    required this.id,
    required this.name,
    this.colorValues = const [],
    required this.createdAt,
    required this.updatedAt,
    this.description,
    this.isCustom = true,
  });

  ColorPalette toEntity() {
    return ColorPalette(
      id: id,
      name: name,
      colors: colorValues.map((value) => Color(value)).toList(),
      createdAt: createdAt,
      updatedAt: updatedAt,
      description: description,
      isCustom: isCustom,
    );
  }

  static ColorPaletteModel fromEntity(ColorPalette entity) {
    return ColorPaletteModel(
      id: entity.id,
      name: entity.name,
      colorValues: entity.colors.map((color) => color.value).toList(),
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      description: entity.description,
      isCustom: entity.isCustom,
    );
  }
}