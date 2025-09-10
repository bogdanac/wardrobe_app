import 'package:isar/isar.dart';
import '../../domain/entities/clothing_item.dart';
import '../../domain/repositories/clothing_repository.dart';
import '../../core/services/database_service.dart';
import '../models/clothing_item_model.dart';

class ClothingRepositoryImpl implements ClothingRepository {
  final DatabaseService _databaseService = DatabaseService.instance;

  @override
  Future<List<ClothingItem>> getAllClothingItems() async {
    final isar = await _databaseService.isar;
    final models = await isar.clothingItemModels.where().findAll();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<ClothingItem?> getClothingItemById(String id) async {
    final isar = await _databaseService.isar;
    final model = await isar.clothingItemModels.filter().idEqualTo(id).findFirst();
    return model?.toEntity();
  }

  @override
  Future<List<ClothingItem>> getClothingItemsByType(ClothingType type) async {
    final isar = await _databaseService.isar;
    final models = await isar.clothingItemModels.filter().typeEqualTo(type).findAll();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<ClothingItem>> getClothingItemsByCategory(String category) async {
    final isar = await _databaseService.isar;
    final models = await isar.clothingItemModels.filter().categoriesElementContains(category).findAll();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<ClothingItem>> getClothingItemsBySeason(Season season) async {
    final isar = await _databaseService.isar;
    final models = await isar.clothingItemModels.filter().seasonEqualTo(season).findAll();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<ClothingItem>> getClothingItemsByWeather(List<WeatherRange> weatherRanges) async {
    final isar = await _databaseService.isar;
    final models = await isar.clothingItemModels.filter().anyOf(
      weatherRanges,
      (q, weatherRange) => q.weatherRangesElementEqualTo(weatherRange),
    ).findAll();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<ClothingItem>> searchClothingItems(String query) async {
    final isar = await _databaseService.isar;
    final models = await isar.clothingItemModels.filter()
        .nameContains(query, caseSensitive: false)
        .or()
        .notesIsNotNull()
        .and()
        .notesContains(query, caseSensitive: false)
        .or()
        .tagsElementContains(query)
        .findAll();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<ClothingItem>> filterClothingItems({
    List<ClothingType>? types,
    List<String>? categories,
    Season? season,
    List<WeatherRange>? weatherRanges,
    List<String>? colors,
  }) async {
    final isar = await _databaseService.isar;
    
    // Start with all items and apply filters step by step
    List<ClothingItemModel> models = await isar.clothingItemModels.where().findAll();
    
    if (types != null && types.isNotEmpty) {
      models = models.where((model) => types.contains(model.type)).toList();
    }
    
    if (categories != null && categories.isNotEmpty) {
      models = models.where((model) => 
        model.categories.any((category) => categories.contains(category))
      ).toList();
    }
    
    if (season != null) {
      models = models.where((model) => model.season == season).toList();
    }
    
    if (weatherRanges != null && weatherRanges.isNotEmpty) {
      models = models.where((model) => 
        model.weatherRanges.any((range) => weatherRanges.contains(range))
      ).toList();
    }
    
    if (colors != null && colors.isNotEmpty) {
      models = models.where((model) => 
        model.colors.any((color) => colors.contains(color))
      ).toList();
    }
    
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<void> saveClothingItem(ClothingItem item) async {
    final isar = await _databaseService.isar;
    final model = ClothingItemModel.fromEntity(item);
    await isar.writeTxn(() async {
      await isar.clothingItemModels.put(model);
    });
  }

  @override
  Future<void> updateClothingItem(ClothingItem item) async {
    final isar = await _databaseService.isar;
    final model = ClothingItemModel.fromEntity(item);
    await isar.writeTxn(() async {
      await isar.clothingItemModels.put(model);
    });
  }

  @override
  Future<void> deleteClothingItem(String id) async {
    final isar = await _databaseService.isar;
    await isar.writeTxn(() async {
      await isar.clothingItemModels.filter().idEqualTo(id).deleteFirst();
    });
  }

  @override
  Future<void> incrementWearCount(String id) async {
    final isar = await _databaseService.isar;
    final model = await isar.clothingItemModels.filter().idEqualTo(id).findFirst();
    if (model != null) {
      model.wearCount++;
      await isar.writeTxn(() async {
        await isar.clothingItemModels.put(model);
      });
    }
  }

  @override
  Future<void> markAsWornToday(String id) async {
    final isar = await _databaseService.isar;
    final model = await isar.clothingItemModels.filter().idEqualTo(id).findFirst();
    if (model != null) {
      model.lastWornDate = DateTime.now();
      model.wearCount++;
      await isar.writeTxn(() async {
        await isar.clothingItemModels.put(model);
      });
    }
  }
}