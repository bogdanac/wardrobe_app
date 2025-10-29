import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../../domain/entities/outfit_style.dart';
import '../../domain/repositories/outfit_style_repository.dart';

class FirebaseOutfitStyleRepository implements OutfitStyleRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String? _userId;

  FirebaseOutfitStyleRepository({String? userId}) : _userId = userId;

  String get _collectionPath => _userId != null
      ? 'users/$_userId/outfitStyles'
      : 'outfitStyles';

  CollectionReference get _collection => _firestore.collection(_collectionPath);

  // Convert OutfitStyle to Firestore document
  Map<String, dynamic> _toFirestore(OutfitStyle outfitStyle) {
    return outfitStyle.toJson();
  }

  // Convert Firestore document to OutfitStyle
  OutfitStyle _fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return OutfitStyle.fromJson(data);
  }

  @override
  Future<List<OutfitStyle>> getAllOutfitStyles() async {
    try {
      final snapshot = await _collection.orderBy('order').get();
      return snapshot.docs.map(_fromFirestore).toList();
    } catch (e) {
      // If orderBy fails (e.g., missing order field), fall back to unordered query
      if (kDebugMode) {
        print('Warning: orderBy failed, fetching outfit styles without order: $e');
      }
      final snapshot = await _collection.get();
      return snapshot.docs.map(_fromFirestore).toList();
    }
  }

  @override
  Future<OutfitStyle?> getOutfitStyleById(String id) async {
    final snapshot = await _collection.where('id', isEqualTo: id).limit(1).get();
    if (snapshot.docs.isEmpty) return null;
    return _fromFirestore(snapshot.docs.first);
  }

  @override
  Future<void> saveOutfitStyle(OutfitStyle outfitStyle) async {
    await _collection.doc(outfitStyle.id).set(_toFirestore(outfitStyle));
  }

  @override
  Future<void> updateOutfitStyle(OutfitStyle outfitStyle) async {
    // Use set to fully replace the document (consistent with saveOutfitStyle)
    await _collection.doc(outfitStyle.id).set(_toFirestore(outfitStyle));
  }

  @override
  Future<void> deleteOutfitStyle(String id) async {
    final snapshot = await _collection.where('id', isEqualTo: id).get();
    for (final doc in snapshot.docs) {
      await doc.reference.delete();
    }
  }

  @override
  Stream<List<OutfitStyle>> watchOutfitStyles() {
    return _collection.orderBy('order').snapshots().map(
      (snapshot) => snapshot.docs.map(_fromFirestore).toList(),
    );
  }
}
