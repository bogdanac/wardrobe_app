import '../../domain/entities/clothing_item.dart';
import '../../domain/repositories/clothing_repository.dart';

/// Service for providing smart defaults when creating outfits
class SmartDefaultsService {
  final ClothingRepository _clothingRepository;

  SmartDefaultsService(this._clothingRepository);

  /// Analyze selected items and suggest outfit categories
  Future<List<String>> suggestCategories(List<String> selectedItemIds) async {
    if (selectedItemIds.isEmpty) return [];

    try {
      final items = <ClothingItem>[];
      for (final itemId in selectedItemIds) {
        final item = await _clothingRepository.getClothingItemById(itemId);
        if (item != null) items.add(item);
      }

      return _analyzeItemsForCategories(items);
    } catch (e) {
      return [];
    }
  }

  /// Suggest appropriate season based on selected items
  Future<Season?> suggestSeason(List<String> selectedItemIds) async {
    if (selectedItemIds.isEmpty) return null;

    try {
      final items = <ClothingItem>[];
      for (final itemId in selectedItemIds) {
        final item = await _clothingRepository.getClothingItemById(itemId);
        if (item != null) items.add(item);
      }

      return _analyzeItemsForSeason(items);
    } catch (e) {
      return null;
    }
  }

  /// Suggest weather ranges based on selected items
  Future<List<WeatherRange>> suggestWeatherRanges(List<String> selectedItemIds) async {
    if (selectedItemIds.isEmpty) return [];

    try {
      final items = <ClothingItem>[];
      for (final itemId in selectedItemIds) {
        final item = await _clothingRepository.getClothingItemById(itemId);
        if (item != null) items.add(item);
      }

      return _analyzeItemsForWeather(items);
    } catch (e) {
      return [];
    }
  }

  /// Generate smart outfit name based on selected items and context
  Future<String> suggestOutfitName(
    List<String> selectedItemIds, {
    List<String>? suggestedCategories,
    Season? suggestedSeason,
  }) async {
    if (selectedItemIds.isEmpty) return 'New Outfit';

    try {
      final items = <ClothingItem>[];
      for (final itemId in selectedItemIds) {
        final item = await _clothingRepository.getClothingItemById(itemId);
        if (item != null) items.add(item);
      }

      return _generateOutfitName(items, suggestedCategories, suggestedSeason);
    } catch (e) {
      return 'New Outfit';
    }
  }

  /// Check for potential style conflicts and suggest fixes
  Future<List<StyleConflict>> detectStyleConflicts(List<String> selectedItemIds) async {
    if (selectedItemIds.length < 2) return [];

    try {
      final items = <ClothingItem>[];
      for (final itemId in selectedItemIds) {
        final item = await _clothingRepository.getClothingItemById(itemId);
        if (item != null) items.add(item);
      }

      return _analyzeStyleConflicts(items);
    } catch (e) {
      return [];
    }
  }

  /// Suggest missing item types for a complete outfit
  Future<List<ClothingType>> suggestMissingTypes(List<String> selectedItemIds) async {
    if (selectedItemIds.isEmpty) return [ClothingType.top, ClothingType.bottom, ClothingType.shoes];

    try {
      final items = <ClothingItem>[];
      for (final itemId in selectedItemIds) {
        final item = await _clothingRepository.getClothingItemById(itemId);
        if (item != null) items.add(item);
      }

      return _identifyMissingTypes(items);
    } catch (e) {
      return [];
    }
  }

  /// Get contextual suggestions based on time and historical data
  Future<ContextualSuggestions> getContextualSuggestions({
    List<String>? selectedItemIds,
    DateTime? targetDate,
  }) async {
    final now = targetDate ?? DateTime.now();
    final items = <ClothingItem>[];
    
    if (selectedItemIds != null) {
      for (final itemId in selectedItemIds) {
        final item = await _clothingRepository.getClothingItemById(itemId);
        if (item != null) items.add(item);
      }
    }

    return ContextualSuggestions(
      suggestedSeason: _getSeasonFromDate(now),
      suggestedWeatherRanges: await _getWeatherForDate(now),
      suggestedCategories: await _getCategoriesForTimeContext(now, items),
      timeOfDayRecommendations: _getTimeOfDayRecommendations(now),
      dayOfWeekRecommendations: _getDayOfWeekRecommendations(now),
    );
  }

  /// Analyze items to suggest categories
  List<String> _analyzeItemsForCategories(List<ClothingItem> items) {
    final categoryScores = <String, double>{};
    final categoryOccurrences = <String, int>{};

    // Count category occurrences and calculate preference scores
    for (final item in items) {
      for (final category in item.categories) {
        categoryOccurrences[category] = (categoryOccurrences[category] ?? 0) + 1;
        
        // Weight by item's wear count (popular items suggest popular categories)
        final weight = 1.0 + (item.wearCount * 0.1);
        categoryScores[category] = (categoryScores[category] ?? 0.0) + weight;
      }
    }

    // Infer categories from item types and properties
    final inferredCategories = _inferCategoriesFromItems(items);
    for (final category in inferredCategories) {
      categoryScores[category] = (categoryScores[category] ?? 0.0) + 0.5;
    }

    // Sort by score and return top categories
    final sortedCategories = categoryScores.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return sortedCategories
        .take(3)
        .map((entry) => entry.key)
        .toList();
  }

  /// Analyze items to suggest season
  Season? _analyzeItemsForSeason(List<ClothingItem> items) {
    final seasonVotes = <Season, int>{};

    for (final item in items) {
      for (final season in item.seasons) {
        if (season != Season.allSeason) {
          seasonVotes[season] = (seasonVotes[season] ?? 0) + 1;
        }
      }

      // Infer season from weather ranges
      for (final weatherRange in item.weatherRanges) {
        final inferredSeason = _inferSeasonFromWeather(weatherRange);
        if (inferredSeason != null) {
          seasonVotes[inferredSeason] = (seasonVotes[inferredSeason] ?? 0) + 1;
        }
      }
    }

    // Consider current date as tie-breaker
    final currentSeason = _getSeasonFromDate(DateTime.now());
    if (seasonVotes.isEmpty) {
      return currentSeason;
    }

    // Return most voted season, or current season if tied
    final sortedSeasons = seasonVotes.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    if (sortedSeasons.length > 1 && 
        sortedSeasons[0].value == sortedSeasons[1].value) {
      return currentSeason;
    }

    return sortedSeasons.first.key;
  }

  /// Analyze items to suggest weather ranges
  List<WeatherRange> _analyzeItemsForWeather(List<ClothingItem> items) {
    final weatherCounts = <WeatherRange, int>{};

    for (final item in items) {
      for (final weather in item.weatherRanges) {
        weatherCounts[weather] = (weatherCounts[weather] ?? 0) + 1;
      }
    }

    // Infer from item types
    for (final item in items) {
      final inferredWeather = _inferWeatherFromItemType(item);
      for (final weather in inferredWeather) {
        weatherCounts[weather] = (weatherCounts[weather] ?? 0) + 1;
      }
    }

    return weatherCounts.entries
        .where((entry) => entry.value > 0)
        .map((entry) => entry.key)
        .toList();
  }

  /// Generate a smart outfit name
  String _generateOutfitName(
    List<ClothingItem> items,
    List<String>? categories,
    Season? season,
  ) {
    final now = DateTime.now();
    
    // Use categories as base
    if (categories != null && categories.isNotEmpty) {
      final primaryCategory = categories.first;
      
      // Add time context
      final timeContext = _getTimeContext(now);
      if (timeContext.isNotEmpty) {
        return '$timeContext $primaryCategory';
      }
      
      // Add season context
      if (season != null && season != Season.allSeason) {
        return '${_capitalizeFirst(season.toString().split('.').last)} $primaryCategory';
      }
      
      return _capitalizeFirst(primaryCategory);
    }

    // Fallback to item-based naming
    final types = items.map((item) => item.type).toSet();
    if (types.contains(ClothingType.dress)) {
      return '${_getTimeContext(now)} Dress Look';
    }
    if (types.contains(ClothingType.activewear)) {
      return 'Workout Outfit';
    }

    // Generic names based on time
    return '${_getTimeContext(now)} Outfit';
  }

  /// Check for style conflicts
  List<StyleConflict> _analyzeStyleConflicts(List<ClothingItem> items) {
    final conflicts = <StyleConflict>[];

    // Check metallic elements conflicts
    final metallicElements = items
        .map((item) => item.metallicElements)
        .where((element) => element != MetallicElements.none)
        .toSet();

    if (metallicElements.length > 1) {
      conflicts.add(StyleConflict(
        type: ConflictType.metallicMismatch,
        description: 'Mixing different metallic elements (${metallicElements.join(', ')})',
        affectedItems: items.where((item) => 
          metallicElements.contains(item.metallicElements)).map((item) => item.id).toList(),
        suggestion: 'Choose items with matching metallic elements or remove metallic accents',
      ));
    }

    // Check formality conflicts
    final formalItems = items.where((item) => 
      item.categories.any((cat) => 
        cat.toLowerCase().contains('formal') || 
        cat.toLowerCase().contains('elegant'))).toList();
    
    final casualItems = items.where((item) => 
      item.categories.any((cat) => 
        cat.toLowerCase().contains('casual') || 
        cat.toLowerCase().contains('comfortable'))).toList();

    if (formalItems.isNotEmpty && casualItems.isNotEmpty) {
      conflicts.add(StyleConflict(
        type: ConflictType.formalityMismatch,
        description: 'Mixing formal and casual items',
        affectedItems: [...formalItems, ...casualItems].map((item) => item.id).toList(),
        suggestion: 'Choose either formal or casual items for better style consistency',
      ));
    }

    // Check color conflicts (simplified)
    final colors = items.expand((item) => item.colors).toList();
    if (colors.length > 5) {
      conflicts.add(StyleConflict(
        type: ConflictType.colorOverload,
        description: 'Too many different colors (${colors.length} colors)',
        affectedItems: items.map((item) => item.id).toList(),
        suggestion: 'Consider limiting to 3-4 colors for a more cohesive look',
      ));
    }

    return conflicts;
  }

  /// Identify missing item types for completeness
  List<ClothingType> _identifyMissingTypes(List<ClothingItem> items) {
    final presentTypes = items.map((item) => item.type).toSet();
    final missing = <ClothingType>[];

    // Essential types
    if (!presentTypes.contains(ClothingType.top) &&
        !presentTypes.contains(ClothingType.dress)) {
      missing.add(ClothingType.top);
    }

    if (!presentTypes.contains(ClothingType.bottom) &&
        !presentTypes.contains(ClothingType.dress)) {
      missing.add(ClothingType.bottom);
    }

    if (!presentTypes.contains(ClothingType.shoes)) {
      missing.add(ClothingType.shoes);
    }

    // Contextual suggestions
    final currentSeason = _getSeasonFromDate(DateTime.now());
    if (currentSeason == Season.winter && !presentTypes.contains(ClothingType.outerwear)) {
      missing.add(ClothingType.outerwear);
    }

    return missing;
  }

  /// Helper methods
  List<String> _inferCategoriesFromItems(List<ClothingItem> items) {
    final inferred = <String>[];

    // Check for workout items
    if (items.any((item) => item.type == ClothingType.activewear)) {
      inferred.add('gym');
    }

    // Check for formal items based on categories
    if (items.any((item) => item.categories.any((cat) => cat.toLowerCase().contains('formal')))) {
      inferred.add('formal');
      inferred.add('work');
    }

    // Check for casual combination
    final hasTop = items.any((item) => item.type == ClothingType.top);
    final hasBottom = items.any((item) => item.type == ClothingType.bottom);
    if (hasTop && hasBottom) {
      inferred.add('casual');
    }

    // Check for dress
    if (items.any((item) => item.type == ClothingType.dress)) {
      inferred.add('elegant');
    }

    return inferred;
  }

  Season? _inferSeasonFromWeather(WeatherRange weather) {
    switch (weather) {
      case WeatherRange.veryCold:
      case WeatherRange.cold:
        return Season.winter;
      case WeatherRange.cool:
        return Season.autumn;
      case WeatherRange.warm:
        return Season.spring;
      case WeatherRange.hot:
      case WeatherRange.veryHot:
        return Season.summer;
    }
  }

  List<WeatherRange> _inferWeatherFromItemType(ClothingItem item) {
    switch (item.type) {
      case ClothingType.outerwear:
        return [WeatherRange.cold, WeatherRange.cool];
      case ClothingType.swimwear:
        return [WeatherRange.hot, WeatherRange.veryHot];
      case ClothingType.activewear:
        return [WeatherRange.warm, WeatherRange.hot];
      default:
        return [];
    }
  }

  Season _getSeasonFromDate(DateTime date) {
    final month = date.month;
    if (month >= 3 && month <= 5) return Season.spring;
    if (month >= 6 && month <= 8) return Season.summer;
    if (month >= 9 && month <= 11) return Season.autumn;
    return Season.winter;
  }

  Future<List<WeatherRange>> _getWeatherForDate(DateTime date) async {
    // This would integrate with weather API in production
    final season = _getSeasonFromDate(date);
    switch (season) {
      case Season.winter:
        return [WeatherRange.cold, WeatherRange.veryCold];
      case Season.spring:
        return [WeatherRange.cool, WeatherRange.warm];
      case Season.summer:
        return [WeatherRange.warm, WeatherRange.hot];
      case Season.autumn:
        return [WeatherRange.cool, WeatherRange.warm];
      case Season.allSeason:
        return [WeatherRange.warm];
    }
  }

  Future<List<String>> _getCategoriesForTimeContext(DateTime date, List<ClothingItem> items) async {
    final categories = <String>[];
    
    // Time-based suggestions
    final hour = date.hour;
    if (hour >= 9 && hour <= 17) {
      categories.add('work');
    } else if (hour >= 18) {
      categories.add('evening');
    }

    // Day-based suggestions
    if (date.weekday <= 5) {
      categories.add('professional');
    } else {
      categories.add('casual');
      categories.add('weekend');
    }

    return categories;
  }

  String _getTimeContext(DateTime date) {
    final hour = date.hour;
    if (hour < 6) return 'Late Night';
    if (hour < 12) return 'Morning';
    if (hour < 17) return 'Afternoon';
    if (hour < 21) return 'Evening';
    return 'Night';
  }

  List<String> _getTimeOfDayRecommendations(DateTime date) {
    final hour = date.hour;
    if (hour >= 6 && hour < 12) {
      return ['comfortable', 'casual', 'morning'];
    } else if (hour >= 12 && hour < 17) {
      return ['professional', 'polished'];
    } else if (hour >= 17 && hour < 22) {
      return ['elegant', 'evening', 'social'];
    } else {
      return ['comfortable', 'casual'];
    }
  }

  List<String> _getDayOfWeekRecommendations(DateTime date) {
    if (date.weekday <= 5) {
      return ['work', 'professional', 'office'];
    } else {
      return ['casual', 'weekend', 'relaxed'];
    }
  }

  String _capitalizeFirst(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }
}

/// Style conflict detection
class StyleConflict {
  final ConflictType type;
  final String description;
  final List<String> affectedItems;
  final String suggestion;

  StyleConflict({
    required this.type,
    required this.description,
    required this.affectedItems,
    required this.suggestion,
  });
}

enum ConflictType {
  metallicMismatch,
  formalityMismatch,
  colorOverload,
  seasonMismatch,
  weatherMismatch,
}

/// Contextual suggestions
class ContextualSuggestions {
  final Season suggestedSeason;
  final List<WeatherRange> suggestedWeatherRanges;
  final List<String> suggestedCategories;
  final List<String> timeOfDayRecommendations;
  final List<String> dayOfWeekRecommendations;

  ContextualSuggestions({
    required this.suggestedSeason,
    required this.suggestedWeatherRanges,
    required this.suggestedCategories,
    required this.timeOfDayRecommendations,
    required this.dayOfWeekRecommendations,
  });
}