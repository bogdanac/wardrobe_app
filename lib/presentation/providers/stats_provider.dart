import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/clothing_item.dart';
import '../../domain/entities/outfit.dart';
import 'clothing_provider.dart';
import 'outfit_provider.dart';

class WardrobeStats {
  final int totalItems;
  final int totalOutfits;
  final Map<ClothingType, int> itemsByType;
  final List<ClothingItem> mostWornItems;
  final List<ClothingItem> leastWornItems;
  final List<ClothingItem> newestItems;
  final List<Outfit> favoriteOutfits;
  final Map<String, int> colorDistribution;
  final Map<Season, int> seasonalDistribution;
  final double averageWearCount;
  final int itemsWornThisMonth;
  final int outfitsWornThisMonth;

  const WardrobeStats({
    required this.totalItems,
    required this.totalOutfits,
    required this.itemsByType,
    required this.mostWornItems,
    required this.leastWornItems,
    required this.newestItems,
    required this.favoriteOutfits,
    required this.colorDistribution,
    required this.seasonalDistribution,
    required this.averageWearCount,
    required this.itemsWornThisMonth,
    required this.outfitsWornThisMonth,
  });
}

final wardrobeStatsProvider = FutureProvider<WardrobeStats>((ref) async {
  final allItems = await ref.watch(allClothingItemsProvider.future);
  final allOutfits = await ref.watch(allOutfitsProvider.future);
  final favoriteOutfits = await ref.watch(favoriteOutfitsProvider.future);

  final now = DateTime.now();
  final thisMonth = DateTime(now.year, now.month, 1);

  // Calculate basic stats
  final totalItems = allItems.length;
  final totalOutfits = allOutfits.length;

  // Group items by type
  final itemsByType = <ClothingType, int>{};
  for (final item in allItems) {
    itemsByType[item.type] = (itemsByType[item.type] ?? 0) + 1;
  }

  // Sort items by wear count
  final sortedByWearCount = List<ClothingItem>.from(allItems)
    ..sort((a, b) => b.wearCount.compareTo(a.wearCount));

  final mostWornItems = sortedByWearCount.take(5).toList();
  final leastWornItems = sortedByWearCount.reversed.take(5).toList();

  // Sort items by creation date (newest first)
  final newestItems = List<ClothingItem>.from(allItems)
    ..sort((a, b) => b.createdAt.compareTo(a.createdAt))
    ..take(5);

  // Color distribution
  final colorDistribution = <String, int>{};
  for (final item in allItems) {
    for (final color in item.colors) {
      colorDistribution[color] = (colorDistribution[color] ?? 0) + 1;
    }
  }

  // Seasonal distribution
  final seasonalDistribution = <Season, int>{};
  for (final item in allItems) {
    if (item.season != null) {
      seasonalDistribution[item.season!] = (seasonalDistribution[item.season!] ?? 0) + 1;
    }
  }

  // Average wear count
  final totalWearCount = allItems.fold<int>(0, (sum, item) => sum + item.wearCount);
  final averageWearCount = totalItems > 0 ? totalWearCount / totalItems : 0.0;

  // Items worn this month
  final itemsWornThisMonth = allItems
      .where((item) => item.lastWornDate != null && item.lastWornDate!.isAfter(thisMonth))
      .length;

  // Outfits worn this month
  final outfitsWornThisMonth = allOutfits
      .where((outfit) => outfit.lastWornDate != null && outfit.lastWornDate!.isAfter(thisMonth))
      .length;

  return WardrobeStats(
    totalItems: totalItems,
    totalOutfits: totalOutfits,
    itemsByType: itemsByType,
    mostWornItems: mostWornItems,
    leastWornItems: leastWornItems,
    newestItems: newestItems.toList(),
    favoriteOutfits: favoriteOutfits,
    colorDistribution: colorDistribution,
    seasonalDistribution: seasonalDistribution,
    averageWearCount: averageWearCount,
    itemsWornThisMonth: itemsWornThisMonth,
    outfitsWornThisMonth: outfitsWornThisMonth,
  );
});