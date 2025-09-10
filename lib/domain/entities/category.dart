import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Category extends Equatable {
  final String id;
  final String name;
  final Color color;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? description;
  final IconData? icon;

  const Category({
    required this.id,
    required this.name,
    required this.color,
    required this.createdAt,
    required this.updatedAt,
    this.description,
    this.icon,
  });

  Category copyWith({
    String? id,
    String? name,
    Color? color,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? description,
    IconData? icon,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      description: description ?? this.description,
      icon: icon ?? this.icon,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        color,
        createdAt,
        updatedAt,
        description,
        icon,
      ];
}