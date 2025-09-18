import 'dart:math';
import 'package:flutter/material.dart';
import '../../domain/entities/clothing_item.dart';
import '../../domain/entities/outfit.dart';
import '../../domain/repositories/clothing_repository.dart';
import '../../domain/repositories/outfit_repository.dart';
import '../themes/app_colors.dart';
import '../errors/app_exceptions.dart';

/// ML-powered outfit recommendation engine
class MLOutfitRecommender {
  final ClothingRepository _clothingRepository;
  final OutfitRepository _outfitRepository;
  final Random _random = Random();

  // Learning weights (would be trained from user feedback in production)
  static const Map<String, double> _baseWeights = {
    'color_harmony': 0.25,
    'season_match': 0.20,
    'style_consistency': 0.20,
    'user_preference': 0.15,
    'freshness': 0.10,
    'weather_appropriateness': 0.10,
  };

  // User preference learning (simplified - would be more complex in production)
  final Map<String, double> _userWeights = Map.from(_baseWeights);
  final Map<String, int> _categoryPreferences = {};
  final Map<String, int> _colorPreferences = {};
  final Map<ClothingType, double> _typePreferences = {};

  MLOutfitRecommender(this._clothingRepository, this._outfitRepository) {
    _initializePreferences();
  }

  /// Initialize user preferences from historical data
  Future<void> _initializePreferences() async {
    try {
      final outfits = await _outfitRepository.getAllOutfits();
      final items = await _clothingRepository.getAllClothingItems();
      
      _analyzeUserPreferences(outfits, items);
    } catch (e) {
      // Continue with default preferences if analysis fails
    }
  }

  /// Analyze user preferences from existing outfits and item usage
  void _analyzeUserPreferences(List<Outfit> outfits, List<ClothingItem> items) {
    // Analyze category preferences
    for (final item in items) {
      for (final category in item.categories) {
        _categoryPreferences[category] = 
            (_categoryPreferences[category] ?? 0) + item.wearCount;
      }
    }

    // Analyze color preferences
    for (final item in items) {
      for (final color in item.colors) {
        final colorName = AppColors.getColorName(_hexToColor(color));
        _colorPreferences[colorName] = 
            (_colorPreferences[colorName] ?? 0) + item.wearCount;
      }
    }

    // Analyze type preferences
    for (final item in items) {
      _typePreferences[item.type] = 
          (_typePreferences[item.type] ?? 0) + item.wearCount.toDouble();
    }

    // Normalize preferences
    _normalizePreferences();
  }

  /// Normalize preference scores to 0-1 range
  void _normalizePreferences() {
    // Normalize category preferences
    if (_categoryPreferences.isNotEmpty) {
      final maxCat = _categoryPreferences.values.reduce(max);
      if (maxCat > 0) {
        for (final key in _categoryPreferences.keys) {
          _categoryPreferences[key] = (_categoryPreferences[key]! / maxCat * 100).round();
        }
      }
    }

    // Normalize color preferences
    if (_colorPreferences.isNotEmpty) {
      final maxColor = _colorPreferences.values.reduce(max);
      if (maxColor > 0) {
        for (final key in _colorPreferences.keys) {
          _colorPreferences[key] = (_colorPreferences[key]! / maxColor * 100).round();
        }
      }
    }

    // Normalize type preferences
    if (_typePreferences.isNotEmpty) {
      final maxType = _typePreferences.values.reduce(max);
      if (maxType > 0) {
        for (final key in _typePreferences.keys) {
          _typePreferences[key] = _typePreferences[key]! / maxType;
        }
      }
    }
  }

  /// Generate ML-powered outfit recommendations
  Future<List<Outfit>> generateRecommendations({
    required int count,
    Season? season,
    List<WeatherRange>? weatherRanges,
    String? occasion,
    List<String>? preferredColors,
    double? temperature,
    String? mood,
    List<ClothingType>? preferredTypes,
  }) async {
    try {
      final allItems = await _clothingRepository.getAllClothingItems();
      if (allItems.isEmpty) {
        throw const OutfitGenerationException('No items in wardrobe for recommendations');
      }

      final context = RecommendationContext(
        season: season,
        weatherRanges: weatherRanges,
        occasion: occasion,
        preferredColors: preferredColors,
        temperature: temperature,
        mood: mood,
        preferredTypes: preferredTypes,
      );

      final outfits = <Outfit>[];
      final usedCombinations = <Set<String>>{};

      // Generate more candidates than requested for better selection
      final candidates = <ScoredOutfit>[];

      for (int attempt = 0; attempt < count * 5 && candidates.length < count * 2; attempt++) {
        final outfit = await _generateSingleRecommendation(allItems, context, usedCombinations);
        if (outfit != null) {
          final score = await _scoreOutfit(outfit, context, allItems);
          candidates.add(ScoredOutfit(outfit, score));
          usedCombinations.add(outfit.clothingItemIds.toSet());
        }
      }

      // Sort by score and select best ones
      candidates.sort((a, b) => b.score.compareTo(a.score));
      
      // Add diversity - don't just pick the highest scoring ones
      outfits.addAll(_selectDiverseOutfits(candidates, count));

      return outfits;
    } catch (e) {
      if (e is OutfitGenerationException) rethrow;
      throw OutfitGenerationException(
        'ML recommendation failed: ${e.toString()}',
        originalError: e,
      );
    }
  }

  /// Generate a single outfit recommendation
  Future<Outfit?> _generateSingleRecommendation(
    List<ClothingItem> items,
    RecommendationContext context,
    Set<Set<String>> usedCombinations,
  ) async {
    final outfitItems = <ClothingItem>[];
    final availableItems = List<ClothingItem>.from(items);

    // Get required types based on context
    final requiredTypes = _getRequiredTypes(context);
    final optionalTypes = _getOptionalTypes(context);

    // Select items for each required type
    for (final type in requiredTypes) {
      final typeItems = availableItems.where((item) => item.type == type).toList();
      if (typeItems.isEmpty) continue;

      final selectedItem = await _selectBestItemForType(
        typeItems,
        outfitItems,
        context,
        type,
      );

      if (selectedItem != null) {
        outfitItems.add(selectedItem);
        availableItems.remove(selectedItem);
      }
    }

    // Add optional items if they improve the outfit
    for (final type in optionalTypes) {
      if (outfitItems.any((item) => item.type == type)) continue;
      
      final typeItems = availableItems.where((item) => item.type == type).toList();
      if (typeItems.isEmpty) continue;

      final selectedItem = await _selectBestItemForType(
        typeItems,
        outfitItems,
        context,
        type,
      );

      if (selectedItem != null) {
        final testOutfit = [...outfitItems, selectedItem];
        final currentScore = await _scoreOutfit(
          _createOutfitFromItems(testOutfit),
          context,
          items,
        );
        final baseScore = await _scoreOutfit(
          _createOutfitFromItems(outfitItems),
          context,
          items,
        );

        if (currentScore > baseScore * 1.05) { // Only add if it significantly improves
          outfitItems.add(selectedItem);
          availableItems.remove(selectedItem);
        }
      }
    }

    if (outfitItems.length < 2) return null;

    // Check if this combination was already used
    final combination = outfitItems.map((e) => e.id).toSet();
    if (usedCombinations.contains(combination)) return null;

    return _createOutfitFromItems(outfitItems);
  }

  /// Select the best item for a specific type using ML scoring
  Future<ClothingItem?> _selectBestItemForType(
    List<ClothingItem> items,
    List<ClothingItem> existingItems,
    RecommendationContext context,
    ClothingType type,
  ) async {
    if (items.isEmpty) return null;

    final scoredItems = <ScoredItem>[];

    for (final item in items) {
      final score = await _scoreItemForOutfit(item, existingItems, context);
      scoredItems.add(ScoredItem(item, score));
    }

    scoredItems.sort((a, b) => b.score.compareTo(a.score));

    // Add some randomness to top choices for variety
    final topChoices = scoredItems.take(3).toList();
    if (topChoices.isEmpty) return null;

    // Weight selection towards better scores but allow for variety
    final weights = [0.6, 0.3, 0.1];
    final randomValue = _random.nextDouble();
    double cumulative = 0;

    for (int i = 0; i < topChoices.length; i++) {
      cumulative += weights[i];
      if (randomValue <= cumulative) {
        return topChoices[i].item;
      }
    }

    return topChoices.first.item;
  }

  /// Score an individual item for inclusion in an outfit
  Future<double> _scoreItemForOutfit(
    ClothingItem item,
    List<ClothingItem> existingItems,
    RecommendationContext context,
  ) async {
    double score = 0;

    // Color harmony score
    if (existingItems.isNotEmpty) {
      score += _calculateColorHarmonyScore(item, existingItems) * _userWeights['color_harmony']!;
    } else {
      score += 0.5 * _userWeights['color_harmony']!; // Base score for first item
    }

    // Season appropriateness
    score += _calculateSeasonScore(item, context.season) * _userWeights['season_match']!;

    // Style consistency
    if (existingItems.isNotEmpty) {
      score += _calculateStyleConsistencyScore(item, existingItems) * _userWeights['style_consistency']!;
    }

    // User preferences
    score += _calculateUserPreferenceScore(item) * _userWeights['user_preference']!;

    // Freshness (prefer less worn items)
    score += _calculateFreshnessScore(item) * _userWeights['freshness']!;

    // Weather appropriateness
    if (context.weatherRanges != null) {
      score += _calculateWeatherScore(item, context.weatherRanges!) * _userWeights['weather_appropriateness']!;
    }

    // Context-specific bonuses
    score += _calculateContextualScore(item, context);

    return score.clamp(0.0, 1.0);
  }

  /// Calculate color harmony score between item and existing items
  double _calculateColorHarmonyScore(ClothingItem item, List<ClothingItem> existingItems) {
    if (item.colors.isEmpty) return 0.5;

    double totalScore = 0;
    int comparisons = 0;

    for (final existingItem in existingItems) {
      if (existingItem.colors.isEmpty) continue;

      for (final itemColor in item.colors) {
        for (final existingColor in existingItem.colors) {
          try {
            final color1 = _hexToColor(itemColor);
            final color2 = _hexToColor(existingColor);
            
            if (AppColors.areColorsCompatible(color1, color2)) {
              totalScore += 1.0;
            } else {
              // Check for neutral colors which work with everything
              final color1Name = AppColors.getColorName(color1).toLowerCase();
              final color2Name = AppColors.getColorName(color2).toLowerCase();
              
              if (_isNeutralColor(color1Name) || _isNeutralColor(color2Name)) {
                totalScore += 0.7;
              } else {
                totalScore += 0.2; // Small penalty for incompatible colors
              }
            }
            comparisons++;
          } catch (e) {
            // Skip invalid colors
          }
        }
      }
    }

    return comparisons > 0 ? (totalScore / comparisons).clamp(0.0, 1.0) : 0.5;
  }

  /// Calculate user preference score based on learned preferences
  double _calculateUserPreferenceScore(ClothingItem item) {
    double score = 0.5; // Base score
    int factors = 1;

    // Category preferences
    for (final category in item.categories) {
      if (_categoryPreferences.containsKey(category)) {
        score += _categoryPreferences[category]! / 100.0;
        factors++;
      }
    }

    // Color preferences
    for (final colorHex in item.colors) {
      final colorName = AppColors.getColorName(_hexToColor(colorHex));
      if (_colorPreferences.containsKey(colorName)) {
        score += _colorPreferences[colorName]! / 100.0;
        factors++;
      }
    }

    // Type preferences
    if (_typePreferences.containsKey(item.type)) {
      score += _typePreferences[item.type]!;
      factors++;
    }

    return (score / factors).clamp(0.0, 1.0);
  }

  /// Calculate contextual score based on occasion, mood, etc.
  double _calculateContextualScore(ClothingItem item, RecommendationContext context) {
    double score = 0;

    // Occasion matching
    if (context.occasion != null) {
      final occasion = context.occasion!.toLowerCase();
      
      // Check categories for occasion match
      for (final category in item.categories) {
        if (category.toLowerCase().contains(occasion)) {
          score += 0.3;
        }
      }
      
      // Check tags for occasion match
      for (final tag in item.tags) {
        if (tag.toLowerCase().contains(occasion)) {
          score += 0.2;
        }
      }
      
      // Type-specific occasion bonuses
      if (occasion.contains('formal') || occasion.contains('work')) {
        if (item.type == ClothingType.suit || 
            item.categories.any((c) => c.toLowerCase().contains('formal'))) {
          score += 0.4;
        }
      }
    }

    // Mood matching
    if (context.mood != null) {
      final mood = context.mood!.toLowerCase();
      
      if (mood.contains('bold') || mood.contains('confident')) {
        // Prefer vibrant colors and statement pieces
        for (final colorHex in item.colors) {
          final hsl = HSLColor.fromColor(_hexToColor(colorHex));
          if (hsl.saturation > 0.6) score += 0.2;
        }
      }
      
      if (mood.contains('calm') || mood.contains('minimal')) {
        // Prefer neutral colors and simple pieces
        for (final colorHex in item.colors) {
          final colorName = AppColors.getColorName(_hexToColor(colorHex)).toLowerCase();
          if (_isNeutralColor(colorName)) score += 0.2;
        }
      }
    }

    // Temperature considerations
    if (context.temperature != null) {
      final temp = context.temperature!;
      
      if (temp < 10) { // Cold
        if (item.type == ClothingType.outerwear || 
            item.weatherRanges.contains(WeatherRange.cold) ||
            item.weatherRanges.contains(WeatherRange.veryCold)) {
          score += 0.3;
        }
      } else if (temp > 25) { // Hot
        if (item.type == ClothingType.dress ||
            item.type == ClothingType.swimwear ||
            item.weatherRanges.contains(WeatherRange.hot) ||
            item.weatherRanges.contains(WeatherRange.veryHot)) {
          score += 0.3;
        }
      }
    }

    return score.clamp(0.0, 1.0);
  }

  /// Calculate season appropriateness score
  double _calculateSeasonScore(ClothingItem item, Season? season) {
    if (season == null || item.season == null) return 0.5;
    
    if (item.season == season || item.season == Season.allSeason) {
      return 1.0;
    }
    
    // Adjacent seasons get partial credit
    final adjacentSeasons = _getAdjacentSeasons(season);
    if (adjacentSeasons.contains(item.season)) {
      return 0.7;
    }
    
    return 0.2;
  }

  /// Calculate style consistency score
  double _calculateStyleConsistencyScore(ClothingItem item, List<ClothingItem> existingItems) {
    double score = 0;
    int factors = 0;

    for (final existingItem in existingItems) {
      // Metallic elements consistency
      if (item.metallicElements == existingItem.metallicElements ||
          item.metallicElements == MetallicElements.none ||
          existingItem.metallicElements == MetallicElements.none) {
        score += 0.3;
      } else {
        score -= 0.1; // Penalty for conflicting metallics
      }
      factors++;

      // Category overlap
      final commonCategories = item.categories.toSet()
          .intersection(existingItem.categories.toSet());
      score += commonCategories.length * 0.2;
      factors++;
    }

    return factors > 0 ? (score / factors).clamp(0.0, 1.0) : 0.5;
  }

  /// Calculate freshness score (prefer less worn items)
  double _calculateFreshnessScore(ClothingItem item) {
    if (item.wearCount == 0) return 1.0;
    if (item.lastWornDate == null) return 0.8;
    
    final daysSinceWorn = DateTime.now().difference(item.lastWornDate!).inDays;
    if (daysSinceWorn > 30) return 0.9;
    if (daysSinceWorn > 14) return 0.7;
    if (daysSinceWorn > 7) return 0.5;
    return 0.3;
  }

  /// Calculate weather appropriateness score
  double _calculateWeatherScore(ClothingItem item, List<WeatherRange> weatherRanges) {
    if (item.weatherRanges.isEmpty) return 0.5;
    
    double score = 0;
    for (final weather in weatherRanges) {
      if (item.weatherRanges.contains(weather)) {
        score += 1.0 / weatherRanges.length;
      }
    }
    
    return score.clamp(0.0, 1.0);
  }

  /// Score a complete outfit
  Future<double> _scoreOutfit(
    Outfit outfit,
    RecommendationContext context,
    List<ClothingItem> allItems,
  ) async {
    double score = 0;

    // Base score for completeness
    score += _calculateCompletenessScore(outfit);

    // Get actual ClothingItem objects for detailed analysis
    final items = <ClothingItem>[];
    for (final itemId in outfit.clothingItemIds) {
      try {
        final item = await _clothingRepository.getClothingItemById(itemId);
        if (item != null) items.add(item);
      } catch (e) {
        // Skip items that can't be loaded
      }
    }

    // Overall color harmony
    score += _calculateOutfitColorHarmony(items);

    // Style consistency across all items
    score += _calculateOutfitStyleConsistency(items);

    // Context appropriateness
    score += _calculateOutfitContextScore(outfit, context, items);

    // User preference alignment
    score += _calculateOutfitUserPreferenceScore(items);

    return (score / 5.0).clamp(0.0, 1.0); // Average of 5 factors
  }

  /// Select diverse outfits from candidates
  List<Outfit> _selectDiverseOutfits(List<ScoredOutfit> candidates, int count) {
    if (candidates.length <= count) {
      return candidates.map((c) => c.outfit).toList();
    }

    final selected = <Outfit>[];
    final remaining = List<ScoredOutfit>.from(candidates);

    // Always select the best one
    selected.add(remaining.removeAt(0).outfit);

    // Select remaining based on diversity and score
    while (selected.length < count && remaining.isNotEmpty) {
      double bestDiversityScore = -1;
      int bestIndex = 0;

      for (int i = 0; i < remaining.length; i++) {
        final candidate = remaining[i];
        final diversityScore = _calculateDiversityScore(
          candidate.outfit,
          selected,
        ) * 0.7 + candidate.score * 0.3;

        if (diversityScore > bestDiversityScore) {
          bestDiversityScore = diversityScore;
          bestIndex = i;
        }
      }

      selected.add(remaining.removeAt(bestIndex).outfit);
    }

    return selected;
  }

  /// Calculate how different an outfit is from already selected ones
  double _calculateDiversityScore(Outfit candidate, List<Outfit> selected) {
    if (selected.isEmpty) return 1.0;

    double totalDiversity = 0;

    for (final selectedOutfit in selected) {
      // Simple ID-based diversity - outfits with different items are more diverse
      final candidateIds = candidate.clothingItemIds.toSet();
      final selectedIds = selectedOutfit.clothingItemIds.toSet();

      final overlap = candidateIds.intersection(selectedIds).length;
      final union = candidateIds.union(selectedIds).length;

      final similarity = union > 0 ? overlap / union : 0.0;
      totalDiversity += 1.0 - similarity;
    }

    return totalDiversity / selected.length;
  }

  /// Helper methods
  List<ClothingType> _getRequiredTypes(RecommendationContext context) {
    if (context.occasion?.toLowerCase().contains('formal') == true ||
        context.occasion?.toLowerCase().contains('work') == true) {
      return [ClothingType.top, ClothingType.bottom, ClothingType.shoes];
    }

    if (context.occasion?.toLowerCase().contains('gym') == true ||
        context.occasion?.toLowerCase().contains('sport') == true) {
      return [ClothingType.activewear, ClothingType.shoes];
    }

    return [ClothingType.top, ClothingType.bottom, ClothingType.shoes];
  }

  List<ClothingType> _getOptionalTypes(RecommendationContext context) {
    final optional = [
      ClothingType.accessory,
      ClothingType.jewelry,
      ClothingType.bag,
      ClothingType.hat,
      ClothingType.scarf,
    ];

    if (context.season == Season.winter) {
      optional.addAll([ClothingType.outerwear, ClothingType.gloves]);
    } else if (context.season == Season.summer) {
      optional.add(ClothingType.hat);
    }

    return optional;
  }

  double _calculateCompletenessScore(Outfit outfit) {
    // Basic completeness based on number of items
    // More detailed analysis happens with ClothingItem objects in other methods
    final itemCount = outfit.clothingItemIds.length;

    if (itemCount >= 3) {
      return 1.0; // Assume complete outfit with 3+ items
    } else if (itemCount == 2) {
      return 0.8; // Likely complete (dress + shoes, etc.)
    } else if (itemCount == 1) {
      return 0.6; // Single item outfit
    }

    return 0.0; // No items
  }

  double _calculateOutfitColorHarmony(List<ClothingItem> items) {
    final allColors = items.expand((item) => item.colors).toList();
    if (allColors.length < 2) return 0.8;
    
    int harmoniousCount = 0;
    int totalComparisons = 0;
    
    for (int i = 0; i < allColors.length; i++) {
      for (int j = i + 1; j < allColors.length; j++) {
        try {
          final color1 = _hexToColor(allColors[i]);
          final color2 = _hexToColor(allColors[j]);
          
          if (AppColors.areColorsCompatible(color1, color2)) {
            harmoniousCount++;
          }
          totalComparisons++;
        } catch (e) {
          // Skip invalid colors
        }
      }
    }
    
    return totalComparisons > 0 ? harmoniousCount / totalComparisons : 0.8;
  }

  double _calculateOutfitStyleConsistency(List<ClothingItem> items) {
    // Check metallic elements consistency
    final metallics = items.map((i) => i.metallicElements).where((m) => m != MetallicElements.none).toSet();
    double metallicScore = metallics.length <= 1 ? 1.0 : 0.5;

    // Check category consistency (some overlap is good)
    final allCategories = items.expand((i) => i.categories).toList();
    final uniqueCategories = allCategories.toSet();
    double categoryScore = uniqueCategories.length < allCategories.length ? 0.8 : 0.6;

    return (metallicScore + categoryScore) / 2.0;
  }

  double _calculateOutfitContextScore(Outfit outfit, RecommendationContext context, List<ClothingItem> items) {
    double score = 0.5;

    if (context.season != null && items.isNotEmpty) {
      final seasonAppropriate = items.where((item) =>
        item.season == context.season || item.season == Season.allSeason).length;
      score += (seasonAppropriate / items.length) * 0.3;
    }

    if (context.weatherRanges != null && context.weatherRanges!.isNotEmpty && items.isNotEmpty) {
      final weatherAppropriate = items.where((item) =>
        item.weatherRanges.any((w) => context.weatherRanges!.contains(w))).length;
      score += (weatherAppropriate / items.length) * 0.2;
    }

    return score.clamp(0.0, 1.0);
  }

  double _calculateOutfitUserPreferenceScore(List<ClothingItem> items) {
    double totalScore = 0;
    
    for (final item in items) {
      totalScore += _calculateUserPreferenceScore(item);
    }
    
    return items.isNotEmpty ? totalScore / items.length : 0.5;
  }

  Outfit _createOutfitFromItems(List<ClothingItem> items) {
    return Outfit(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: 'Recommended Outfit',
      clothingItemIds: items.map((item) => item.id).toList(),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      tags: const [],
    );
  }

  Color _hexToColor(String hex) {
    try {
      return Color(int.parse(hex.replaceFirst('#', '0xFF')));
    } catch (e) {
      return Colors.grey;
    }
  }

  bool _isNeutralColor(String colorName) {
    const neutrals = ['black', 'white', 'gray', 'grey', 'beige', 'cream', 'tan', 'brown'];
    return neutrals.any((neutral) => colorName.contains(neutral));
  }

  List<Season> _getAdjacentSeasons(Season season) {
    switch (season) {
      case Season.spring:
        return [Season.summer, Season.winter];
      case Season.summer:
        return [Season.spring, Season.autumn];
      case Season.autumn:
        return [Season.summer, Season.winter];
      case Season.winter:
        return [Season.autumn, Season.spring];
      case Season.allSeason:
        return [];
    }
  }

  /// Update user preferences based on feedback
  void updatePreferences(Outfit outfit, double rating) {
    // This would be more sophisticated in a real ML system
    // For now, simple weight updates based on rating
    final feedback = (rating - 0.5) * 0.1; // -0.05 to 0.05

    // For now, just adjust overall user weights based on outfit feedback
    // More detailed preference learning would require loading ClothingItem objects

    if (rating > 0.7) {
      // Positive feedback - increase relevant weights
      _userWeights['user_preference'] =
          (_userWeights['user_preference']! + feedback * 0.1).clamp(0.0, 1.0);
    } else if (rating < 0.3) {
      // Negative feedback - decrease weights
      _userWeights['user_preference'] =
          (_userWeights['user_preference']! - feedback.abs() * 0.1).clamp(0.0, 1.0);
    }

    // TODO: Implement detailed preference learning by loading ClothingItem objects
    // for (final itemId in outfit.clothingItemIds) {
    //   final item = await _clothingRepository.getClothingItemById(itemId);
    //   if (item != null) {
    //     // Update preferences based on item properties
    //   }
    // }
  }
}

/// Context for outfit recommendations
class RecommendationContext {
  final Season? season;
  final List<WeatherRange>? weatherRanges;
  final String? occasion;
  final List<String>? preferredColors;
  final double? temperature;
  final String? mood;
  final List<ClothingType>? preferredTypes;

  RecommendationContext({
    this.season,
    this.weatherRanges,
    this.occasion,
    this.preferredColors,
    this.temperature,
    this.mood,
    this.preferredTypes,
  });
}

/// Item with ML score
class ScoredItem {
  final ClothingItem item;
  final double score;

  ScoredItem(this.item, this.score);
}

/// Outfit with ML score
class ScoredOutfit {
  final Outfit outfit;
  final double score;

  ScoredOutfit(this.outfit, this.score);
}