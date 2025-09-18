import 'package:isar/isar.dart';
import '../../domain/entities/outfit.dart';
import '../../domain/entities/clothing_item.dart';
import '../../domain/repositories/outfit_repository.dart';
import '../../core/services/database_service.dart';
import '../models/outfit_model.dart';

class OutfitRepositoryImpl implements OutfitRepository {
  final DatabaseService _databaseService = DatabaseService.instance;

  @override
  Future<List<Outfit>> getAllOutfits() async {
    final isar = await _databaseService.isar;
    final models = await isar.outfitModels.where().findAll();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<Outfit?> getOutfitById(String id) async {
    final isar = await _databaseService.isar;
    final model = await isar.outfitModels.filter().idEqualTo(id).findFirst();
    return model?.toEntity();
  }

  @override
  Future<List<Outfit>> getOutfitsByCategory(String category) async {
    final isar = await _databaseService.isar;
    final models = await isar.outfitModels.filter().categoriesElementContains(category).findAll();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<Outfit>> getOutfitsBySeason(Season season) async {
    final isar = await _databaseService.isar;
    final models = await isar.outfitModels.filter().seasonEqualTo(season).findAll();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<Outfit>> getOutfitsByWeather(List<WeatherRange> weatherRanges) async {
    final isar = await _databaseService.isar;
    final models = await isar.outfitModels.filter().anyOf(
      weatherRanges,
      (q, weatherRange) => q.weatherRangesElementEqualTo(weatherRange),
    ).findAll();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<Outfit>> getFavoriteOutfits() async {
    final isar = await _databaseService.isar;
    final models = await isar.outfitModels.filter().isFavoriteEqualTo(true).findAll();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<Outfit>> searchOutfits(String query) async {
    final isar = await _databaseService.isar;
    final models = await isar.outfitModels.filter()
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
  Future<List<Outfit>> filterOutfits({
    List<String>? categories,
    Season? season,
    List<WeatherRange>? weatherRanges,
    bool? isFavorite,
  }) async {
    final isar = await _databaseService.isar;
    
    // Start with all outfits and apply filters step by step
    List<OutfitModel> models = await isar.outfitModels.where().findAll();
    
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
    
    if (isFavorite != null) {
      models = models.where((model) => model.isFavorite == isFavorite).toList();
    }
    
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<void> saveOutfit(Outfit outfit) async {
    final isar = await _databaseService.isar;
    final model = OutfitModel.fromEntity(outfit);
    await isar.writeTxn(() async {
      await isar.outfitModels.put(model);
    });
  }

  @override
  Future<void> updateOutfit(Outfit outfit) async {
    final isar = await _databaseService.isar;
    final model = OutfitModel.fromEntity(outfit);
    await isar.writeTxn(() async {
      await isar.outfitModels.put(model);
    });
  }

  @override
  Future<void> deleteOutfit(String id) async {
    final isar = await _databaseService.isar;
    await isar.writeTxn(() async {
      await isar.outfitModels.filter().idEqualTo(id).deleteFirst();
    });
  }

  @override
  Future<void> toggleFavorite(String id) async {
    final isar = await _databaseService.isar;
    final model = await isar.outfitModels.filter().idEqualTo(id).findFirst();
    if (model != null) {
      model.isFavorite = !model.isFavorite;
      await isar.writeTxn(() async {
        await isar.outfitModels.put(model);
      });
    }
  }

  @override
  Future<void> markAsWornToday(String id) async {
    final isar = await _databaseService.isar;
    final model = await isar.outfitModels.filter().idEqualTo(id).findFirst();
    if (model != null) {
      model.lastWornDate = DateTime.now();
      model.wearCount++;
      await isar.writeTxn(() async {
        await isar.outfitModels.put(model);
      });
    }
  }

  @override
  Future<void> incrementWearCount(String id) async {
    final isar = await _databaseService.isar;
    final model = await isar.outfitModels.filter().idEqualTo(id).findFirst();
    if (model != null) {
      model.wearCount++;
      await isar.writeTxn(() async {
        await isar.outfitModels.put(model);
      });
    }
  }

  @override
  Future<void> archiveOutfit(String id) async {
    final isar = await _databaseService.isar;
    final model = await isar.outfitModels.filter().idEqualTo(id).findFirst();
    if (model != null) {
      model.isArchived = true;
      await isar.writeTxn(() async {
        await isar.outfitModels.put(model);
      });
    }
  }

  @override
  Future<void> unarchiveOutfit(String id) async {
    final isar = await _databaseService.isar;
    final model = await isar.outfitModels.filter().idEqualTo(id).findFirst();
    if (model != null) {
      model.isArchived = false;
      await isar.writeTxn(() async {
        await isar.outfitModels.put(model);
      });
    }
  }

  @override
  Future<List<Outfit>> getArchivedOutfits() async {
    final isar = await _databaseService.isar;
    final allModels = await isar.outfitModels.where().findAll();
    final archivedModels = allModels.where((model) => model.isArchived).toList();
    return archivedModels.map((model) => model.toEntity()).toList();
  }
}