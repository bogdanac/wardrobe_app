import 'dart:math';
import '../../domain/entities/clothing_item.dart';
import '../../domain/entities/outfit.dart';
import '../../domain/repositories/clothing_repository.dart';
import '../services/ml_feedback_service.dart';
// ignore: unused_import
import '../services/context_awareness_service.dart';

/// Service for generating outfit variations with smart item substitutions
class OutfitVariationService {
  final ClothingRepository _clothingRepository;
  final MLFeedbackService _mlFeedbackService;
  final Random _random = Random();

  OutfitVariationService(
    this._clothingRepository,
    this._mlFeedbackService,
    );

  /// Generate outfit variations by substituting specific item types
  Future<List<Outfit>> generateVariations({
    required Outfit baseOutfit,
    ClothingType? substituteType,
    int maxVariations = 5,
    bool maintainStyle = true,
  }) async {
    try {
      final allItems = await _clothingRepository.getAllClothingItems();
      final baseItems = await _getOutfitItems(baseOutfit);
      
      if (baseItems.isEmpty) return [];

      final variations = <Outfit>[];
      final usedCombinations = <Set<String>>{baseOutfit.clothingItemIds.toSet()};

      // Get items available for substitution
      final substitutionCandidates = substituteType != null
          ? allItems.where((item) => item.type == substituteType).toList()
          : allItems;

      // Generate variations
      for (int i = 0; i < maxVariations * 3 && variations.length < maxVariations; i++) {
        final variation = await _createVariation(
          baseOutfit,
          baseItems,
          substitutionCandidates,
          substituteType,
          maintainStyle,
          usedCombinations,
        );

        if (variation != null) {
          variations.add(variation);
          usedCombinations.add(variation.clothingItemIds.toSet());
        }
      }

      return variations;
    } catch (e) {
      throw Exception('Failed to generate outfit variations: $e');
    }
  }

  /// Generate specific type variations (e.g., "try different tops")
  Future<List<Outfit>> generateTypeVariations({
    required Outfit baseOutfit,
    required ClothingType type,
    int count = 5,
  }) async {
    return generateVariations(
      baseOutfit: baseOutfit,
      substituteType: type,
      maxVariations: count,
      maintainStyle: true,
    );
  }

  /// Generate style variations (different aesthetics)
  Future<List<Outfit>> generateStyleVariations({
    required Outfit baseOutfit,
    required String targetStyle, // e.g., "formal", "casual", "edgy"
    int count = 3,
  }) async {
    try {
      final baseItems = await _getOutfitItems(baseOutfit);
      final allItems = await _clothingRepository.getAllClothingItems();
      
      // Filter items that match the target style
      final styleItems = allItems.where((item) =>
        item.categories.any((category) =>
          category.toLowerCase().contains(targetStyle.toLowerCase()))).toList();

      if (styleItems.isEmpty) return [];

      final variations = <Outfit>[];
      final usedCombinations = <Set<String>>{};

      for (int i = 0; i < count * 2 && variations.length < count; i++) {
        final variation = await _createStyleVariation(
          baseOutfit,
          baseItems,
          styleItems,
          targetStyle,
          usedCombinations,
        );

        if (variation != null) {
          variations.add(variation);
          usedCombinations.add(variation.clothingItemIds.toSet());
        }
      }

      return variations;
    } catch (e) {
      throw Exception('Failed to generate style variations: $e');
    }
  }

  /// Generate color variations
  Future<List<Outfit>> generateColorVariations({
    required Outfit baseOutfit,
    List<String>? targetColors,
    int count = 4,
  }) async {
    try {
      final baseItems = await _getOutfitItems(baseOutfit);
      final allItems = await _clothingRepository.getAllClothingItems();
      
      final variations = <Outfit>[];
      final usedCombinations = <Set<String>>{};

      for (int i = 0; i < count * 2 && variations.length < count; i++) {
        final variation = await _createColorVariation(
          baseOutfit,
          baseItems,
          allItems,
          targetColors,
          usedCombinations,
        );

        if (variation != null) {
          variations.add(variation);
          usedCombinations.add(variation.clothingItemIds.toSet());
        }
      }

      return variations;
    } catch (e) {
      throw Exception('Failed to generate color variations: $e');
    }
  }

  /// Create a single variation by substituting items
  Future<Outfit?> _createVariation(
    Outfit baseOutfit,
    List<ClothingItem> baseItems,
    List<ClothingItem> substitutionCandidates,
    ClothingType? substituteType,
    bool maintainStyle,
    Set<Set<String>> usedCombinations,
  ) async {
    final variationItems = List<ClothingItem>.from(baseItems);
    bool madeSubstitution = false;

    // Determine which item(s) to substitute
    final itemsToSubstitute = substituteType != null
        ? baseItems.where((item) => item.type == substituteType).toList()
        : [baseItems[_random.nextInt(baseItems.length)]];

    for (final itemToReplace in itemsToSubstitute) {
      // Find suitable replacements
      final replacements = substitutionCandidates.where((candidate) =>
        candidate.type == itemToReplace.type &&
        candidate.id != itemToReplace.id &&
        (!maintainStyle || _isStyleCompatible(candidate, itemToReplace))
      ).toList();

      if (replacements.isNotEmpty) {
        // Score potential replacements
        final scoredReplacements = <ScoredReplacement>[];
        for (final replacement in replacements) {
          final score = await _scoreReplacement(
            replacement,
            itemToReplace,
            variationItems.where((item) => item.id != itemToReplace.id).toList(),
            maintainStyle,
          );
          scoredReplacements.add(ScoredReplacement(replacement, score));
        }

        scoredReplacements.sort((a, b) => b.score.compareTo(a.score));

        // Select replacement with some randomness for variety
        final selectedReplacement = _selectWithVariety(scoredReplacements);
        if (selectedReplacement != null) {
          final index = variationItems.indexWhere((item) => item.id == itemToReplace.id);
          if (index != -1) {
            variationItems[index] = selectedReplacement;
            madeSubstitution = true;
          }
        }
      }
    }

    if (!madeSubstitution) return null;

    // Check if this combination has been used
    final combination = variationItems.map((item) => item.id).toSet();
    if (usedCombinations.contains(combination)) return null;

    return _createOutfitFromItems(baseOutfit, variationItems);
  }

  /// Create a style-specific variation
  Future<Outfit?> _createStyleVariation(
    Outfit baseOutfit,
    List<ClothingItem> baseItems,
    List<ClothingItem> styleItems,
    String targetStyle,
    Set<Set<String>> usedCombinations,
  ) async {
    final variationItems = <ClothingItem>[];
    final requiredTypes = _getRequiredTypes();

    // Try to build outfit with style-matching items
    for (final type in requiredTypes) {
      final typeStyleItems = styleItems.where((item) => item.type == type).toList();
      final baseTypeItem = baseItems.where((item) => item.type == type).firstOrNull;

      if (typeStyleItems.isNotEmpty) {
        // Score style items for this type
        final scoredItems = <ScoredReplacement>[];
        for (final item in typeStyleItems) {
          final score = await _scoreStyleMatch(item, targetStyle, variationItems);
          scoredItems.add(ScoredReplacement(item, score));
        }

        scoredItems.sort((a, b) => b.score.compareTo(a.score));
        final selected = scoredItems.first.item;
        variationItems.add(selected);
      } else if (baseTypeItem != null) {
        // Keep original if no style match available
        variationItems.add(baseTypeItem);
      }
    }

    if (variationItems.length < 2) return null;

    final combination = variationItems.map((item) => item.id).toSet();
    if (usedCombinations.contains(combination)) return null;

    return _createOutfitFromItems(baseOutfit, variationItems);
  }

  /// Create a color-focused variation
  Future<Outfit?> _createColorVariation(
    Outfit baseOutfit,
    List<ClothingItem> baseItems,
    List<ClothingItem> allItems,
    List<String>? targetColors,
    Set<Set<String>> usedCombinations,
  ) async {
    final variationItems = List<ClothingItem>.from(baseItems);
    bool madeColorChange = false;

    for (int i = 0; i < variationItems.length; i++) {
      final item = variationItems[i];
      
      // Find items of same type with different colors
      final colorAlternatives = allItems.where((alt) =>
        alt.type == item.type &&
        alt.id != item.id &&
        (targetColors == null || alt.colors.any((color) => targetColors.contains(color)))
      ).toList();

      if (colorAlternatives.isNotEmpty && _random.nextBool()) {
        final scored = <ScoredReplacement>[];
        for (final alt in colorAlternatives) {
          final score = await _scoreColorHarmony(alt, variationItems);
          scored.add(ScoredReplacement(alt, score));
        }

        scored.sort((a, b) => b.score.compareTo(a.score));
        if (scored.isNotEmpty) {
          variationItems[i] = scored.first.item;
          madeColorChange = true;
        }
      }
    }

    if (!madeColorChange) return null;

    final combination = variationItems.map((item) => item.id).toSet();
    if (usedCombinations.contains(combination)) return null;

    return _createOutfitFromItems(baseOutfit, variationItems);
  }

  /// Score a replacement item
  Future<double> _scoreReplacement(
    ClothingItem replacement,
    ClothingItem original,
    List<ClothingItem> otherItems,
    bool maintainStyle,
  ) async {
    double score = 0.5;

    // User preference score
    final userPreferences = await _mlFeedbackService.getUserPreferences();
    if (userPreferences != null) {
      score += _calculateUserPreferenceScore(replacement, userPreferences) * 0.3;
    }

    // Color harmony with other items
    score += _calculateColorHarmonyScore(replacement, otherItems) * 0.25;

    // Style consistency (if required)
    if (maintainStyle) {
      score += _calculateStyleConsistencyScore(replacement, [original]) * 0.25;
    }

    // Freshness (prefer less worn items)
    score += _calculateFreshnessScore(replacement) * 0.2;

    return score.clamp(0.0, 1.0);
  }

  /// Score style match for style variations
  Future<double> _scoreStyleMatch(
    ClothingItem item,
    String targetStyle,
    List<ClothingItem> existingItems,
  ) async {
    double score = 0.5;

    // Direct style category match
    if (item.categories.any((category) => 
        category.toLowerCase().contains(targetStyle.toLowerCase()))) {
      score += 0.4;
    }

    // Color harmony with existing items
    if (existingItems.isNotEmpty) {
      score += _calculateColorHarmonyScore(item, existingItems) * 0.3;
    }

    // User preference alignment
    final userPreferences = await _mlFeedbackService.getUserPreferences();
    if (userPreferences != null) {
      score += _calculateUserPreferenceScore(item, userPreferences) * 0.3;
    }

    return score.clamp(0.0, 1.0);
  }

  /// Score color harmony for color variations
  Future<double> _scoreColorHarmony(
    ClothingItem item,
    List<ClothingItem> outfitItems,
  ) async {
    if (outfitItems.isEmpty) return 0.5;

    double totalHarmony = 0;
    int comparisons = 0;

    for (final outfitItem in outfitItems) {
      if (outfitItem.id == item.id) continue;
      
      for (final itemColor in item.colors) {
        for (final outfitColor in outfitItem.colors) {
          totalHarmony += _calculateColorCompatibility(itemColor, outfitColor);
          comparisons++;
        }
      }
    }

    return comparisons > 0 ? (totalHarmony / comparisons).clamp(0.0, 1.0) : 0.5;
  }

  /// Helper methods
  Future<List<ClothingItem>> _getOutfitItems(Outfit outfit) async {
    final items = <ClothingItem>[];
    for (final itemId in outfit.clothingItemIds) {
      final item = await _clothingRepository.getClothingItemById(itemId);
      if (item != null) items.add(item);
    }
    return items;
  }

  bool _isStyleCompatible(ClothingItem item1, ClothingItem item2) {
    // Check for shared style categories
    final sharedCategories = item1.categories.toSet()
        .intersection(item2.categories.toSet());
    return sharedCategories.isNotEmpty;
  }

  ClothingItem? _selectWithVariety(List<ScoredReplacement> scoredItems) {
    if (scoredItems.isEmpty) return null;
    
    // Weight selection towards better scores but allow variety
    final weights = [0.5, 0.3, 0.15, 0.05];
    final random = _random.nextDouble();
    double cumulative = 0;

    for (int i = 0; i < scoredItems.length && i < weights.length; i++) {
      cumulative += weights[i];
      if (random <= cumulative) {
        return scoredItems[i].item;
      }
    }

    return scoredItems.first.item;
  }

  List<ClothingType> _getRequiredTypes() {
    return [ClothingType.top, ClothingType.bottom, ClothingType.shoes];
  }

  Outfit _createOutfitFromItems(Outfit baseOutfit, List<ClothingItem> items) {
    return baseOutfit.copyWith(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: '${baseOutfit.name} - Variation',
      clothingItemIds: items.map((item) => item.id).toList(),
      updatedAt: DateTime.now(),
      tags: [...baseOutfit.tags, 'variation'],
    );
  }

  double _calculateColorHarmonyScore(ClothingItem item, List<ClothingItem> otherItems) {
    if (otherItems.isEmpty || item.colors.isEmpty) return 0.5;

    double totalScore = 0;
    int comparisons = 0;

    for (final otherItem in otherItems) {
      for (final itemColor in item.colors) {
        for (final otherColor in otherItem.colors) {
          totalScore += _calculateColorCompatibility(itemColor, otherColor);
          comparisons++;
        }
      }
    }

    return comparisons > 0 ? (totalScore / comparisons) : 0.5;
  }

  double _calculateStyleConsistencyScore(ClothingItem item, List<ClothingItem> otherItems) {
    if (otherItems.isEmpty) return 0.5;

    double score = 0;
    for (final otherItem in otherItems) {
      // Metallic consistency
      if (item.metallicElements == otherItem.metallicElements ||
          item.metallicElements == MetallicElements.none ||
          otherItem.metallicElements == MetallicElements.none) {
        score += 0.3;
      }

      // Category overlap
      final overlap = item.categories.toSet().intersection(otherItem.categories.toSet());
      score += overlap.length * 0.2;
    }

    return (score / otherItems.length).clamp(0.0, 1.0);
  }

  double _calculateFreshnessScore(ClothingItem item) {
    if (item.lastWornDate == null) return 1.0;
    
    final daysSinceWorn = DateTime.now().difference(item.lastWornDate!).inDays;
    if (daysSinceWorn > 14) return 0.9;
    if (daysSinceWorn > 7) return 0.7;
    if (daysSinceWorn > 3) return 0.5;
    return 0.3;
  }

  double _calculateUserPreferenceScore(ClothingItem item, dynamic userPreferences) {
    // Simplified version - would use actual UserPreferences object
    double score = 0.5;

    // This would be implemented based on the actual UserPreferences structure
    // For now, return base score
    return score;
  }

  double _calculateColorCompatibility(String color1, String color2) {
    // Simplified color compatibility - would use more sophisticated color theory
    if (color1 == color2) return 1.0;
    
    // Check for neutral colors
    const neutrals = ['#FFFFFF', '#000000', '#808080', '#C0C0C0'];
    if (neutrals.contains(color1.toUpperCase()) || neutrals.contains(color2.toUpperCase())) {
      return 0.8;
    }

    return 0.5; // Base compatibility score
  }
}

/// Scored replacement item
class ScoredReplacement {
  final ClothingItem item;
  final double score;

  ScoredReplacement(this.item, this.score);
}

/// Extension for nullable list operations
extension ListExtensions<T> on List<T> {
  T? get firstOrNull => isEmpty ? null : first;
}