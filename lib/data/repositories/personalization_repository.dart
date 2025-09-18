import '../../domain/entities/personalization_models.dart';

abstract class PersonalizationRepository {
  Future<void> saveUserInteraction(UserInteraction interaction);
  Future<List<UserInteraction>> getUserInteractions(String userId, {int limit = 100});
  Future<UserProfile?> getUserProfile(String userId);
  Future<void> saveUserProfile(UserProfile profile);
  Future<UserPreferences?> getUserPreferences(String userId);
  Future<void> saveUserPreferences(UserPreferences preferences);
  Future<void> saveOutfitFeedback(OutfitFeedback feedback);
  Future<List<OutfitHistory>> getUserOutfitHistory(String userId);
  Future<List<TrendingStyle>> getTrendingStyles();
}