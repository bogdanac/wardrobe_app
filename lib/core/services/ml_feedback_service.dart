import 'package:isar/isar.dart';
import '../../data/models/clothing_item_model.dart';
import '../../data/models/outfit_model.dart';

import '../../domain/entities/user_feedback.dart';
import '../../domain/entities/clothing_item.dart';
import '../../domain/entities/outfit.dart';
import '../services/database_service.dart';
import '../../data/models/user_feedback_model.dart';
import '../../data/models/user_preferences_model.dart';

class MLFeedbackService {
  final DatabaseService _databaseService = DatabaseService.instance;
  final String _currentUserId = 'default_user';
  
  static const double _learningRate = 0.1;
  static const int _minFeedbacksForReliability = 5;

  Future<void> recordFeedback({
    required FeedbackType type,
    required FeedbackContext context,
    String? outfitId,
    String? itemId,
    Map<String, dynamic>? metadata,
  }) async {
    final feedback = UserFeedback(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      outfitId: outfitId,
      itemId: itemId,
      type: type,
      context: context,
      timestamp: DateTime.now(),
      metadata: metadata ?? {},
    );

    final isar = await _databaseService.isar;
    final feedbackModel = UserFeedbackModel.fromEntity(feedback, _currentUserId);
    
    await isar.writeTxn(() async {
      await isar.userFeedbackModels.put(feedbackModel);
    });

    await _updatePreferences(feedback);
  }

  Future<void> _updatePreferences(UserFeedback feedback) async {
    try {
      final isar = await _databaseService.isar;
      
      var preferences = await isar.userPreferencesModels
          .filter()
          .userIdEqualTo(_currentUserId)
          .findFirst();

      preferences ??= UserPreferencesModel(
          userId: _currentUserId,
          colorPreferences: {},
          categoryPreferences: {},
          combinationPreferences: {},
          weatherPreferences: {},
          seasonPreferences: {},
          lastUpdated: DateTime.now(),
          totalFeedbacks: 0,
        );

      final feedbackWeight = _calculateFeedbackWeight(feedback.type);
      final newTotalFeedbacks = preferences.totalFeedbacks + 1;

      Map<String, double> updatedColorPrefs = Map.from(preferences.colorPreferences);
      Map<String, double> updatedCategoryPrefs = Map.from(preferences.categoryPreferences);
      Map<String, double> updatedCombinationPrefs = Map.from(preferences.combinationPreferences);
      Map<String, double> updatedWeatherPrefs = Map.from(preferences.weatherPreferences);
      Map<String, double> updatedSeasonPrefs = Map.from(preferences.seasonPreferences);

      if (feedback.outfitId != null) {
        await _updateOutfitPreferences(
          feedback,
          feedbackWeight,
          updatedColorPrefs,
          updatedCategoryPrefs,
          updatedCombinationPrefs,
          updatedWeatherPrefs,
          updatedSeasonPrefs,
        );
      }

      if (feedback.itemId != null) {
        await _updateItemPreferences(
          feedback,
          feedbackWeight,
          updatedColorPrefs,
          updatedCategoryPrefs,
          updatedWeatherPrefs,
          updatedSeasonPrefs,
        );
      }

      final updatedPreferences = preferences.copyWith(
        colorPreferences: updatedColorPrefs,
        categoryPreferences: updatedCategoryPrefs,
        combinationPreferences: updatedCombinationPrefs,
        weatherPreferences: updatedWeatherPrefs,
        seasonPreferences: updatedSeasonPrefs,
        lastUpdated: DateTime.now(),
        totalFeedbacks: newTotalFeedbacks,
      );

      await isar.writeTxn(() async {
        await isar.userPreferencesModels.put(updatedPreferences);
      });
    } catch (e) {
      throw Exception('Failed to update preferences: $e');
    }
  }

  Future<void> _updateOutfitPreferences(
    UserFeedback feedback,
    double feedbackWeight,
    Map<String, double> colorPrefs,
    Map<String, double> categoryPrefs,
    Map<String, double> combinationPrefs,
    Map<String, double> weatherPrefs,
    Map<String, double> seasonPrefs,
  ) async {
    final isar = await _databaseService.isar;
    final outfitModel = await isar.outfitModels
        .filter()
        .idEqualTo(feedback.outfitId!)
        .findFirst();

    if (outfitModel == null) return;

    final clothingItems = await isar.clothingItemModels
        .filter()
        .anyOf(outfitModel.clothingItemIds, (q, itemId) => q.idEqualTo(itemId))
        .findAll();

    final allColors = clothingItems.expand((item) => item.colors).toSet();
    final allCategories = clothingItems.expand((item) => item.categories).toSet();

    for (final color in allColors) {
      _updatePreferenceValue(colorPrefs, color, feedbackWeight);
    }

    for (final category in allCategories) {
      _updatePreferenceValue(categoryPrefs, category, feedbackWeight);
    }

    if (outfitModel.season != null) {
      _updatePreferenceValue(seasonPrefs, outfitModel.season!.name, feedbackWeight);
    }

    for (final weather in outfitModel.weatherRanges) {
      _updatePreferenceValue(weatherPrefs, weather.name, feedbackWeight);
    }

    _updateCombinationPreferences(clothingItems, combinationPrefs, feedbackWeight);
  }

  Future<void> _updateItemPreferences(
    UserFeedback feedback,
    double feedbackWeight,
    Map<String, double> colorPrefs,
    Map<String, double> categoryPrefs,
    Map<String, double> weatherPrefs,
    Map<String, double> seasonPrefs,
  ) async {
    final isar = await _databaseService.isar;
    final itemModel = await isar.clothingItemModels
        .filter()
        .idEqualTo(feedback.itemId!)
        .findFirst();

    if (itemModel == null) return;

    for (final color in itemModel.colors) {
      _updatePreferenceValue(colorPrefs, color, feedbackWeight);
    }

    for (final category in itemModel.categories) {
      _updatePreferenceValue(categoryPrefs, category, feedbackWeight);
    }

    if (itemModel.season != null) {
      _updatePreferenceValue(seasonPrefs, itemModel.season!.name, feedbackWeight);
    }

    for (final weather in itemModel.weatherRanges) {
      _updatePreferenceValue(weatherPrefs, weather.name, feedbackWeight);
    }
  }

  void _updateCombinationPreferences(
    List<dynamic> clothingItems,
    Map<String, double> combinationPrefs,
    double feedbackWeight,
  ) {
    final types = clothingItems
        .map((item) => item.type.name)
        .toList()
      ..sort();

    for (int i = 0; i < types.length; i++) {
      for (int j = i + 1; j < types.length; j++) {
        final combination = '${types[i]}:${types[j]}';
        _updatePreferenceValue(combinationPrefs, combination, feedbackWeight);
      }
    }
  }

  void _updatePreferenceValue(
    Map<String, double> preferences,
    String key,
    double feedbackWeight,
  ) {
    final currentValue = preferences[key] ?? 0.5;
    final updatedValue = currentValue + (_learningRate * feedbackWeight);
    preferences[key] = updatedValue.clamp(0.0, 1.0);
  }

  double _calculateFeedbackWeight(FeedbackType type) {
    switch (type) {
      case FeedbackType.love:
        return 0.8;
      case FeedbackType.like:
        return 0.4;
      case FeedbackType.worn:
        return 0.6;
      case FeedbackType.dislike:
        return -0.4;
      case FeedbackType.skipped:
        return -0.2;
    }
  }

  Future<UserPreferences?> getUserPreferences() async {
    final isar = await _databaseService.isar;
    final preferencesModel = await isar.userPreferencesModels
        .filter()
        .userIdEqualTo(_currentUserId)
        .findFirst();

    return preferencesModel?.toEntity();
  }

  Future<double> calculateOutfitScore(Outfit outfit) async {
    final preferences = await getUserPreferences();
    if (preferences == null || preferences.totalFeedbacks < _minFeedbacksForReliability) {
      return 0.5;
    }

    final isar = await _databaseService.isar;
    final clothingItems = await isar.clothingItemModels
        .filter()
        .anyOf(outfit.clothingItemIds, (q, itemId) => q.idEqualTo(itemId))
        .findAll();

    double totalScore = 0.0;
    int scoreComponents = 0;

    final allColors = clothingItems.expand((item) => item.colors).toSet();
    double colorScore = 0.0;
    int colorCount = 0;
    for (final color in allColors) {
      final prefScore = preferences.colorPreferences[color];
      if (prefScore != null) {
        colorScore += prefScore;
        colorCount++;
      }
    }
    if (colorCount > 0) {
      totalScore += colorScore / colorCount;
      scoreComponents++;
    }

    final allCategories = clothingItems.expand((item) => item.categories).toSet();
    double categoryScore = 0.0;
    int categoryCount = 0;
    for (final category in allCategories) {
      final prefScore = preferences.categoryPreferences[category];
      if (prefScore != null) {
        categoryScore += prefScore;
        categoryCount++;
      }
    }
    if (categoryCount > 0) {
      totalScore += categoryScore / categoryCount;
      scoreComponents++;
    }

    if (outfit.season != null) {
      final seasonScore = preferences.seasonPreferences[outfit.season!.name];
      if (seasonScore != null) {
        totalScore += seasonScore;
        scoreComponents++;
      }
    }

    double weatherScore = 0.0;
    int weatherCount = 0;
    for (final weather in outfit.weatherRanges) {
      final prefScore = preferences.weatherPreferences[weather.name];
      if (prefScore != null) {
        weatherScore += prefScore;
        weatherCount++;
      }
    }
    if (weatherCount > 0) {
      totalScore += weatherScore / weatherCount;
      scoreComponents++;
    }

    final types = clothingItems
        .map((item) => item.type.name)
        .toList()
      ..sort();

    double combinationScore = 0.0;
    int combinationCount = 0;
    for (int i = 0; i < types.length; i++) {
      for (int j = i + 1; j < types.length; j++) {
        final combination = '${types[i]}:${types[j]}';
        final prefScore = preferences.combinationPreferences[combination];
        if (prefScore != null) {
          combinationScore += prefScore;
          combinationCount++;
        }
      }
    }
    if (combinationCount > 0) {
      totalScore += combinationScore / combinationCount;
      scoreComponents++;
    }

    return scoreComponents > 0 ? totalScore / scoreComponents : 0.5;
  }

  Future<List<ClothingItem>> getRecommendedItems({
    ClothingType? type,
    List<ClothingItem>? existingItems,
    int limit = 10,
  }) async {
    final preferences = await getUserPreferences();
    final isar = await _databaseService.isar;

    var query = isar.clothingItemModels.where();
    if (type != null) {
      query = query.filter().typeEqualTo(type) as QueryBuilder<ClothingItemModel, ClothingItemModel, QWhere>;
    }

    final allItems = await query.findAll();
    final itemEntities = allItems.map((model) => model.toEntity()).toList();

    if (preferences == null || preferences.totalFeedbacks < _minFeedbacksForReliability) {
      itemEntities.shuffle();
      return itemEntities.take(limit).toList();
    }

    final scoredItems = <MapEntry<ClothingItem, double>>[];

    for (final item in itemEntities) {
      double score = await _calculateItemCompatibilityScore(
        item,
        preferences,
        existingItems ?? [],
      );
      scoredItems.add(MapEntry(item, score));
    }

    scoredItems.sort((a, b) => b.value.compareTo(a.value));
    return scoredItems.take(limit).map((entry) => entry.key).toList();
  }

  Future<double> _calculateItemCompatibilityScore(
    ClothingItem item,
    UserPreferences preferences,
    List<ClothingItem> existingItems,
  ) async {
    double totalScore = 0.0;
    int scoreComponents = 0;

    double colorScore = 0.0;
    int colorCount = 0;
    for (final color in item.colors) {
      final prefScore = preferences.colorPreferences[color];
      if (prefScore != null) {
        colorScore += prefScore;
        colorCount++;
      }
    }
    if (colorCount > 0) {
      totalScore += colorScore / colorCount;
      scoreComponents++;
    }

    double categoryScore = 0.0;
    int categoryCount = 0;
    for (final category in item.categories) {
      final prefScore = preferences.categoryPreferences[category];
      if (prefScore != null) {
        categoryScore += prefScore;
        categoryCount++;
      }
    }
    if (categoryCount > 0) {
      totalScore += categoryScore / categoryCount;
      scoreComponents++;
    }

    if (existingItems.isNotEmpty) {
      double compatibilityScore = 0.0;
      int compatibilityCount = 0;

      for (final existingItem in existingItems) {
        final combination1 = '${item.type.name}:${existingItem.type.name}';
        final combination2 = '${existingItem.type.name}:${item.type.name}';
        
        final prefScore1 = preferences.combinationPreferences[combination1];
        final prefScore2 = preferences.combinationPreferences[combination2];
        
        if (prefScore1 != null) {
          compatibilityScore += prefScore1;
          compatibilityCount++;
        } else if (prefScore2 != null) {
          compatibilityScore += prefScore2;
          compatibilityCount++;
        }
      }

      if (compatibilityCount > 0) {
        totalScore += compatibilityScore / compatibilityCount;
        scoreComponents++;
      }
    }

    return scoreComponents > 0 ? totalScore / scoreComponents : 0.5;
  }
}