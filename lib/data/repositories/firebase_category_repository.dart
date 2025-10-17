import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/category.dart';
import '../../domain/repositories/category_repository.dart';

class FirebaseCategoryRepository implements CategoryRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String? _userId;

  FirebaseCategoryRepository({String? userId}) : _userId = userId;

  String get _collectionPath => _userId != null
      ? 'users/$_userId/categories'
      : 'categories';

  CollectionReference get _collection => _firestore.collection(_collectionPath);

  // Convert Category to Firestore document
  Map<String, dynamic> _toFirestore(Category category) {
    return category.toJson();
  }

  // Convert Firestore document to Category
  Category _fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Category.fromJson(data);
  }

  @override
  Future<List<Category>> getAllCategories() async {
    try {
      final snapshot = await _collection.orderBy('order').get();
      return snapshot.docs.map(_fromFirestore).toList();
    } catch (e) {
      // If orderBy fails (e.g., missing order field), fall back to unordered query
      final snapshot = await _collection.get();
      return snapshot.docs.map(_fromFirestore).toList();
    }
  }

  @override
  Future<Category?> getCategoryById(String id) async {
    final snapshot = await _collection.where('id', isEqualTo: id).limit(1).get();
    if (snapshot.docs.isEmpty) return null;
    return _fromFirestore(snapshot.docs.first);
  }

  @override
  Future<void> saveCategory(Category category) async {
    await _collection.doc(category.id).set(_toFirestore(category));
  }

  @override
  Future<void> updateCategory(Category category) async {
    await _collection.doc(category.id).update(_toFirestore(category));
  }

  @override
  Future<void> deleteCategory(String id) async {
    final snapshot = await _collection.where('id', isEqualTo: id).get();
    for (final doc in snapshot.docs) {
      await doc.reference.delete();
    }
  }

  @override
  Stream<List<Category>> watchCategories() {
    return _collection.orderBy('order').snapshots().map(
      (snapshot) => snapshot.docs.map(_fromFirestore).toList(),
    );
  }
}
