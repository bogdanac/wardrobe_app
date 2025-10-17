import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum ColorSection {
  neutrals,
  pastels,
  accents,
}

class CustomColor extends Equatable {
  final String id;
  final String name;
  final String hex;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int order; // For maintaining order in the list
  final ColorSection section; // Category: neutrals, pastels, or accents

  const CustomColor({
    required this.id,
    required this.name,
    required this.hex,
    required this.createdAt,
    required this.updatedAt,
    required this.order,
    this.section = ColorSection.accents,
  });

  CustomColor copyWith({
    String? id,
    String? name,
    String? hex,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? order,
    ColorSection? section,
  }) {
    return CustomColor(
      id: id ?? this.id,
      name: name ?? this.name,
      hex: hex ?? this.hex,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      order: order ?? this.order,
      section: section ?? this.section,
    );
  }

  Color get color {
    try {
      return Color(int.parse(hex.substring(1), radix: 16) + 0xFF000000);
    } catch (e) {
      return Colors.grey;
    }
  }

  @override
  List<Object?> get props => [
        id,
        name,
        hex,
        createdAt,
        updatedAt,
        order,
        section,
      ];

  /// Convert to JSON for Firebase storage
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'hex': hex,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'order': order,
      'section': section.name,
    };
  }

  /// Create from JSON (Firebase)
  factory CustomColor.fromJson(Map<String, dynamic> json) {
    return CustomColor(
      id: json['id'] as String,
      name: json['name'] as String,
      hex: json['hex'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      order: json['order'] as int? ?? 0,
      section: json['section'] != null
          ? ColorSection.values.firstWhere(
              (s) => s.name == json['section'],
              orElse: () => ColorSection.neutrals,
            )
          : ColorSection.neutrals, // Default to neutrals for migration - user will manually organize
    );
  }
}
