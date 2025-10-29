import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import '../../domain/entities/custom_color.dart';
import '../../domain/repositories/custom_color_repository.dart';

class FirebaseCustomColorRepository implements CustomColorRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String? _userId;

  FirebaseCustomColorRepository({String? userId}) : _userId = userId;

  String get _collectionPath => _userId != null
      ? 'users/$_userId/custom_colors'
      : 'custom_colors';

  CollectionReference get _collection => _firestore.collection(_collectionPath);

  // Default color palette - SINGLE SOURCE OF TRUTH
  // Based on user's custom palette (28 colors)
  static final List<Map<String, String>> _defaultColorData = [
    // Pastels (6)
    {'name': 'pastel pink', 'hex': '#EBC3CE', 'section': 'pastels'},
    {'name': 'lavender', 'hex': '#D4C5F0', 'section': 'pastels'},
    {'name': 'pastel yellow', 'hex': '#ECE9A4', 'section': 'pastels'},
    {'name': 'pastel green', 'hex': '#A9CBA5', 'section': 'pastels'},
    {'name': 'mint', 'hex': '#6DAE8D', 'section': 'pastels'},
    {'name': 'pastel teal', 'hex': '#6EB4AD', 'section': 'pastels'},

    // Accent Colors (10)
    {'name': 'pink', 'hex': '#F486B5', 'section': 'accents'},
    {'name': 'fuchsia', 'hex': '#E63495', 'section': 'accents'},
    {'name': 'orange', 'hex': '#FF6638', 'section': 'accents'},
    {'name': 'red', 'hex': '#E63232', 'section': 'accents'},
    {'name': 'cool red', 'hex': '#B21031', 'section': 'accents'},
    {'name': 'burgundy', 'hex': '#5F1629', 'section': 'accents'},
    {'name': 'wine', 'hex': '#482A3C', 'section': 'accents'},
    {'name': 'royal blue', 'hex': '#2F2FB7', 'section': 'accents'},
    {'name': 'turquoise', 'hex': '#7ADCDA', 'section': 'accents'},
    {'name': 'lime', 'hex': '#B3E92C', 'section': 'accents'},

    // Neutrals (12)
    {'name': 'white', 'hex': '#FFFFFF', 'section': 'neutrals'},
    {'name': 'light gray', 'hex': '#B2B2B2', 'section': 'neutrals'},
    {'name': 'gray', 'hex': '#4D4F52', 'section': 'neutrals'},
    {'name': 'black', 'hex': '#121212', 'section': 'neutrals'},
    {'name': 'navy', 'hex': '#2C2C58', 'section': 'neutrals'},
    {'name': 'espresso', 'hex': '#362D28', 'section': 'neutrals'},
    {'name': 'cappucino', 'hex': '#BB8F6F', 'section': 'neutrals'},
    {'name': 'golden', 'hex': '#E8D3A4', 'section': 'neutrals'},
    {'name': 'almond', 'hex': '#D8CBB3', 'section': 'neutrals'},
    {'name': 'butter', 'hex': '#FDF0CB', 'section': 'neutrals'},
    {'name': 'peach nude', 'hex': '#FCC4B9', 'section': 'neutrals'},
    {'name': 'baby blue', 'hex': '#9CC1DF', 'section': 'neutrals'},
  ];

  // Convert CustomColor to Firestore document
  Map<String, dynamic> _toFirestore(CustomColor color) {
    return color.toJson();
  }

  // Convert Firestore document to CustomColor
  CustomColor _fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return CustomColor.fromJson(data);
  }

  @override
  Future<List<CustomColor>> getAllColors() async {
    final snapshot = await _collection.orderBy('order').get();
    return snapshot.docs.map(_fromFirestore).toList();
  }

  @override
  Future<CustomColor?> getColorById(String id) async {
    final snapshot = await _collection.where('id', isEqualTo: id).limit(1).get();
    if (snapshot.docs.isEmpty) return null;
    return _fromFirestore(snapshot.docs.first);
  }

  @override
  Future<void> saveColor(CustomColor color) async {
    await _collection.doc(color.id).set(_toFirestore(color));
  }

  @override
  Future<void> updateColor(CustomColor color) async {
    // Use set to fully replace the document (consistent with saveColor)
    await _collection.doc(color.id).set(_toFirestore(color));
  }

  @override
  Future<void> deleteColor(String id) async {
    final snapshot = await _collection.where('id', isEqualTo: id).get();
    for (final doc in snapshot.docs) {
      await doc.reference.delete();
    }
  }

  @override
  Future<void> resetToDefaults() async {
    // Delete all existing colors
    final existingColors = await getAllColors();
    for (final color in existingColors) {
      await deleteColor(color.id);
    }

    // Add default colors
    final now = DateTime.now();
    for (int i = 0; i < _defaultColorData.length; i++) {
      final colorData = _defaultColorData[i];
      final sectionStr = colorData['section'] ?? 'accents';
      final section = ColorSection.values.firstWhere(
        (s) => s.name == sectionStr,
        orElse: () => ColorSection.accents,
      );

      final color = CustomColor(
        id: const Uuid().v4(),
        name: colorData['name']!,
        hex: colorData['hex']!,
        createdAt: now,
        updatedAt: now,
        order: i,
        section: section,
      );
      await saveColor(color);
    }
  }

  @override
  Stream<List<CustomColor>> watchColors() {
    return _collection.orderBy('order').snapshots().map(
      (snapshot) => snapshot.docs.map(_fromFirestore).toList(),
    );
  }
}
