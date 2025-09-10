import '../entities/clothing_item.dart';

abstract class ClothingRepository {
  Future<List<ClothingItem>> getAllClothingItems();
  Future<ClothingItem?> getClothingItemById(String id);
  Future<List<ClothingItem>> getClothingItemsByType(ClothingType type);
  Future<List<ClothingItem>> getClothingItemsByCategory(String category);
  Future<List<ClothingItem>> getClothingItemsBySeason(Season season);
  Future<List<ClothingItem>> getClothingItemsByWeather(List<WeatherRange> weatherRanges);
  Future<List<ClothingItem>> searchClothingItems(String query);
  Future<List<ClothingItem>> filterClothingItems({
    List<ClothingType>? types,
    List<String>? categories,
    Season? season,
    List<WeatherRange>? weatherRanges,
    List<String>? colors,
  });
  Future<void> saveClothingItem(ClothingItem item);
  Future<void> updateClothingItem(ClothingItem item);
  Future<void> deleteClothingItem(String id);
  Future<void> incrementWearCount(String id);
  Future<void> markAsWornToday(String id);
}