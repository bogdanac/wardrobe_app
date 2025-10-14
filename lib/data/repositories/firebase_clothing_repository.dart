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
      'season': item.season?.name,
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
      season: data['season'] != null
          ? Season.values.firstWhere((e) => e.name == data['season'])
          : null,
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
    final snapshot = await _collection
        .where('isArchived', isEqualTo: false)
        .get();
    return snapshot.docs.map(_fromFirestore).toList();
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
        .where('season', isEqualTo: season.name)
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
    Query query = _collection.where('isArchived', isEqualTo: false);

    if (types != null && types.isNotEmpty) {
      query = query.where('type', whereIn: types.map((e) => e.name).toList());
    }

    if (season != null) {
      query = query.where('season', isEqualTo: season.name);
    }

    final snapshot = await query.get();
    var items = snapshot.docs.map(_fromFirestore).toList();

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
