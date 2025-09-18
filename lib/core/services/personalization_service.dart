import 'dart:math';
import '../../domain/entities/personalization_models.dart';
import '../../domain/entities/clothing_item.dart';
import '../../data/repositories/personalization_repository.dart';

class PersonalizationService {
  final PersonalizationRepository _repository;
  
  PersonalizationService(this._repository);

  // Learn from user interactions
  Future<void> recordUserInteraction({
    required UserInteractionType type,
    required String targetId,
    String? targetType,
    Map<String, dynamic>? context,
  }) async {
    try {
      final interaction = UserInteraction()
        ..userId = 'current_user' // TODO: Get from auth
        ..interactionType = type
        ..targetId = targetId
        ..targetType = targetType ?? 'outfit'
        ..context = context ?? {}
        ..timestamp = DateTime.now();

      await _repository.saveUserInteraction(interaction);
      
      // Update user preferences based on interaction
      await _updatePreferencesFromInteraction(interaction);
    } catch (e) {
      // Handle error silently to not interrupt user experience
    }
  }

  // Generate personalized recommendations
  Future<List<PersonalizedRecommendation>> generateRecommendations({
    required String userId,
    RecommendationType? type,
    int limit = 10,
    Map<String, dynamic>? context,
  }) async {
    try {
      final userProfile = await _repository.getUserProfile(userId);
      final interactions = await _repository.getUserInteractions(userId);
      final preferences = await _repository.getUserPreferences(userId);
      
      if (userProfile == null) {
        return _generateDefaultRecommendations(limit);
      }

      final recommendations = <PersonalizedRecommendation>[];
      
      // Generate different types of recommendations
      if (type == null || type == RecommendationType.outfit) {
        final outfitRecs = await _generateOutfitRecommendations(
          userProfile, 
          interactions, 
          preferences,
          limit: limit ~/ 3,
        );
        recommendations.addAll(outfitRecs);
      }
      
      if (type == null || type == RecommendationType.clothingItem) {
        final itemRecs = await _generateItemRecommendations(
          userProfile, 
          interactions, 
          preferences,
          limit: limit ~/ 3,
        );
        recommendations.addAll(itemRecs);
      }
      
      if (type == null || type == RecommendationType.style) {
        final styleRecs = await _generateStyleRecommendations(
          userProfile, 
          interactions, 
          preferences,
          limit: limit ~/ 3,
        );
        recommendations.addAll(styleRecs);
      }
      
      // Sort by confidence and relevance
      recommendations.sort((a, b) => b.confidence.compareTo(a.confidence));
      
      return recommendations.take(limit).toList();
    } catch (e) {
      return _generateDefaultRecommendations(limit);
    }
  }

  // Analyze user style preferences
  Future<StyleProfile> analyzeUserStyle(String userId) async {
    try {
      final interactions = await _repository.getUserInteractions(userId);
      final outfitHistory = await _repository.getUserOutfitHistory(userId);
      
      // Analyze color preferences
      final colorAnalysis = _analyzeColorPreferences(interactions, outfitHistory);
      
      // Analyze style preferences
      final styleAnalysis = _analyzeStylePreferences(interactions, outfitHistory);
      
      // Analyze fit preferences
      final fitAnalysis = _analyzeFitPreferences(interactions, outfitHistory);
      
      // Analyze occasion preferences
      final occasionAnalysis = _analyzeOccasionPreferences(interactions, outfitHistory);
      
      return StyleProfile()
        ..userId = userId
        ..colorPreferences = colorAnalysis
        ..stylePreferences = styleAnalysis
        ..fitPreferences = fitAnalysis
        ..occasionPreferences = occasionAnalysis
        ..confidence = _calculateStyleConfidence(interactions.length)
        ..lastUpdated = DateTime.now();
    } catch (e) {
      return _getDefaultStyleProfile(userId);
    }
  }

  // Update user preferences based on behavior
  Future<void> updatePreferencesFromBehavior(String userId) async {
    try {
      final interactions = await _repository.getUserInteractions(userId, limit: 100);
      final preferences = await _repository.getUserPreferences(userId) ?? UserPreferences();
      
      // Analyze recent interactions to update preferences
      final colorFrequency = <String, int>{};
      final styleFrequency = <String, int>{};
      final occasionFrequency = <String, int>{};
      
      for (final interaction in interactions) {
        if (interaction.interactionType == UserInteractionType.liked ||
            interaction.interactionType == UserInteractionType.worn) {
          
          // Extract preferences from context
          final context = interaction.context;
          if (context.containsKey('colors')) {
            final colors = context['colors'] as List?;
            if (colors != null) {
              for (final color in colors) {
                colorFrequency[color.toString()] = (colorFrequency[color.toString()] ?? 0) + 1;
              }
            }
          }
          
          if (context.containsKey('style')) {
            final style = context['style'] as String?;
            if (style != null) {
              styleFrequency[style] = (styleFrequency[style] ?? 0) + 1;
            }
          }
          
          if (context.containsKey('occasion')) {
            final occasion = context['occasion'] as String?;
            if (occasion != null) {
              occasionFrequency[occasion] = (occasionFrequency[occasion] ?? 0) + 1;
            }
          }
        }
      }
      
      // Update preferences based on frequency analysis
      preferences.userId = userId;
      preferences.preferredColors = _getTopEntries(colorFrequency, 10);
      preferences.preferredStyles = _getTopEntries(styleFrequency, 5);
      preferences.preferredOccasions = _getTopEntries(occasionFrequency, 5);
      preferences.lastUpdated = DateTime.now();
      
      await _repository.saveUserPreferences(preferences);
    } catch (e) {
      // Handle error
    }
  }

  // Get personalized outfit suggestions for an occasion
  Future<List<String>> getPersonalizedOutfitSuggestions({
    required String userId,
    required String occasion,
    Season? season,
    List<String>? availableItemIds,
    int limit = 5,
  }) async {
    try {
      final preferences = await _repository.getUserPreferences(userId);
      await analyzeUserStyle(userId);
      
      if (preferences == null) {
        return [];
      }
      
      // Generate outfit suggestions based on user preferences
      final suggestions = <String>[];
      
      // This would integrate with your outfit generation logic
      // For now, return mock suggestions
      return suggestions;
    } catch (e) {
      return [];
    }
  }

  // Learn from outfit feedback
  Future<void> recordOutfitFeedback({
    required String userId,
    required String outfitId,
    required double rating,
    String? feedback,
    List<String>? tags,
  }) async {
    try {
      final feedbackRecord = OutfitFeedback()
        ..userId = userId
        ..outfitId = outfitId
        ..rating = rating
        ..feedback = feedback
        ..tags = tags ?? []
        ..timestamp = DateTime.now();

      await _repository.saveOutfitFeedback(feedbackRecord);
      
      // Update user preferences based on feedback
      if (rating >= 4.0) {
        await recordUserInteraction(
          type: UserInteractionType.liked,
          targetId: outfitId,
          context: {
            'rating': rating,
            'feedback': feedback,
            'tags': tags,
          },
        );
      } else if (rating <= 2.0) {
        await recordUserInteraction(
          type: UserInteractionType.disliked,
          targetId: outfitId,
          context: {
            'rating': rating,
            'feedback': feedback,
            'tags': tags,
          },
        );
      }
    } catch (e) {
      throw Exception('Failed to record outfit feedback: $e');
    }
  }

  // Get trending styles for user
  Future<List<TrendingStyle>> getTrendingStylesForUser(String userId) async {
    try {
      final userProfile = await _repository.getUserProfile(userId);
      final allTrends = await _repository.getTrendingStyles();
      
      if (userProfile == null) return allTrends;
      
      // Filter trends based on user preferences
      final personalizedTrends = allTrends.where((trend) {
        // Check if trend matches user's style preferences
        return userProfile.stylePreferences.keys.any((pref) =>
          trend.tags.contains(pref) || trend.description.toLowerCase().contains(pref.toLowerCase()));
      }).toList();
      
      // Sort by relevance to user
      personalizedTrends.sort((a, b) => b.popularity.compareTo(a.popularity));
      
      return personalizedTrends;
    } catch (e) {
      return [];
    }
  }

  // Private helper methods
  Future<void> _updatePreferencesFromInteraction(UserInteraction interaction) async {
    try {
      final userId = interaction.userId;
      var preferences = await _repository.getUserPreferences(userId);
      preferences ??= UserPreferences()..userId = userId;
      
      // Update preferences based on interaction type and context
      if (interaction.interactionType == UserInteractionType.liked) {
        _updatePreferencesFromLike(preferences, interaction.context);
      } else if (interaction.interactionType == UserInteractionType.disliked) {
        _updatePreferencesFromDislike(preferences, interaction.context);
      } else if (interaction.interactionType == UserInteractionType.worn) {
        _updatePreferencesFromWorn(preferences, interaction.context);
      }
      
      preferences.lastUpdated = DateTime.now();
      await _repository.saveUserPreferences(preferences);
    } catch (e) {
      // Handle silently
    }
  }

  void _updatePreferencesFromLike(UserPreferences preferences, Map<String, dynamic> context) {
    // Increase weights for liked attributes
    if (context.containsKey('colors')) {
      final colors = context['colors'] as List?;
      if (colors != null) {
        for (final color in colors) {
          if (!preferences.preferredColors.contains(color.toString())) {
            preferences.preferredColors.add(color.toString());
          }
        }
      }
    }
    
    if (context.containsKey('style')) {
      final style = context['style'] as String?;
      if (style != null && !preferences.preferredStyles.contains(style)) {
        preferences.preferredStyles.add(style);
      }
    }
  }

  void _updatePreferencesFromDislike(UserPreferences preferences, Map<String, dynamic> context) {
    // Add to disliked attributes
    if (context.containsKey('colors')) {
      final colors = context['colors'] as List?;
      if (colors != null) {
        for (final color in colors) {
          if (!preferences.dislikedColors.contains(color.toString())) {
            preferences.dislikedColors.add(color.toString());
          }
          // Remove from preferred if exists
          preferences.preferredColors.remove(color.toString());
        }
      }
    }
  }

  void _updatePreferencesFromWorn(UserPreferences preferences, Map<String, dynamic> context) {
    // Increase frequency of worn attributes
    if (context.containsKey('occasion')) {
      final occasion = context['occasion'] as String?;
      if (occasion != null && !preferences.preferredOccasions.contains(occasion)) {
        preferences.preferredOccasions.add(occasion);
      }
    }
  }

  Future<List<PersonalizedRecommendation>> _generateOutfitRecommendations(
    UserProfile userProfile,
    List<UserInteraction> interactions,
    UserPreferences? preferences,
    {int limit = 5}
  ) async {
    // Generate outfit recommendations based on user data
    final recommendations = <PersonalizedRecommendation>[];
    
    // This would be more sophisticated in a real implementation
    for (int i = 0; i < limit; i++) {
      recommendations.add(PersonalizedRecommendation()
        ..type = RecommendationType.outfit
        ..title = 'Personalized Outfit ${i + 1}'
        ..description = 'Based on your style preferences'
        ..confidence = 0.8 - (i * 0.1)
        ..targetId = 'outfit_$i'
        ..reasoning = ['Matches your color preferences', 'Fits your style']
        ..createdAt = DateTime.now());
    }
    
    return recommendations;
  }

  Future<List<PersonalizedRecommendation>> _generateItemRecommendations(
    UserProfile userProfile,
    List<UserInteraction> interactions,
    UserPreferences? preferences,
    {int limit = 5}
  ) async {
    final recommendations = <PersonalizedRecommendation>[];
    
    for (int i = 0; i < limit; i++) {
      recommendations.add(PersonalizedRecommendation()
        // ..id = // Auto-generated by Isar, removed'item_rec_$i'
        ..type = RecommendationType.clothingItem
        ..title = 'Recommended Item ${i + 1}'
        ..description = 'Perfect addition to your wardrobe'
        ..confidence = 0.7 - (i * 0.1)
        ..targetId = 'item_$i'
        ..reasoning = ['Complements your existing pieces']
        ..createdAt = DateTime.now());
    }
    
    return recommendations;
  }

  Future<List<PersonalizedRecommendation>> _generateStyleRecommendations(
    UserProfile userProfile,
    List<UserInteraction> interactions,
    UserPreferences? preferences,
    {int limit = 5}
  ) async {
    final recommendations = <PersonalizedRecommendation>[];
    
    for (int i = 0; i < limit; i++) {
      recommendations.add(PersonalizedRecommendation()
        // ..id = // Auto-generated by Isar, removed'style_rec_$i'
        ..type = RecommendationType.style
        ..title = 'New Style to Try'
        ..description = 'Expand your fashion horizons'
        ..confidence = 0.6 - (i * 0.1)
        ..targetId = 'style_$i'
        ..reasoning = ['Similar to styles you\'ve liked before']
        ..createdAt = DateTime.now());
    }
    
    return recommendations;
  }

  List<PersonalizedRecommendation> _generateDefaultRecommendations(int limit) {
    final recommendations = <PersonalizedRecommendation>[];
    
    for (int i = 0; i < limit; i++) {
      recommendations.add(PersonalizedRecommendation()
        // ..id = // Auto-generated by Isar, removed'default_rec_$i'
        ..type = RecommendationType.outfit
        ..title = 'Popular Outfit ${i + 1}'
        ..description = 'Trending outfit combination'
        ..confidence = 0.5
        ..targetId = 'default_outfit_$i'
        ..reasoning = ['Popular choice', 'Versatile style']
        ..createdAt = DateTime.now());
    }
    
    return recommendations;
  }

  Map<String, int> _analyzeColorPreferences(
    List<UserInteraction> interactions,
    List<OutfitHistory> outfitHistory,
  ) {
    final colorFrequency = <String, int>{};
    
    for (final interaction in interactions) {
      if (interaction.interactionType == UserInteractionType.liked) {
        final colors = interaction.context['colors'] as List?;
        if (colors != null) {
          for (final color in colors) {
            colorFrequency[color.toString()] = (colorFrequency[color.toString()] ?? 0) + 2;
          }
        }
      }
    }
    
    for (final history in outfitHistory) {
      for (final color in history.colors) {
        colorFrequency[color] = (colorFrequency[color] ?? 0) + 1;
      }
    }
    
    return colorFrequency;
  }

  Map<String, int> _analyzeStylePreferences(
    List<UserInteraction> interactions,
    List<OutfitHistory> outfitHistory,
  ) {
    final styleFrequency = <String, int>{};
    
    for (final interaction in interactions) {
      final style = interaction.context['style'] as String?;
      if (style != null) {
        final weight = interaction.interactionType == UserInteractionType.liked ? 2 : 1;
        styleFrequency[style] = (styleFrequency[style] ?? 0) + weight;
      }
    }
    
    return styleFrequency;
  }

  Map<String, int> _analyzeFitPreferences(
    List<UserInteraction> interactions,
    List<OutfitHistory> outfitHistory,
  ) {
    final fitFrequency = <String, int>{};
    
    for (final interaction in interactions) {
      final fit = interaction.context['fit'] as String?;
      if (fit != null) {
        fitFrequency[fit] = (fitFrequency[fit] ?? 0) + 1;
      }
    }
    
    return fitFrequency;
  }

  Map<String, int> _analyzeOccasionPreferences(
    List<UserInteraction> interactions,
    List<OutfitHistory> outfitHistory,
  ) {
    final occasionFrequency = <String, int>{};
    
    for (final interaction in interactions) {
      final occasion = interaction.context['occasion'] as String?;
      if (occasion != null) {
        occasionFrequency[occasion] = (occasionFrequency[occasion] ?? 0) + 1;
      }
    }
    
    for (final history in outfitHistory) {
      if (history.occasion.isNotEmpty) {
        occasionFrequency[history.occasion] = (occasionFrequency[history.occasion] ?? 0) + 1;
      }
    }
    
    return occasionFrequency;
  }

  double _calculateStyleConfidence(int interactionCount) {
    // Confidence increases with more interactions, but with diminishing returns
    return min(interactionCount / 100.0, 1.0);
  }

  StyleProfile _getDefaultStyleProfile(String userId) {
    return StyleProfile()
      ..userId = userId
      ..colorPreferences = {}
      ..stylePreferences = {}
      ..fitPreferences = {}
      ..occasionPreferences = {}
      ..confidence = 0.0
      ..lastUpdated = DateTime.now();
  }

  List<String> _getTopEntries(Map<String, int> frequency, int limit) {
    final sorted = frequency.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    
    return sorted.take(limit).map((e) => e.key).toList();
  }
}