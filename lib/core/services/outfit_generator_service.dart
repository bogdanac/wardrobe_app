import 'dart:math';
import '../../domain/entities/clothing_item.dart';
import '../../domain/entities/outfit.dart';
import '../../domain/repositories/clothing_repository.dart';
import 'ml_feedback_service.dart';

class OutfitGeneratorService {
  final ClothingRepository _clothingRepository;
  final MLFeedbackService _mlFeedbackService;
  final Random _random = Random();

  OutfitGeneratorService(this._clothingRepository) : _mlFeedbackService = MLFeedbackService();

  Future<Outfit?> generateRandomOutfit({
    List<String>? categories,
    Season? season,
    List<WeatherRange>? weatherRanges,
    List<String>? preferredColors,
    List<ClothingType>? excludeTypes,
    MetallicElements? metallicElementsFilter,
  }) async {
    try {
      final allItems = await _clothingRepository.filterClothingItems(
        categories: categories,
        season: season,
        weatherRanges: weatherRanges,
        colors: preferredColors,
      );

      if (allItems.isEmpty) return null;

      final outfitItems = <ClothingItem>[];
      final usedTypes = <ClothingType>{};

      final itemsByType = _groupItemsByType(allItems);
      final requiredTypes = _getRequiredTypes();
      
      for (final type in requiredTypes) {
        if (excludeTypes?.contains(type) == true) continue;
        
        final availableItems = itemsByType[type];
        if (availableItems != null && availableItems.isNotEmpty) {
          final selectedItem = _selectCompatibleItem(
            availableItems,
            outfitItems,
            preferredColors,
            metallicElementsFilter,
          );
          if (selectedItem != null) {
            outfitItems.add(selectedItem);
            usedTypes.add(type);
          }
        }
      }

      final optionalTypes = _getOptionalTypes();
      for (final type in optionalTypes) {
        if (excludeTypes?.contains(type) == true) continue;
        if (usedTypes.contains(type)) continue;
        if (_random.nextBool()) {
          final availableItems = itemsByType[type];
          if (availableItems != null && availableItems.isNotEmpty) {
            final selectedItem = _selectCompatibleItem(
              availableItems,
              outfitItems,
              preferredColors,
              metallicElementsFilter,
            );
            if (selectedItem != null) {
              outfitItems.add(selectedItem);
            }
          }
        }
      }

      if (outfitItems.isEmpty) return null;

      return Outfit(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: 'Generated Outfit ${DateTime.now().day}/${DateTime.now().month}',
        clothingItemIds: outfitItems.map((item) => item.id).toList(),
        categories: categories ?? [],
        season: season,
        weatherRanges: weatherRanges ?? [],
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        tags: const ['generated'],
      );
    } catch (e) {
      throw Exception('Failed to generate outfit: $e');
    }
  }

  Map<ClothingType, List<ClothingItem>> _groupItemsByType(List<ClothingItem> items) {
    final Map<ClothingType, List<ClothingItem>> grouped = {};
    for (final item in items) {
      grouped.putIfAbsent(item.type, () => []).add(item);
    }
    return grouped;
  }

  List<ClothingType> _getRequiredTypes() {
    return [
      ClothingType.top,
      ClothingType.bottom,
      ClothingType.shoes,
    ];
  }

  List<ClothingType> _getOptionalTypes() {
    return [
      ClothingType.outerwear,
      ClothingType.accessory,
      ClothingType.bag,
    ];
  }

  ClothingItem? _selectCompatibleItem(
    List<ClothingItem> items,
    List<ClothingItem> existingItems,
    List<String>? preferredColors,
    MetallicElements? metallicElementsFilter,
  ) {
    final compatibleItems = items.where((item) {
      return _isColorCompatible(item, existingItems, preferredColors) &&
             _isMetallicCompatible(item, existingItems, metallicElementsFilter);
    }).toList();

    if (compatibleItems.isEmpty) {
      // If no items match both color and metallic compatibility, 
      // prioritize metallic compatibility over color
      final metallicCompatibleItems = items.where((item) {
        return _isMetallicCompatible(item, existingItems, metallicElementsFilter);
      }).toList();
      
      if (metallicCompatibleItems.isNotEmpty) {
        return metallicCompatibleItems[_random.nextInt(metallicCompatibleItems.length)];
      }
      
      return items[_random.nextInt(items.length)];
    }

    return compatibleItems[_random.nextInt(compatibleItems.length)];
  }

  bool _isColorCompatible(
    ClothingItem item,
    List<ClothingItem> existingItems,
    List<String>? preferredColors,
  ) {
    if (preferredColors != null && preferredColors.isNotEmpty) {
      final hasPreferredColor = item.colors.any((color) => 
        preferredColors.contains(color));
      if (hasPreferredColor) return true;
    }

    if (existingItems.isEmpty) return true;

    final existingColors = existingItems
        .expand((item) => item.colors)
        .toSet();

    final itemColors = item.colors.toSet();
    
    final neutralColors = {'white', 'black', 'gray', 'grey', 'beige', 'cream'};
    final hasNeutral = itemColors.any((color) => 
      neutralColors.any((neutral) => 
        color.toLowerCase().contains(neutral)));

    if (hasNeutral) return true;

    final commonColors = existingColors.intersection(itemColors);
    if (commonColors.isNotEmpty) return true;

    return _areColorsComplementary(itemColors, existingColors);
  }

  bool _areColorsComplementary(Set<String> colors1, Set<String> colors2) {
    final complementaryPairs = [
      ['red', 'green'],
      ['blue', 'orange'],
      ['yellow', 'purple'],
      ['pink', 'green'],
      ['navy', 'beige'],
      ['brown', 'blue'],
    ];

    for (final pair in complementaryPairs) {
      final hasColor1 = colors1.any((c) => 
        c.toLowerCase().contains(pair[0]));
      final hasColor2 = colors2.any((c) => 
        c.toLowerCase().contains(pair[1]));
      
      if (hasColor1 && hasColor2) return true;
      
      final hasColor2In1 = colors1.any((c) => 
        c.toLowerCase().contains(pair[1]));
      final hasColor1In2 = colors2.any((c) => 
        c.toLowerCase().contains(pair[0]));
      
      if (hasColor2In1 && hasColor1In2) return true;
    }

    return false;
  }

  bool _isMetallicCompatible(
    ClothingItem item,
    List<ClothingItem> existingItems,
    MetallicElements? metallicElementsFilter,
  ) {
    // If no filter is set, all items are compatible
    if (metallicElementsFilter == null) return true;

    // If filter is set to "none", only accept items without metallic elements
    if (metallicElementsFilter == MetallicElements.none) {
      return item.metallicElements == MetallicElements.none;
    }

    // If filter is set to gold or silver, enforce the "only gold" or "only silver" rule
    if (metallicElementsFilter == MetallicElements.gold || 
        metallicElementsFilter == MetallicElements.silver) {
      
      // Check existing items - if any have metallic elements, they must match the filter
      final existingMetallicElements = existingItems
          .map((item) => item.metallicElements)
          .where((element) => element != MetallicElements.none)
          .toSet();

      // If there are existing metallic items, they must all match the filter
      if (existingMetallicElements.isNotEmpty) {
        final hasConflictingMetals = existingMetallicElements.any((element) => 
          element != metallicElementsFilter);
        if (hasConflictingMetals) return false;
      }

      // The current item can either have no metallic elements or match the filter
      return item.metallicElements == MetallicElements.none || 
             item.metallicElements == metallicElementsFilter;
    }

    return true;
  }

  Future<List<Outfit>> generateMultipleOutfits({
    required int count,
    List<String>? categories,
    Season? season,
    List<WeatherRange>? weatherRanges,
    List<String>? preferredColors,
    MetallicElements? metallicElementsFilter,
  }) async {
    final outfits = <Outfit>[];
    final usedCombinations = <Set<String>>{};

    for (int i = 0; i < count && i < 20; i++) {
      final outfit = await generateRandomOutfit(
        categories: categories,
        season: season,
        weatherRanges: weatherRanges,
        preferredColors: preferredColors,
        metallicElementsFilter: metallicElementsFilter,
      );

      if (outfit != null) {
        final combination = outfit.clothingItemIds.toSet();
        if (!usedCombinations.contains(combination)) {
          outfits.add(outfit.copyWith(
            name: 'Generated Outfit ${outfits.length + 1}',
          ));
          usedCombinations.add(combination);
        }
      }
    }

    return outfits;
  }

  Future<Outfit?> generateMLEnhancedOutfit({
    List<String>? categories,
    Season? season,
    List<WeatherRange>? weatherRanges,
  }) async {
    try {
      final allItems = await _clothingRepository.filterClothingItems(
        categories: categories,
        season: season,
        weatherRanges: weatherRanges,
      );

      if (allItems.isEmpty) return null;

      final outfitItems = <ClothingItem>[];
      final usedTypes = <ClothingType>{};

      final itemsByType = _groupItemsByType(allItems);
      final requiredTypes = _getRequiredTypes();
      
      for (final type in requiredTypes) {
        final availableItems = itemsByType[type];
        if (availableItems != null && availableItems.isNotEmpty) {
          final recommendedItems = await _mlFeedbackService.getRecommendedItems(
            type: type,
            existingItems: outfitItems,
            limit: 5,
          );
          
          final typeItems = availableItems.where((item) => 
            recommendedItems.any((rec) => rec.id == item.id)).toList();
          
          if (typeItems.isNotEmpty) {
            final selectedItem = typeItems.first;
            outfitItems.add(selectedItem);
            usedTypes.add(type);
          } else if (availableItems.isNotEmpty) {
            final selectedItem = _selectCompatibleItem(
              availableItems,
              outfitItems,
              null,
              null,
            );
            if (selectedItem != null) {
              outfitItems.add(selectedItem);
              usedTypes.add(type);
            }
          }
        }
      }

      final optionalTypes = _getOptionalTypes();
      for (final type in optionalTypes) {
        if (usedTypes.contains(type)) continue;
        if (_random.nextBool()) {
          final availableItems = itemsByType[type];
          if (availableItems != null && availableItems.isNotEmpty) {
            final recommendedItems = await _mlFeedbackService.getRecommendedItems(
              type: type,
              existingItems: outfitItems,
              limit: 3,
            );
            
            final typeItems = availableItems.where((item) => 
              recommendedItems.any((rec) => rec.id == item.id)).toList();
            
            if (typeItems.isNotEmpty) {
              outfitItems.add(typeItems.first);
            }
          }
        }
      }

      if (outfitItems.isEmpty) return null;

      final outfit = Outfit(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: 'AI-Recommended Outfit ${DateTime.now().day}/${DateTime.now().month}',
        clothingItemIds: outfitItems.map((item) => item.id).toList(),
        categories: categories ?? [],
        season: season,
        weatherRanges: weatherRanges ?? [],
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        tags: const ['ai-generated', 'recommended'],
      );

      return outfit;
    } catch (e) {
      throw Exception('Failed to generate ML-enhanced outfit: $e');
    }
  }

  Future<List<Outfit>> generateMLRankedOutfits({
    required int count,
    List<String>? categories,
    Season? season,
    List<WeatherRange>? weatherRanges,
  }) async {
    final candidates = await generateMultipleOutfits(
      count: count * 2,
      categories: categories,
      season: season,
      weatherRanges: weatherRanges,
    );

    final scoredOutfits = <MapEntry<Outfit, double>>[];

    for (final outfit in candidates) {
      final score = await _mlFeedbackService.calculateOutfitScore(outfit);
      scoredOutfits.add(MapEntry(outfit, score));
    }

    scoredOutfits.sort((a, b) => b.value.compareTo(a.value));

    return scoredOutfits
        .take(count)
        .map((entry) => entry.key.copyWith(
          name: '${entry.key.name} (${(entry.value * 100).round()}% match)',
          tags: [...entry.key.tags, 'ai-ranked'],
        ))
        .toList();
  }
}