import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/outfit.dart';
import '../../domain/entities/clothing_item.dart';
import '../../domain/repositories/outfit_repository.dart';

class FirebaseOutfitRepository implements OutfitRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String? _userId;

  FirebaseOutfitRepository({String? userId}) : _userId = userId;

  String get _collectionPath => _userId != null
      ? 'users/$_userId/outfits'
      : 'outfits';

  CollectionReference get _collection => _firestore.collection(_collectionPath);

  // Convert Outfit to Firestore document
  Map<String, dynamic> _toFirestore(Outfit outfit) {
    return {
      'id': outfit.id,
      'name': outfit.name,
      'clothingItemIds': outfit.clothingItemIds,
      'imagePreviewPath': outfit.imagePreviewPath,
      'categories': outfit.categories, // Deprecated: use outfitStyles instead
      'outfitStyles': outfit.outfitStyles,
      'seasons': outfit.seasons.map((e) => e.name).toList(),
      'weatherRanges': outfit.weatherRanges.map((e) => e.name).toList(),
      'isFavorite': outfit.isFavorite,
      'wearCount': outfit.wearCount,
      'lastWornDate': outfit.lastWornDate?.toIso8601String(),
      'createdAt': outfit.createdAt.toIso8601String(),
      'updatedAt': outfit.updatedAt.toIso8601String(),
      'tags': outfit.tags,
      'notes': outfit.notes,
      'isArchived': outfit.isArchived,
      'dateArchived': outfit.dateArchived?.toIso8601String(),
      'parentOutfitId': outfit.parentOutfitId,
      'variantCount': outfit.variantCount,
    };
  }

  // Convert Firestore document to Outfit
  Outfit _fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Outfit(
      id: data['id'] as String,
      name: data['name'] as String,
      clothingItemIds: (data['clothingItemIds'] as List?)?.cast<String>() ?? [],
      imagePreviewPath: data['imagePreviewPath'] as String?,
      categories: (data['categories'] as List?)?.cast<String>() ?? [], // Deprecated: use outfitStyles instead
      outfitStyles: (data['outfitStyles'] as List?)?.cast<String>() ?? [],
      seasons: (data['seasons'] as List?)
          ?.map((e) => Season.values.firstWhere((s) => s.name == e))
          .toList() ?? [],
      weatherRanges: (data['weatherRanges'] as List?)
          ?.map((e) => WeatherRange.values.firstWhere((wr) => wr.name == e))
          .toList() ?? [],
      isFavorite: data['isFavorite'] as bool? ?? false,
      wearCount: data['wearCount'] as int? ?? 0,
      lastWornDate: data['lastWornDate'] != null
          ? DateTime.parse(data['lastWornDate'] as String)
          : null,
      createdAt: DateTime.parse(data['createdAt'] as String),
      updatedAt: DateTime.parse(data['updatedAt'] as String),
      tags: (data['tags'] as List?)?.cast<String>() ?? [],
      notes: data['notes'] as String?,
      isArchived: data['isArchived'] as bool? ?? false,
      dateArchived: data['dateArchived'] != null
          ? DateTime.parse(data['dateArchived'] as String)
          : null,
      parentOutfitId: data['parentOutfitId'] as String?,
      variantCount: data['variantCount'] as int? ?? 0,
    );
  }

  @override
  Future<List<Outfit>> getAllOutfits() async {
    // Return empty list if user is not authenticated
    if (_userId == null) return [];

    final snapshot = await _collection
        .where('isArchived', isEqualTo: false)
        .get();
    return snapshot.docs.map(_fromFirestore).toList();
  }

  @override
  Future<Outfit?> getOutfitById(String id) async {
    final snapshot = await _collection.where('id', isEqualTo: id).limit(1).get();
    if (snapshot.docs.isEmpty) return null;
    return _fromFirestore(snapshot.docs.first);
  }

  @override
  Future<List<Outfit>> getFavoriteOutfits() async {
    final snapshot = await _collection
        .where('isFavorite', isEqualTo: true)
        .where('isArchived', isEqualTo: false)
        .get();
    return snapshot.docs.map(_fromFirestore).toList();
  }

  @override
  Future<List<Outfit>> getOutfitsBySeason(Season season) async {
    final snapshot = await _collection
        .where('seasons', arrayContains: season.name)
        .where('isArchived', isEqualTo: false)
        .get();
    return snapshot.docs.map(_fromFirestore).toList();
  }

  @override
  Future<List<Outfit>> getOutfitsByWeather(List<WeatherRange> weatherRanges) async {
    final weatherNames = weatherRanges.map((e) => e.name).toList();
    final snapshot = await _collection
        .where('weatherRanges', arrayContainsAny: weatherNames)
        .where('isArchived', isEqualTo: false)
        .get();
    return snapshot.docs.map(_fromFirestore).toList();
  }

  @override
  Future<List<Outfit>> searchOutfits(String query) async {
    // Return empty list if user is not authenticated
    if (_userId == null) return [];

    final snapshot = await _collection
        .where('isArchived', isEqualTo: false)
        .get();
    return snapshot.docs
        .map(_fromFirestore)
        .where((outfit) =>
            outfit.name.toLowerCase().contains(query.toLowerCase()) ||
            outfit.tags.any((tag) => tag.toLowerCase().contains(query.toLowerCase())))
        .toList();
  }

  @override
  Future<List<Outfit>> filterOutfits({
    List<String>? categories,
    List<String>? outfitStyles,
    List<Season>? seasons,
    List<WeatherRange>? weatherRanges,
    bool? isFavorite,
  }) async {
    // Return empty list if user is not authenticated
    if (_userId == null) return [];

    Query query = _collection.where('isArchived', isEqualTo: false);

    if (isFavorite != null) {
      query = query.where('isFavorite', isEqualTo: isFavorite);
    }

    final snapshot = await query.get();
    var outfits = snapshot.docs.map(_fromFirestore).toList();

    // Client-side season filtering
    // If "All Season" is selected in filter, show all outfits regardless of their season tags
    // Otherwise, show outfits that match any selected season OR have "All Season" tag
    if (seasons != null && seasons.isNotEmpty && !seasons.contains(Season.allSeason)) {
      outfits = outfits.where((outfit) =>
        outfit.seasons.any((s) => seasons.contains(s)) || outfit.seasons.contains(Season.allSeason)
      ).toList();
    }
    // If seasons contains Season.allSeason, don't filter - show all outfits

    // Client-side filtering for complex queries
    if (categories != null && categories.isNotEmpty) {
      outfits = outfits.where((outfit) =>
          outfit.categories.any((cat) => categories.contains(cat))).toList();
    }

    if (outfitStyles != null && outfitStyles.isNotEmpty) {
      outfits = outfits.where((outfit) =>
          outfit.outfitStyles.any((style) => outfitStyles.contains(style))).toList();
    }

    if (weatherRanges != null && weatherRanges.isNotEmpty) {
      outfits = outfits.where((outfit) =>
          outfit.weatherRanges.any((wr) => weatherRanges.contains(wr))).toList();
    }

    return outfits;
  }

  @override
  Future<void> saveOutfit(Outfit outfit) async {
    await _collection.doc(outfit.id).set(_toFirestore(outfit));
  }

  // Save outfit and increment parent variant count in a batch (more efficient for variants)
  @override
  Future<void> saveOutfitVariant(Outfit variant, String parentOutfitId) async {
    final batch = _firestore.batch();

    // Add the variant
    batch.set(_collection.doc(variant.id), _toFirestore(variant));

    // Increment parent's variant count
    final parentSnapshot = await _collection.where('id', isEqualTo: parentOutfitId).limit(1).get();
    if (parentSnapshot.docs.isNotEmpty) {
      batch.update(parentSnapshot.docs.first.reference, {
        'variantCount': FieldValue.increment(1),
        'updatedAt': DateTime.now().toIso8601String(),
      });
    }

    await batch.commit();
  }

  @override
  Future<void> updateOutfit(Outfit outfit) async {
    // Use set with merge to update existing document or create if it doesn't exist
    await _collection.doc(outfit.id).set(_toFirestore(outfit), SetOptions(merge: true));
  }

  @override
  Future<void> deleteOutfit(String id) async {
    final snapshot = await _collection.where('id', isEqualTo: id).get();
    for (final doc in snapshot.docs) {
      await doc.reference.delete();
    }
  }

  @override
  Future<List<Outfit>> getOutfitsByCategory(String category) async {
    final snapshot = await _collection
        .where('categories', arrayContains: category)
        .where('isArchived', isEqualTo: false)
        .get();
    return snapshot.docs.map(_fromFirestore).toList();
  }

  @override
  Future<void> toggleFavorite(String id) async {
    final snapshot = await _collection.where('id', isEqualTo: id).limit(1).get();
    if (snapshot.docs.isNotEmpty) {
      final data = snapshot.docs.first.data() as Map<String, dynamic>;
      final currentFavorite = data['isFavorite'] as bool? ?? false;
      await snapshot.docs.first.reference.update({
        'isFavorite': !currentFavorite,
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
  Future<void> archiveOutfit(String id) async {
    final snapshot = await _collection.where('id', isEqualTo: id).limit(1).get();
    if (snapshot.docs.isNotEmpty) {
      await snapshot.docs.first.reference.update({
        'isArchived': true,
        'dateArchived': DateTime.now().toIso8601String(),
        'updatedAt': DateTime.now().toIso8601String(),
      });
    }
  }

  @override
  Future<void> unarchiveOutfit(String id) async {
    final snapshot = await _collection.where('id', isEqualTo: id).limit(1).get();
    if (snapshot.docs.isNotEmpty) {
      await snapshot.docs.first.reference.update({
        'isArchived': false,
        'dateArchived': null,
        'updatedAt': DateTime.now().toIso8601String(),
      });
    }
  }

  @override
  Future<List<Outfit>> getArchivedOutfits() async {
    final snapshot = await _collection
        .where('isArchived', isEqualTo: true)
        .get();
    return snapshot.docs.map(_fromFirestore).toList();
  }

  // Get all variants of a base outfit
  @override
  Future<List<Outfit>> getOutfitVariants(String parentOutfitId) async {
    final snapshot = await _collection
        .where('parentOutfitId', isEqualTo: parentOutfitId)
        .get();

    // Sort in Dart instead of Firestore to avoid needing composite index
    final variants = snapshot.docs.map(_fromFirestore).toList();
    variants.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    return variants;
  }

  // Update variant count for a base outfit
  @override
  Future<void> updateVariantCount(String outfitId, int count) async {
    final snapshot = await _collection.where('id', isEqualTo: outfitId).limit(1).get();
    if (snapshot.docs.isNotEmpty) {
      await snapshot.docs.first.reference.update({
        'variantCount': count,
        'updatedAt': DateTime.now().toIso8601String(),
      });
    }
  }

  // Increment variant count for a base outfit (more efficient)
  @override
  Future<void> incrementVariantCount(String outfitId) async {
    final snapshot = await _collection.where('id', isEqualTo: outfitId).limit(1).get();
    if (snapshot.docs.isNotEmpty) {
      await snapshot.docs.first.reference.update({
        'variantCount': FieldValue.increment(1),
        'updatedAt': DateTime.now().toIso8601String(),
      });
    }
  }
}
