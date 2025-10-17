import '../entities/outfit.dart';
import '../entities/clothing_item.dart';

abstract class OutfitRepository {
  Future<List<Outfit>> getAllOutfits();
  Future<Outfit?> getOutfitById(String id);
  Future<List<Outfit>> getOutfitsByCategory(String category);
  Future<List<Outfit>> getOutfitsBySeason(Season season);
  Future<List<Outfit>> getOutfitsByWeather(List<WeatherRange> weatherRanges);
  Future<List<Outfit>> getFavoriteOutfits();
  Future<List<Outfit>> searchOutfits(String query);
  Future<List<Outfit>> filterOutfits({
    List<String>? categories,
    List<String>? outfitStyles,
    Season? season,
    List<WeatherRange>? weatherRanges,
    bool? isFavorite,
  });
  Future<void> saveOutfit(Outfit outfit);
  Future<void> updateOutfit(Outfit outfit);
  Future<void> deleteOutfit(String id);
  Future<void> toggleFavorite(String id);
  Future<void> markAsWornToday(String id);
  Future<void> incrementWearCount(String id);
  Future<void> archiveOutfit(String id);
  Future<void> unarchiveOutfit(String id);
  Future<List<Outfit>> getArchivedOutfits();
}