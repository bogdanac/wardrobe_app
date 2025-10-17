import 'dart:math';
import 'package:flutter/material.dart';
import '../../domain/entities/clothing_item.dart';
import '../../domain/entities/outfit.dart';
import '../../domain/entities/custom_color.dart';
import '../../domain/repositories/clothing_repository.dart';
import '../../domain/repositories/custom_color_repository.dart';
import '../themes/app_colors.dart';
import '../errors/app_exceptions.dart';

/// Enhanced outfit generator with seasonal awareness and smart recommendations
class EnhancedOutfitGenerator {
  final ClothingRepository _clothingRepository;
  final CustomColorRepository _colorRepository;
  final Random _random = Random();

  // Cache for neutral colors
  Set<String> _neutralColorNames = {};
  bool _colorsLoaded = false;

  EnhancedOutfitGenerator(this._clothingRepository, this._colorRepository);

  /// Load colors from database and identify neutrals
  Future<void> _loadColors() async {
    if (_colorsLoaded) return;

    try {
      final colors = await _colorRepository.getAllColors();

      // Identify neutral colors (section == neutrals)
      _neutralColorNames = colors
          .where((c) => c.section == ColorSection.neutrals)
          .map((c) => c.name.toLowerCase())
          .toSet();


      _colorsLoaded = true;
    } catch (e) {
      // Fallback to basic neutrals if loading fails
      _neutralColorNames = {'black', 'white', 'gray', 'grey', 'beige', 'cream', 'brown', 'tan', 'khaki', 'coffee'};
    }
  }

  /// Check if a color name is neutral
  bool _isNeutralColor(String colorName) {
    return _neutralColorNames.contains(colorName.toLowerCase());
  }

  /// Get non-neutral colors from an item
  List<String> _getNonNeutralColors(ClothingItem item) {
    return item.colors.where((color) => !_isNeutralColor(color)).toList();
  }

  /// Generate multiple outfits with enhanced logic
  Future<List<Outfit>> generateEnhancedOutfits({
    required int count,
    List<String>? categories,
    Season? season,
    List<WeatherRange>? weatherRanges,
    List<String>? preferredColors,
    String? occasion,
    List<ClothingType>? preferredTypes,
    List<ClothingType>? excludeTypes,
  }) async {
    try {
      // Load colors before generating outfits
      await _loadColors();
      final allItems = await _clothingRepository.filterClothingItems(
        categories: categories,
        season: season,
        weatherRanges: weatherRanges,
        colors: preferredColors,
      );

      if (allItems.isEmpty) {
        throw const OutfitGenerationException(
          'No clothing items found matching the criteria',
          code: 'no_items_found',
        );
      }

      final outfits = <Outfit>[];
      final usedCombinations = <Set<String>>{};

      for (int i = 0; i < count; i++) {
        final outfit = await _generateSingleEnhancedOutfit(
          allItems,
          season: season,
          weatherRanges: weatherRanges,
          occasion: occasion,
          preferredTypes: preferredTypes,
          excludeTypes: excludeTypes,
          usedCombinations: usedCombinations,
        );

        if (outfit != null) {
          outfits.add(outfit);
          // Track this combination to avoid duplicates
          final combination = outfit.clothingItemIds.toSet();
          usedCombinations.add(combination);
        }

        // Break if we can't generate more unique outfits
        if (usedCombinations.length >= _getMaxPossibleCombinations(allItems)) {
          break;
        }
      }

      if (outfits.isEmpty) {
        throw const OutfitGenerationException(
          'Unable to generate any outfits with the current wardrobe',
          code: 'generation_failed',
        );
      }

      return outfits;
    } catch (e) {
      if (e is OutfitGenerationException) rethrow;
      throw OutfitGenerationException(
        'Failed to generate outfits',
        originalError: e,
      );
    }
  }

  /// Generate a single enhanced outfit
  Future<Outfit?> _generateSingleEnhancedOutfit(
    List<ClothingItem> allItems, {
    Season? season,
    List<WeatherRange>? weatherRanges,
    String? occasion,
    List<ClothingType>? preferredTypes,
    List<ClothingType>? excludeTypes,
    Set<Set<String>>? usedCombinations,
  }) async {
    final outfitItems = <ClothingItem>[];
    final itemsByType = _groupItemsByType(allItems);
    
    // Define outfit structure based on season and occasion
    final requiredTypes = _getRequiredTypesForContext(season, occasion);
    final optionalTypes = _getOptionalTypesForContext(season, occasion);

    // Select required items first
    for (final type in requiredTypes) {
      if (excludeTypes?.contains(type) == true) continue;
      
      final availableItems = itemsByType[type] ?? [];
      if (availableItems.isEmpty) continue;

      final selectedItem = _selectBestItem(
        availableItems,
        outfitItems,
        season: season,
        weatherRanges: weatherRanges,
        occasion: occasion,
      );

      if (selectedItem != null) {
        outfitItems.add(selectedItem);
      }
    }

    // Add optional items if they complement the outfit
    for (final type in optionalTypes) {
      if (excludeTypes?.contains(type) == true) continue;
      if (outfitItems.any((item) => item.type == type)) continue;
      
      final availableItems = itemsByType[type] ?? [];
      if (availableItems.isEmpty) continue;

      final selectedItem = _selectBestItem(
        availableItems,
        outfitItems,
        season: season,
        weatherRanges: weatherRanges,
        occasion: occasion,
      );

      if (selectedItem != null && _shouldAddOptionalItem(outfitItems, selectedItem)) {
        outfitItems.add(selectedItem);
      }
    }

    if (outfitItems.length < 2) return null;

    // Check if this combination was already used
    final combination = outfitItems.map((e) => e.id).toSet();
    if (usedCombinations?.contains(combination) == true) {
      return null;
    }

    // Score the outfit
    _scoreOutfit(outfitItems, season, weatherRanges, occasion);

    return Outfit(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: _generateOutfitName(outfitItems, season, occasion),
      clothingItemIds: outfitItems.map((item) => item.id).toList(),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      tags: _generateOutfitTags(outfitItems, season, occasion),
      seasons: season != null ? [season] : [],
      weatherRanges: weatherRanges ?? [],
      categories: _generateOutfitCategories(outfitItems),
    );
  }

  /// Group items by type for efficient lookup
  Map<ClothingType, List<ClothingItem>> _groupItemsByType(List<ClothingItem> items) {
    final grouped = <ClothingType, List<ClothingItem>>{};
    for (final item in items) {
      grouped.putIfAbsent(item.type, () => []).add(item);
    }
    return grouped;
  }

  /// Get required clothing types based on context
  List<ClothingType> _getRequiredTypesForContext(Season? season, String? occasion) {
    final required = <ClothingType>[];

    // Base requirements
    required.addAll([ClothingType.top, ClothingType.bottom, ClothingType.shoes]);

    // Season-specific additions
    if (season == Season.winter) {
      required.add(ClothingType.outerwear);
    }

    // Occasion-specific modifications
    switch (occasion?.toLowerCase()) {
      case 'formal':
      case 'work':
        required.remove(ClothingType.shoes);
        required.add(ClothingType.shoes); // Ensure formal shoes
        break;
      case 'party':
      case 'date':
        required.add(ClothingType.accessory);
        break;
      case 'gym':
      case 'sports':
        required.clear();
        required.addAll([ClothingType.activewear, ClothingType.shoes]);
        break;
    }

    return required;
  }

  /// Get optional clothing types for variety
  List<ClothingType> _getOptionalTypesForContext(Season? season, String? occasion) {
    final optional = <ClothingType>[
      ClothingType.accessory,
      ClothingType.bag,
    ];

    // Season-specific additions - accessories cover hats, scarves, gloves, etc.
    if (season == Season.summer || season == Season.winter) {
      // Ensure accessory is in the list for seasonal accessories
      if (!optional.contains(ClothingType.accessory)) {
        optional.add(ClothingType.accessory);
      }
    }

    return optional;
  }

  /// Select the best item from available options
  ClothingItem? _selectBestItem(
    List<ClothingItem> items,
    List<ClothingItem> existingItems, {
    Season? season,
    List<WeatherRange>? weatherRanges,
    String? occasion,
  }) {
    if (items.isEmpty) return null;

    // Score each item
    final scoredItems = items.map((item) {
      double score = 0;

      // Color compatibility with existing items
      if (existingItems.isNotEmpty) {
        score += _calculateColorCompatibilityScore(item, existingItems);
      }

      // Season appropriateness
      if (season != null) {
        score += _calculateSeasonScore(item, season);
      }

      // Weather appropriateness
      if (weatherRanges != null && weatherRanges.isNotEmpty) {
        score += _calculateWeatherScore(item, weatherRanges);
      }

      // Occasion appropriateness
      if (occasion != null) {
        score += _calculateOccasionScore(item, occasion);
      }

      // Prefer less frequently worn items
      score += _calculateFreshnessScore(item);

      // Style consistency
      if (existingItems.isNotEmpty) {
        score += _calculateStyleConsistencyScore(item, existingItems);
      }

      return MapEntry(item, score);
    }).toList();

    // Sort by score and add some randomness
    scoredItems.sort((a, b) => b.value.compareTo(a.value));
    
    // Select from top 3 to add variety
    final topItems = scoredItems.take(3).toList();
    return topItems[_random.nextInt(topItems.length)].key;
  }

  /// Generate outfit name
  String _generateOutfitName(List<ClothingItem> items, Season? season, String? occasion) {
    final types = items.map((item) => item.type.name).join(' & ');
    final seasonStr = season?.name ?? 'all season';
    final occasionStr = occasion ?? 'general';
    return '$types for $occasionStr ($seasonStr)';
  }

  /// Generate outfit categories
  List<String> _generateOutfitCategories(List<ClothingItem> items) {
    final categories = <String>{};
    for (final item in items) {
      categories.addAll(item.categories);
    }
    return categories.toList();
  }

  /// Calculate color compatibility score
  /// Neutrals are freely compatible and don't count as "real" colors
  double _calculateColorCompatibilityScore(ClothingItem item, List<ClothingItem> existingItems) {
    if (item.colors.isEmpty) return 0;

    // Get non-neutral colors only for compatibility checking
    final itemNonNeutralColors = _getNonNeutralColors(item);

    // If item only has neutral colors, it's always compatible
    if (itemNonNeutralColors.isEmpty) {
      return 3.0; // High bonus for neutral items (they go with everything)
    }

    double totalScore = 0;
    int comparisons = 0;

    for (final existingItem in existingItems) {
      if (existingItem.colors.isEmpty) continue;

      // Get non-neutral colors from existing item
      final existingNonNeutralColors = _getNonNeutralColors(existingItem);

      // If existing item only has neutrals, new item is compatible
      if (existingNonNeutralColors.isEmpty) {
        totalScore += 2;
        comparisons++;
        continue;
      }

      // Compare only non-neutral colors
      for (final itemColor in itemNonNeutralColors) {
        for (final existingColor in existingNonNeutralColors) {
          try {
            final color1 = Color(int.parse(itemColor.replaceFirst('#', '0xFF')));
            final color2 = Color(int.parse(existingColor.replaceFirst('#', '0xFF')));

            if (AppColors.areColorsCompatible(color1, color2)) {
              totalScore += 2;
            } else {
              totalScore -= 1;
            }
            comparisons++;
          } catch (e) {
            // Skip invalid color formats
          }
        }
      }
    }

    return comparisons > 0 ? totalScore / comparisons : 0;
  }

  /// Calculate season appropriateness score
  double _calculateSeasonScore(ClothingItem item, Season season) {
    if (item.seasons.isEmpty) return 0;

    if (item.seasons.contains(season) || item.seasons.contains(Season.allSeason)) {
      return 3;
    }

    // Partial matches for transitional seasons
    if ((season == Season.spring && item.seasons.contains(Season.summer)) ||
        (season == Season.autumn && item.seasons.contains(Season.winter))) {
      return 1;
    }

    return -2; // Penalize inappropriate seasons
  }

  /// Calculate weather appropriateness score
  double _calculateWeatherScore(ClothingItem item, List<WeatherRange> weatherRanges) {
    if (item.weatherRanges.isEmpty) return 0;
    
    double score = 0;
    for (final weather in weatherRanges) {
      if (item.weatherRanges.contains(weather)) {
        score += 2;
      }
    }
    
    return score;
  }

  /// Calculate occasion appropriateness score
  double _calculateOccasionScore(ClothingItem item, String occasion) {
    double score = 0;
    
    // Check categories for occasion match
    for (final category in item.categories) {
      if (category.toLowerCase().contains(occasion.toLowerCase())) {
        score += 3;
      }
    }
    
    // Check tags for occasion match
    for (final tag in item.tags) {
      if (tag.toLowerCase().contains(occasion.toLowerCase())) {
        score += 2;
      }
    }
    
    return score;
  }

  /// Calculate freshness score (prefer less worn items)
  double _calculateFreshnessScore(ClothingItem item) {
    // Prefer items that haven't been worn recently
    if (item.lastWornDate == null) return 3;
    
    final daysSinceWorn = DateTime.now().difference(item.lastWornDate!).inDays;
    if (daysSinceWorn > 30) return 3;
    if (daysSinceWorn > 14) return 2;
    if (daysSinceWorn > 7) return 1;
    return 0;
  }

  /// Calculate style consistency score
  double _calculateStyleConsistencyScore(ClothingItem item, List<ClothingItem> existingItems) {
    double score = 0;
    
    // Check metallic elements consistency
    final existingMetallics = existingItems.map((e) => e.metallicElements).toSet();
    if (existingMetallics.contains(item.metallicElements) || 
        item.metallicElements == MetallicElements.none ||
        existingMetallics.contains(MetallicElements.none)) {
      score += 1;
    } else {
      score -= 1;
    }
    
    // Check category overlap for style consistency
    for (final existingItem in existingItems) {
      final commonCategories = item.categories.toSet().intersection(existingItem.categories.toSet());
      score += commonCategories.length * 0.5;
    }
    
    return score;
  }

  /// Determine if an optional item should be added
  bool _shouldAddOptionalItem(List<ClothingItem> existingItems, ClothingItem newItem) {
    // Don't add too many accessories
    final accessoryTypes = {
      ClothingType.accessory,
      ClothingType.bag,
    };

    final existingAccessories = existingItems.where((item) => accessoryTypes.contains(item.type)).length;
    if (accessoryTypes.contains(newItem.type) && existingAccessories >= 2) {
      return false;
    }

    return true;
  }

  /// Score the complete outfit
  double _scoreOutfit(List<ClothingItem> items, Season? season, List<WeatherRange>? weatherRanges, String? occasion) {
    double score = 0;
    
    // Base score for having an outfit
    score += items.length * 10;
    
    // Color harmony bonus
    score += _calculateOutfitColorHarmony(items);
    
    // Completeness bonus
    if (_hasCompleteOutfit(items)) {
      score += 20;
    }
    
    // Occasion appropriateness
    if (occasion != null) {
      score += _calculateOutfitOccasionScore(items, occasion);
    }
    
    return score.clamp(0, 100);
  }

  /// Calculate color harmony for the entire outfit
  /// Only considers non-neutral colors for harmony
  double _calculateOutfitColorHarmony(List<ClothingItem> items) {
    // Get only non-neutral colors from all items
    final allNonNeutralColors = items
        .expand((item) => _getNonNeutralColors(item))
        .toList();

    // If outfit has 0-1 non-neutral colors, it's perfectly harmonious (all neutrals or monochrome)
    if (allNonNeutralColors.length < 2) {
      return 10.0; // Perfect harmony bonus for neutral-only or monochrome outfits
    }

    double harmonyScore = 0;
    int comparisons = 0;

    for (int i = 0; i < allNonNeutralColors.length; i++) {
      for (int j = i + 1; j < allNonNeutralColors.length; j++) {
        try {
          final color1 = Color(int.parse(allNonNeutralColors[i].replaceFirst('#', '0xFF')));
          final color2 = Color(int.parse(allNonNeutralColors[j].replaceFirst('#', '0xFF')));

          if (AppColors.areColorsCompatible(color1, color2)) {
            harmonyScore += 1;
          }
          comparisons++;
        } catch (e) {
          // Skip invalid colors
        }
      }
    }

    return comparisons > 0 ? (harmonyScore / comparisons) * 10 : 0;
  }

  /// Check if outfit has essential components
  bool _hasCompleteOutfit(List<ClothingItem> items) {
    final types = items.map((item) => item.type).toSet();
    
    // At minimum: top, bottom, shoes
    return types.contains(ClothingType.top) && 
           types.contains(ClothingType.bottom) && 
           types.contains(ClothingType.shoes);
  }

  /// Calculate outfit appropriateness for occasion
  double _calculateOutfitOccasionScore(List<ClothingItem> items, String occasion) {
    double score = 0;
    
    for (final item in items) {
      score += _calculateOccasionScore(item, occasion);
    }
    
    return score;
  }

  /// Generate tags for the outfit
  List<String> _generateOutfitTags(List<ClothingItem> items, Season? season, String? occasion) {
    final tags = <String>[];
    
    // Add season tag
    if (season != null) {
      tags.add(season.name);
    }
    
    // Add occasion tag
    if (occasion != null) {
      tags.add(occasion);
    }
    
    // Add style tags based on items
    final allCategories = items.expand((item) => item.categories).toSet();
    tags.addAll(allCategories.take(3)); // Limit to avoid too many tags
    
    return tags;
  }

  /// Estimate maximum possible combinations
  int _getMaxPossibleCombinations(List<ClothingItem> items) {
    final itemsByType = _groupItemsByType(items);
    
    int combinations = 1;
    for (final typeItems in itemsByType.values) {
      if (typeItems.isNotEmpty) {
        combinations *= typeItems.length;
      }
    }
    
    return (combinations / 10).round().clamp(1, 50); // Reasonable upper limit
  }
}