import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class OutfitStyle extends Equatable {
  final String id;
  final String name;
  final Color color;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? description;
  final IconData? icon;
  final int order;

  const OutfitStyle({
    required this.id,
    required this.name,
    required this.color,
    required this.createdAt,
    required this.updatedAt,
    this.description,
    this.icon,
    this.order = 0,
  });

  OutfitStyle copyWith({
    String? id,
    String? name,
    Color? color,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? description,
    IconData? icon,
    int? order,
  }) {
    return OutfitStyle(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      order: order ?? this.order,
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
        order,
      ];

  /// Convert to JSON for Firebase storage
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'color': color.toARGB32(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'description': description,
      'icon': icon?.codePoint,
      'order': order,
    };
  }

  /// Create from JSON (Firebase)
  factory OutfitStyle.fromJson(Map<String, dynamic> json) {
    return OutfitStyle(
      id: json['id'] as String,
      name: json['name'] as String,
      color: Color(json['color'] as int),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      description: json['description'] as String?,
      icon: json['icon'] != null
          ? IconData(json['icon'] as int, fontFamily: 'MaterialIcons')
          : null,
      order: json['order'] as int? ?? 0,
    );
  }
}
