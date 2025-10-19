import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/clothing_item.dart';
import '../../domain/repositories/clothing_repository.dart';

class FirebaseClothingRepository implements ClothingRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String? _userId;

  FirebaseClothingRepository({String? userId}) : _userId = userId;

  String get _collectionPath => _userId != null
      ? 'users/$_userId/clothing_items'
      : 'clothing_items';

  CollectionReference get _collection => _firestore.collection(_collectionPath);

  // Convert ClothingItem to Firestore document
  Map<String, dynamic> _toFirestore(ClothingItem item) {
    return {
      'id': item.id,
      'name': item.name,
      'brand': item.brand,
      'type': item.type.name,
      'imagePath': item.imagePath,
      'additionalImages': item.additionalImages,
      'colors': item.colors,
      'categories': item.categories,
      'seasons': item.seasons.map((e) => e.name).toList(),
      'weatherRanges': item.weatherRanges.map((e) => e.name).toList(),
      'wearCount': item.wearCount,
      'lastWornDate': item.lastWornDate?.toIso8601String(),
      'createdAt': item.createdAt.toIso8601String(),
      'updatedAt': item.updatedAt.toIso8601String(),
      'notes': item.notes,
      'tags': item.tags,
      'metallicElements': item.metallicElements.name,
      'sizeFit': item.sizeFit.name,
      'isArchived': item.isArchived,
    };
  }

  // Convert Firestore document to ClothingItem
  ClothingItem _fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ClothingItem(
      id: data['id'] as String,
      name: data['name'] as String,
      brand: data['brand'] as String?,
      type: ClothingType.values.firstWhere((e) => e.name == data['type']),
      imagePath: data['imagePath'] as String?,
      additionalImages: (data['additionalImages'] as List?)?.cast<String>() ?? [],
      colors: (data['colors'] as List?)?.cast<String>() ?? [],
      categories: (data['categories'] as List?)?.cast<String>() ?? [],
      seasons: (data['seasons'] as List?)
          ?.map((e) => Season.values.firstWhere((s) => s.name == e))
          .toList() ?? [],
      weatherRanges: (data['weatherRanges'] as List?)
          ?.map((e) => WeatherRange.values.firstWhere((wr) => wr.name == e))
          .toList() ?? [],
      wearCount: data['wearCount'] as int? ?? 0,
      lastWornDate: data['lastWornDate'] != null
          ? DateTime.parse(data['lastWornDate'] as String)
          : null,
      createdAt: DateTime.parse(data['createdAt'] as String),
      updatedAt: DateTime.parse(data['updatedAt'] as String),
      notes: data['notes'] as String?,
      tags: (data['tags'] as List?)?.cast<String>() ?? [],
      metallicElements: MetallicElements.values.firstWhere(
        (e) => e.name == data['metallicElements'],
        orElse: () => MetallicElements.none,
      ),
      sizeFit: SizeFit.values.firstWhere(
        (e) => e.name == data['sizeFit'],
        orElse: () => SizeFit.perfect,
      ),
      isArchived: data['isArchived'] as bool? ?? false,
    );
  }

  @override
  Future<List<ClothingItem>> getAllClothingItems() async {
    // Return empty list if user is not authenticated
    if (_userId == null) {
      return [];
    }

    try {
      final snapshot = await _collection
          .where('isArchived', isEqualTo: false)
          .get()
          .timeout(
            const Duration(seconds: 30),
            onTimeout: () {
              throw Exception('Firestore query timed out');
            },
          );
      return snapshot.docs.map(_fromFirestore).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ClothingItem?> getClothingItemById(String id) async {
    final snapshot = await _collection.where('id', isEqualTo: id).limit(1).get();
    if (snapshot.docs.isEmpty) return null;
    return _fromFirestore(snapshot.docs.first);
  }

  @override
  Future<List<ClothingItem>> getClothingItemsByType(ClothingType type) async {
    final snapshot = await _collection
        .where('type', isEqualTo: type.name)
        .where('isArchived', isEqualTo: false)
        .get();
    return snapshot.docs.map(_fromFirestore).toList();
  }

  @override
  Future<List<ClothingItem>> getClothingItemsByCategory(String category) async {
    final snapshot = await _collection
        .where('categories', arrayContains: category)
        .where('isArchived', isEqualTo: false)
        .get();
    return snapshot.docs.map(_fromFirestore).toList();
  }

  @override
  Future<List<ClothingItem>> getClothingItemsBySeason(Season season) async {
    final snapshot = await _collection
        .where('seasons', arrayContains: season.name)
        .where('isArchived', isEqualTo: false)
        .get();
    return snapshot.docs.map(_fromFirestore).toList();
  }

  @override
  Future<List<ClothingItem>> getClothingItemsByWeather(List<WeatherRange> weatherRanges) async {
    final weatherNames = weatherRanges.map((e) => e.name).toList();
    final snapshot = await _collection
        .where('weatherRanges', arrayContainsAny: weatherNames)
        .where('isArchived', isEqualTo: false)
        .get();
    return snapshot.docs.map(_fromFirestore).toList();
  }

  @override
  Future<List<ClothingItem>> searchClothingItems(String query) async {
    // Return empty list if user is not authenticated
    if (_userId == null) return [];

    final snapshot = await _collection
        .where('isArchived', isEqualTo: false)
        .get();
    return snapshot.docs
        .map(_fromFirestore)
        .where((item) =>
            item.name.toLowerCase().contains(query.toLowerCase()) ||
            (item.brand?.toLowerCase().contains(query.toLowerCase()) ?? false))
        .toList();
  }

  @override
  Future<List<ClothingItem>> filterClothingItems({
    List<ClothingType>? types,
    List<String>? categories,
    Season? season,
    List<WeatherRange>? weatherRanges,
    List<String>? colors,
  }) async {
    // Return empty list if user is not authenticated
    if (_userId == null) {
      return [];
    }

    Query query = _collection.where('isArchived', isEqualTo: false);

    if (types != null && types.isNotEmpty) {
      query = query.where('type', whereIn: types.map((e) => e.name).toList());
    }

    // Note: season parameter kept for backward compatibility but filtering done client-side
    try {
      final snapshot = await query.get().timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw Exception('Firestore filter query timed out');
        },
      );
      var items = snapshot.docs.map(_fromFirestore).toList();

      // Client-side season filtering - include items with allSeason
      if (season != null) {
        items = items.where((item) =>
          item.seasons.contains(season) || item.seasons.contains(Season.allSeason)
        ).toList();
      }

      // Client-side filtering for complex queries
      if (categories != null && categories.isNotEmpty) {
        items = items.where((item) =>
            item.categories.any((cat) => categories.contains(cat))).toList();
      }

      if (weatherRanges != null && weatherRanges.isNotEmpty) {
        items = items.where((item) =>
            item.weatherRanges.any((wr) => weatherRanges.contains(wr))).toList();
      }

      if (colors != null && colors.isNotEmpty) {
        items = items.where((item) =>
            item.colors.any((color) => colors.contains(color))).toList();
      }

      return items;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> saveClothingItem(ClothingItem item) async {
    await _collection.doc(item.id).set(_toFirestore(item));
  }

  @override
  Future<void> updateClothingItem(ClothingItem item) async {
    await _collection.doc(item.id).update(_toFirestore(item));
  }

  @override
  Future<void> deleteClothingItem(String id) async {
    // Archive all outfits containing this clothing item
    final outfitsCollection = _userId != null
        ? _firestore.collection('users/$_userId/outfits')
        : _firestore.collection('outfits');

    final outfitsSnapshot = await outfitsCollection
        .where('clothingItemIds', arrayContains: id)
        .get();

    // Archive each outfit that contains this item
    for (final doc in outfitsSnapshot.docs) {
      await doc.reference.update({
        'isArchived': true,
        'dateArchived': DateTime.now().toIso8601String(),
        'updatedAt': DateTime.now().toIso8601String(),
      });
    }

    // Delete the clothing item
    final snapshot = await _collection.where('id', isEqualTo: id).get();
    for (final doc in snapshot.docs) {
      await doc.reference.delete();
    }
  }

  @override
  Future<void> incrementWearCount(String id) async {
    final snapshot = await _collection.where('id', isEqualTo: id).limit(1).get();
    if (snapshot.docs.isNotEmpty) {
      await snapshot.docs.first.reference.update({
        'wearCount': FieldValue.increment(1),
        'lastWornDate': DateTime.now().toIso8601String(),
        'updatedAt': DateTime.now().toIso8601String(),
      });
    }
  }

  @override
  Future<void> markAsWornToday(String id) async {
    final snapshot = await _collection.where('id', isEqualTo: id).limit(1).get();
    if (snapshot.docs.isNotEmpty) {
      await snapshot.docs.first.reference.update({
        'lastWornDate': DateTime.now().toIso8601String(),
        'updatedAt': DateTime.now().toIso8601String(),
      });
    }
  }

  @override
  Future<void> archiveClothingItem(String id) async {
    final snapshot = await _collection.where('id', isEqualTo: id).limit(1).get();
    if (snapshot.docs.isNotEmpty) {
      await snapshot.docs.first.reference.update({
        'isArchived': true,
        'updatedAt': DateTime.now().toIso8601String(),
      });
    }
  }

  @override
  Future<void> unarchiveClothingItem(String id) async {
    final snapshot = await _collection.where('id', isEqualTo: id).limit(1).get();
    if (snapshot.docs.isNotEmpty) {
      await snapshot.docs.first.reference.update({
        'isArchived': false,
        'updatedAt': DateTime.now().toIso8601String(),
      });
    }
  }

  @override
  Future<List<ClothingItem>> getArchivedClothingItems() async {
    final snapshot = await _collection
        .where('isArchived', isEqualTo: true)
        .get();
    return snapshot.docs.map(_fromFirestore).toList();
  }
}
