import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/color_palette.dart';
import '../../domain/repositories/color_palette_repository.dart';

class FirebaseColorPaletteRepository implements ColorPaletteRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String? _userId;

  FirebaseColorPaletteRepository({String? userId}) : _userId = userId;

  String get _collectionPath => _userId != null
      ? 'users/$_userId/color_palettes'
      : 'color_palettes';

  CollectionReference get _collection => _firestore.collection(_collectionPath);

  // Convert ColorPalette to Firestore document
  Map<String, dynamic> _toFirestore(ColorPalette palette) {
    return {
      'id': palette.id,
      'name': palette.name,
      'colors': palette.colors.map((c) => c.toARGB32().toRadixString(16).padLeft(8, '0')).toList(),
      'imagePath': palette.imagePath,
      'createdAt': palette.createdAt.toIso8601String(),
      'updatedAt': palette.updatedAt.toIso8601String(),
      'description': palette.description,
      'isCustom': palette.isCustom,
    };
  }

  // Convert Firestore document to ColorPalette
  ColorPalette _fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ColorPalette(
      id: data['id'] as String,
      name: data['name'] as String?,
      colors: (data['colors'] as List)
          .map((hex) => Color(int.parse(hex as String, radix: 16)))
          .toList(),
      imagePath: data['imagePath'] as String?,
      createdAt: DateTime.parse(data['createdAt'] as String),
      updatedAt: DateTime.parse(data['updatedAt'] as String),
      description: data['description'] as String?,
      isCustom: data['isCustom'] as bool? ?? true,
    );
  }

  @override
  Future<List<ColorPalette>> getAllColorPalettes() async {
    final snapshot = await _collection.get();
    return snapshot.docs.map(_fromFirestore).toList();
  }

  @override
  Future<ColorPalette?> getColorPaletteById(String id) async {
    final snapshot = await _collection.where('id', isEqualTo: id).limit(1).get();
    if (snapshot.docs.isEmpty) return null;
    return _fromFirestore(snapshot.docs.first);
  }

  @override
  Future<void> saveColorPalette(ColorPalette palette) async {
    await _collection.doc(palette.id).set(_toFirestore(palette));
  }

  @override
  Future<void> updateColorPalette(ColorPalette palette) async {
    // Use set to fully replace the document (consistent with saveColorPalette)
    await _collection.doc(palette.id).set(_toFirestore(palette));
  }

  @override
  Future<void> deleteColorPalette(String id) async {
    final snapshot = await _collection.where('id', isEqualTo: id).get();
    for (final doc in snapshot.docs) {
      await doc.reference.delete();
    }
  }
}
