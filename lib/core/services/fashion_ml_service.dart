import 'dart:math';
import '../../domain/entities/clothing_item.dart';
import '../../domain/entities/outfit.dart';
import '../../domain/entities/user_feedback.dart';
import 'ml_feedback_service.dart';

class FashionTrend {
  final String name;
  final double popularity;
  final List<String> associatedColors;
  final List<ClothingType> associatedTypes;
  final Season season;
  final Map<String, dynamic> metadata;

  const FashionTrend({
    required this.name,
    required this.popularity,
    required this.associatedColors,
    required this.associatedTypes,
    required this.season,
    required this.metadata,
  });
}

class StyleRecommendation {
  final List<ClothingItem> recommendedItems;
  final double confidenceScore;
  final String reasoning;
  final List<String> styleKeywords;
  final Map<String, double> attributeScores;

  const StyleRecommendation({
    required this.recommendedItems,
    required this.confidenceScore,
    required this.reasoning,
    required this.styleKeywords,
    required this.attributeScores,
  });
}

class CollaborativeUser {
  final String userId;
  final Map<String, double> preferences;
  final List<String> likedOutfits;
  final List<String> likedItems;
  final double similarityScore;

  const CollaborativeUser({
    required this.userId,
    required this.preferences,
    required this.likedOutfits,
    required this.likedItems,
    required this.similarityScore,
  });
}

class FashionMLService {
  final MLFeedbackService _feedbackService;
  final Random _random = Random();

  FashionMLService() 
      : _feedbackService = MLFeedbackService();

  static const List<FashionTrend> _currentTrends = [
    FashionTrend(
      name: 'Minimalist Chic',
      popularity: 0.85,
      associatedColors: ['white', 'black', 'beige', 'gray'],
      associatedTypes: [ClothingType.top, ClothingType.bottom, ClothingType.outerwear],
      season: Season.allSeason,
      metadata: {'keywords': ['clean', 'simple', 'elegant'], 'ageGroups': ['25-35', '35-45']},
    ),
    FashionTrend(
      name: 'Earthy Tones',
      popularity: 0.78,
      associatedColors: ['brown', 'olive', 'rust', 'cream'],
      associatedTypes: [ClothingType.top, ClothingType.outerwear, ClothingType.accessory],
      season: Season.autumn,
      metadata: {'keywords': ['natural', 'warm', 'cozy'], 'ageGroups': ['20-30', '30-40']},
    ),
    FashionTrend(
      name: 'Bold Patterns',
      popularity: 0.65,
      associatedColors: ['red', 'blue', 'yellow', 'green'],
      associatedTypes: [ClothingType.top, ClothingType.bottom, ClothingType.accessory],
      season: Season.spring,
      metadata: {'keywords': ['vibrant', 'expressive', 'fun'], 'ageGroups': ['18-28', '28-35']},
    ),
    FashionTrend(
      name: 'Athleisure',
      popularity: 0.82,
      associatedColors: ['black', 'gray', 'white', 'navy'],
      associatedTypes: [ClothingType.top, ClothingType.bottom, ClothingType.shoes],
      season: Season.allSeason,
      metadata: {'keywords': ['comfortable', 'versatile', 'active'], 'ageGroups': ['20-35', '35-45']},
    ),
    FashionTrend(
      name: 'Vintage Revival',
      popularity: 0.71,
      associatedColors: ['burgundy', 'mustard', 'forest', 'cream'],
      associatedTypes: [ClothingType.top, ClothingType.bottom, ClothingType.outerwear, ClothingType.accessory],
      season: Season.autumn,
      metadata: {'keywords': ['retro', 'timeless', 'unique'], 'ageGroups': ['22-32', '35-45']},
    ),
  ];

  Future<StyleRecommendation> generatePersonalizedRecommendations({
    required List<ClothingItem> userWardrobe,
    Season? targetSeason,
    List<String>? occasionTags,
    int maxRecommendations = 5,
  }) async {
    try {
      final userPreferences = await _feedbackService.getUserPreferences();
      
      if (userPreferences == null) {
        return await _generateTrendBasedRecommendations(
          userWardrobe, targetSeason, occasionTags, maxRecommendations);
      }

      final recommendedItems = <ClothingItem>[];
      final attributeScores = <String, double>{};
      final styleKeywords = <String>[];
      
      final missingTypes = _identifyMissingTypes(userWardrobe);
      final trendAlignment = _calculateTrendAlignment(userPreferences);
      final seasonalPrefs = _extractSeasonalPreferences(userPreferences, targetSeason);

      for (final missingType in missingTypes.take(maxRecommendations)) {
        final recommendations = await _feedbackService.getRecommendedItems(
          type: missingType,
          existingItems: userWardrobe,
          limit: 3,
        );
        
        if (recommendations.isNotEmpty) {
          final bestMatch = await _selectBestMatch(
            recommendations,
            userPreferences,
            trendAlignment,
            seasonalPrefs,
          );
          
          if (bestMatch != null) {
            recommendedItems.add(bestMatch);
          }
        }
      }

      attributeScores.addAll({
        'trendAlignment': trendAlignment,
        'seasonalFit': seasonalPrefs,
        'personalizedScore': _calculatePersonalizationScore(userPreferences),
        'wardrobeGapFill': missingTypes.length / 10.0,
      });

      final topTrends = _getTopTrendsForUser(userPreferences);
      styleKeywords.addAll(topTrends.expand((trend) => 
          (trend.metadata['keywords'] as List<String>? ?? [])).map((e) => e as String).take(5));

      final confidenceScore = _calculateConfidenceScore(
        userPreferences.totalFeedbacks,
        attributeScores.values.reduce((a, b) => a + b) / attributeScores.length,
        recommendedItems.length,
      );

      final reasoning = _generateReasoning(
        userPreferences, attributeScores, recommendedItems.length, topTrends);

      return StyleRecommendation(
        recommendedItems: recommendedItems,
        confidenceScore: confidenceScore,
        reasoning: reasoning,
        styleKeywords: styleKeywords,
        attributeScores: attributeScores,
      );
    } catch (e) {
      throw Exception('Failed to generate personalized recommendations: $e');
    }
  }

  Future<List<CollaborativeUser>> findSimilarUsers({
    required UserPreferences currentUser,
    int maxUsers = 10,
  }) async {
    final similarUsers = <CollaborativeUser>[];
    
    final syntheticUsers = _generateSyntheticUsers(50);
    
    for (final syntheticUser in syntheticUsers) {
      final similarity = _calculateUserSimilarity(currentUser, syntheticUser);
      
      if (similarity > 0.3) {
        similarUsers.add(CollaborativeUser(
          userId: syntheticUser['userId'],
          preferences: Map<String, double>.from(syntheticUser['preferences']),
          likedOutfits: List<String>.from(syntheticUser['likedOutfits']),
          likedItems: List<String>.from(syntheticUser['likedItems']),
          similarityScore: similarity,
        ));
      }
    }

    similarUsers.sort((a, b) => b.similarityScore.compareTo(a.similarityScore));
    return similarUsers.take(maxUsers).toList();
  }

  Future<List<ClothingItem>> getCollaborativeRecommendations({
    required List<ClothingItem> availableItems,
    required UserPreferences currentUser,
    int maxRecommendations = 5,
  }) async {
    try {
      final similarUsers = await findSimilarUsers(currentUser: currentUser);
      
      if (similarUsers.isEmpty) {
        return availableItems.take(maxRecommendations).toList();
      }

      final itemScores = <String, double>{};
      
      for (final user in similarUsers.take(5)) {
        final weight = user.similarityScore;
        
        for (final itemId in user.likedItems) {
          final item = availableItems.where((item) => item.id == itemId).firstOrNull;
          if (item != null) {
            itemScores[itemId] = (itemScores[itemId] ?? 0.0) + weight;
          }
        }

        for (final color in user.preferences.keys) {
          final score = user.preferences[color] ?? 0.0;
          if (score > 0.6) {
            for (final item in availableItems) {
              if (item.colors.any((itemColor) => 
                  itemColor.toLowerCase().contains(color.toLowerCase()))) {
                itemScores[item.id] = (itemScores[item.id] ?? 0.0) + (weight * score * 0.3);
              }
            }
          }
        }
      }

      final rankedItems = availableItems.where((item) => itemScores.containsKey(item.id))
          .toList()
        ..sort((a, b) => (itemScores[b.id] ?? 0.0).compareTo(itemScores[a.id] ?? 0.0));

      return rankedItems.take(maxRecommendations).toList();
    } catch (e) {
      throw Exception('Failed to get collaborative recommendations: $e');
    }
  }

  Future<Outfit?> generateTrendBasedOutfit({
    required List<ClothingItem> availableItems,
    Season? targetSeason,
    String? targetTrend,
  }) async {
    try {
      FashionTrend? selectedTrend;
      
      if (targetTrend != null) {
        selectedTrend = _currentTrends.where((trend) => 
            trend.name.toLowerCase() == targetTrend.toLowerCase()).firstOrNull;
      }
      
      selectedTrend ??= _selectTrendForSeason(targetSeason);

      final trendItems = availableItems.where((item) {
        final matchesType = selectedTrend!.associatedTypes.contains(item.type);
        final matchesColor = item.colors.any((color) =>
            selectedTrend!.associatedColors.any((trendColor) =>
                color.toLowerCase().contains(trendColor.toLowerCase())));
        final matchesSeason = targetSeason == null || 
                             item.season == null ||
                             item.season == targetSeason ||
                             item.season == Season.allSeason;
        
        return matchesType && (matchesColor || matchesSeason);
      }).toList();

      if (trendItems.length < 3) {
        return null;
      }

      final outfitItems = <ClothingItem>[];
      final usedTypes = <ClothingType>{};

      for (final type in [ClothingType.top, ClothingType.bottom, ClothingType.shoes]) {
        final typeItems = trendItems.where((item) => item.type == type && !usedTypes.contains(type)).toList();
        if (typeItems.isNotEmpty) {
          final selectedItem = typeItems[_random.nextInt(typeItems.length)];
          outfitItems.add(selectedItem);
          usedTypes.add(type);
        }
      }

      if (_random.nextBool() && outfitItems.length >= 3) {
        final accessoryItems = trendItems.where((item) => 
            [ClothingType.accessory, ClothingType.outerwear, ClothingType.bag].contains(item.type)
        ).toList();
        
        if (accessoryItems.isNotEmpty) {
          outfitItems.add(accessoryItems[_random.nextInt(accessoryItems.length)]);
        }
      }

      if (outfitItems.length < 3) {
        return null;
      }

      return Outfit(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: '${selectedTrend.name} Outfit',
        clothingItemIds: outfitItems.map((item) => item.id).toList(),
        categories: [],
        season: targetSeason,
        weatherRanges: [],
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        tags: ['trend-based', selectedTrend.name.toLowerCase().replaceAll(' ', '-')],
      );
    } catch (e) {
      throw Exception('Failed to generate trend-based outfit: $e');
    }
  }

  List<ClothingType> _identifyMissingTypes(List<ClothingItem> wardrobe) {
    final existingTypes = wardrobe.map((item) => item.type).toSet();
    const allTypes = ClothingType.values;
    
    return allTypes.where((type) => !existingTypes.contains(type)).toList();
  }

  double _calculateTrendAlignment(UserPreferences preferences) {
    double totalAlignment = 0.0;
    int trendCount = 0;

    for (final trend in _currentTrends) {
      double trendScore = 0.0;
      int matchingElements = 0;

      for (final color in trend.associatedColors) {
        final userPref = preferences.colorPreferences[color];
        if (userPref != null) {
          trendScore += userPref;
          matchingElements++;
        }
      }

      if (matchingElements > 0) {
        totalAlignment += (trendScore / matchingElements) * trend.popularity;
        trendCount++;
      }
    }

    return trendCount > 0 ? totalAlignment / trendCount : 0.5;
  }

  double _extractSeasonalPreferences(UserPreferences preferences, Season? targetSeason) {
    if (targetSeason == null) return 0.5;
    
    return preferences.seasonPreferences[targetSeason.name] ?? 0.5;
  }

  Future<ClothingItem?> _selectBestMatch(
    List<ClothingItem> candidates,
    UserPreferences preferences,
    double trendAlignment,
    double seasonalPrefs,
  ) async {
    if (candidates.isEmpty) return null;

    double bestScore = -1.0;
    ClothingItem? bestItem;

    for (final item in candidates) {
      double score = 0.0;
      int scoreComponents = 0;

      for (final color in item.colors) {
        final colorPref = preferences.colorPreferences[color];
        if (colorPref != null) {
          score += colorPref;
          scoreComponents++;
        }
      }

      for (final category in item.categories) {
        final categoryPref = preferences.categoryPreferences[category];
        if (categoryPref != null) {
          score += categoryPref;
          scoreComponents++;
        }
      }

      if (scoreComponents > 0) {
        score /= scoreComponents;
      } else {
        score = 0.5;
      }

      score = (score * 0.6) + (trendAlignment * 0.3) + (seasonalPrefs * 0.1);

      if (score > bestScore) {
        bestScore = score;
        bestItem = item;
      }
    }

    return bestItem;
  }

  double _calculatePersonalizationScore(UserPreferences preferences) {
    final feedbackCount = preferences.totalFeedbacks;
    if (feedbackCount < 5) return 0.2;
    if (feedbackCount < 15) return 0.5;
    if (feedbackCount < 30) return 0.7;
    return 0.9;
  }

  List<FashionTrend> _getTopTrendsForUser(UserPreferences preferences) {
    final trendScores = <FashionTrend, double>{};

    for (final trend in _currentTrends) {
      double score = trend.popularity;

      for (final color in trend.associatedColors) {
        final userPref = preferences.colorPreferences[color];
        if (userPref != null) {
          score += userPref * 0.5;
        }
      }

      trendScores[trend] = score;
    }

    final sortedTrends = trendScores.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return sortedTrends.take(3).map((entry) => entry.key).toList();
  }

  double _calculateConfidenceScore(int feedbackCount, double avgAttributeScore, int recommendationCount) {
    final feedbackConfidence = (feedbackCount / 50.0).clamp(0.0, 1.0);
    final attributeConfidence = avgAttributeScore.clamp(0.0, 1.0);
    final countConfidence = (recommendationCount / 5.0).clamp(0.0, 1.0);

    return (feedbackConfidence * 0.4 + attributeConfidence * 0.4 + countConfidence * 0.2).clamp(0.0, 1.0);
  }

  String _generateReasoning(
    UserPreferences preferences,
    Map<String, double> attributeScores,
    int recommendationCount,
    List<FashionTrend> topTrends,
  ) {
    final reasons = <String>[];

    if (preferences.totalFeedbacks > 10) {
      reasons.add('Based on your ${preferences.totalFeedbacks} style preferences');
    } else {
      reasons.add('Based on current fashion trends');
    }

    final trendAlignment = attributeScores['trendAlignment'] ?? 0.0;
    if (trendAlignment > 0.7) {
      reasons.add('matches your trend preferences');
    }

    if (topTrends.isNotEmpty) {
      reasons.add('incorporates ${topTrends.first.name.toLowerCase()} elements');
    }

    if (recommendationCount > 0) {
      reasons.add('fills gaps in your wardrobe');
    }

    return reasons.join(' and ');
  }

  Future<StyleRecommendation> _generateTrendBasedRecommendations(
    List<ClothingItem> userWardrobe,
    Season? targetSeason,
    List<String>? occasionTags,
    int maxRecommendations,
  ) async {
    final selectedTrend = _selectTrendForSeason(targetSeason);
    final trendKeywords = (selectedTrend.metadata['keywords'] as List<String>? ?? []);

    return StyleRecommendation(
      recommendedItems: userWardrobe.take(maxRecommendations).toList(),
      confidenceScore: selectedTrend.popularity * 0.6,
      reasoning: 'Recommendations based on ${selectedTrend.name} trend',
      styleKeywords: trendKeywords,
      attributeScores: {
        'trendAlignment': selectedTrend.popularity,
        'seasonalFit': targetSeason != null ? 0.8 : 0.5,
        'personalizedScore': 0.3,
        'wardrobeGapFill': 0.5,
      },
    );
  }

  FashionTrend _selectTrendForSeason(Season? season) {
    if (season == null) {
      return _currentTrends.reduce((a, b) => a.popularity > b.popularity ? a : b);
    }

    final seasonalTrends = _currentTrends.where((trend) => 
        trend.season == season || trend.season == Season.allSeason).toList();

    if (seasonalTrends.isEmpty) {
      return _currentTrends.first;
    }

    return seasonalTrends.reduce((a, b) => a.popularity > b.popularity ? a : b);
  }

  List<Map<String, dynamic>> _generateSyntheticUsers(int count) {
    final users = <Map<String, dynamic>>[];

    for (int i = 0; i < count; i++) {
      final colorPrefs = <String, double>{};
      final likedItems = <String>[];
      final likedOutfits = <String>[];

      for (final color in ['black', 'white', 'blue', 'red', 'green', 'gray']) {
        colorPrefs[color] = _random.nextDouble();
      }

      for (int j = 0; j < _random.nextInt(10) + 5; j++) {
        likedItems.add('synthetic_item_${i}_$j');
      }

      for (int k = 0; k < _random.nextInt(5) + 2; k++) {
        likedOutfits.add('synthetic_outfit_${i}_$k');
      }

      users.add({
        'userId': 'synthetic_user_$i',
        'preferences': colorPrefs,
        'likedItems': likedItems,
        'likedOutfits': likedOutfits,
      });
    }

    return users;
  }

  double _calculateUserSimilarity(UserPreferences user1, Map<String, dynamic> syntheticUser) {
    final prefs2 = Map<String, double>.from(syntheticUser['preferences']);
    
    double similarity = 0.0;
    int commonPreferences = 0;

    for (final color in user1.colorPreferences.keys) {
      if (prefs2.containsKey(color)) {
        final diff = (user1.colorPreferences[color]! - prefs2[color]!).abs();
        similarity += 1.0 - diff;
        commonPreferences++;
      }
    }

    return commonPreferences > 0 ? similarity / commonPreferences : 0.0;
  }
}