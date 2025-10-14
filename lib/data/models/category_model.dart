import 'package:isar/isar.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/category.dart';

part 'category_model.g.dart';

@Collection()
class CategoryModel {
  Id? isarId;
  
  @Index(unique: true)
  String id;
  
  String name;
  int colorValue;
  DateTime createdAt;
  DateTime updatedAt;
  String? description;
  int? iconCodePoint;

  CategoryModel({
    this.isarId,
    required this.id,
    required this.name,
    required this.colorValue,
    required this.createdAt,
    required this.updatedAt,
    this.description,
    this.iconCodePoint,
  });

  Category toEntity() {
    return Category(
      id: id,
      name: name,
      color: Color(colorValue),
      createdAt: createdAt,
      updatedAt: updatedAt,
      description: description,
      icon: iconCodePoint != null ? IconData(iconCodePoint!, fontFamily: 'MaterialIcons') : null,
    );
  }

  static CategoryModel fromEntity(Category entity) {
    return CategoryModel(
      id: entity.id,
      name: entity.name,
      colorValue: entity.color.toARGB32(),
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      description: entity.description,
      iconCodePoint: entity.icon?.codePoint,
    );
  }
}