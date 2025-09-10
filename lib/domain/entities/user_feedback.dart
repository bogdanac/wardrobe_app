import 'package:equatable/equatable.dart';

enum FeedbackType {
  like,
  dislike,
  love,
  worn, // User actually wore the outfit
  skipped, // User saw but didn't choose
}

enum FeedbackContext {
  generated, // Feedback on AI-generated outfit
  manual, // Feedback on manually created outfit
  suggested, // Feedback on AI suggestions within manual creation
}

class UserFeedback extends Equatable {
  final String id;
  final String? outfitId;
  final String? itemId;
  final FeedbackType type;
  final FeedbackContext context;
  final DateTime timestamp;
  final Map<String, dynamic> metadata; // Store contextual info

  const UserFeedback({
    required this.id,
    this.outfitId,
    this.itemId,
    required this.type,
    required this.context,
    required this.timestamp,
    this.metadata = const {},
  });

  UserFeedback copyWith({
    String? id,
    String? outfitId,
    String? itemId,
    FeedbackType? type,
    FeedbackContext? context,
    DateTime? timestamp,
    Map<String, dynamic>? metadata,
  }) {
    return UserFeedback(
      id: id ?? this.id,
      outfitId: outfitId ?? this.outfitId,
      itemId: itemId ?? this.itemId,
      type: type ?? this.type,
      context: context ?? this.context,
      timestamp: timestamp ?? this.timestamp,
      metadata: metadata ?? this.metadata,
    );
  }

  @override
  List<Object?> get props => [
        id,
        outfitId,
        itemId,
        type,
        context,
        timestamp,
        metadata,
      ];
}

// Learned user preferences
class UserPreferences extends Equatable {
  final String userId;
  final Map<String, double> colorPreferences; // color -> preference score (0-1)
  final Map<String, double> categoryPreferences; // category -> preference score
  final Map<String, double> combinationPreferences; // "top_type:bottom_type" -> score
  final Map<String, double> weatherPreferences; // weather -> preference score
  final Map<String, double> seasonPreferences; // season -> preference score
  final DateTime lastUpdated;
  final int totalFeedbacks;

  const UserPreferences({
    required this.userId,
    this.colorPreferences = const {},
    this.categoryPreferences = const {},
    this.combinationPreferences = const {},
    this.weatherPreferences = const {},
    this.seasonPreferences = const {},
    required this.lastUpdated,
    this.totalFeedbacks = 0,
  });

  UserPreferences copyWith({
    String? userId,
    Map<String, double>? colorPreferences,
    Map<String, double>? categoryPreferences,
    Map<String, double>? combinationPreferences,
    Map<String, double>? weatherPreferences,
    Map<String, double>? seasonPreferences,
    DateTime? lastUpdated,
    int? totalFeedbacks,
  }) {
    return UserPreferences(
      userId: userId ?? this.userId,
      colorPreferences: colorPreferences ?? this.colorPreferences,
      categoryPreferences: categoryPreferences ?? this.categoryPreferences,
      combinationPreferences: combinationPreferences ?? this.combinationPreferences,
      weatherPreferences: weatherPreferences ?? this.weatherPreferences,
      seasonPreferences: seasonPreferences ?? this.seasonPreferences,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      totalFeedbacks: totalFeedbacks ?? this.totalFeedbacks,
    );
  }

  @override
  List<Object?> get props => [
        userId,
        colorPreferences,
        categoryPreferences,
        combinationPreferences,
        weatherPreferences,
        seasonPreferences,
        lastUpdated,
        totalFeedbacks,
      ];
}