import '../../domain/entities/personalization_models.dart';
import 'personalization_repository.dart';

class PersonalizationRepositoryImpl implements PersonalizationRepository {

  @override
  Future<void> saveUserInteraction(UserInteraction interaction) async {
    // TODO: Implement when Isar collections are generated
    // final isar = await _databaseService.isar;
    // await isar.writeTxn(() async {
    //   await isar.userInteractions.put(interaction);
    // });
  }

  @override
  Future<List<UserInteraction>> getUserInteractions(String userId, {int limit = 100}) async {
    // TODO: Implement when Isar collections are generated
    return [];
  }

  @override
  Future<UserProfile?> getUserProfile(String userId) async {
    // TODO: Implement when Isar collections are generated
    return null;
  }

  @override
  Future<void> saveUserProfile(UserProfile profile) async {
    // TODO: Implement when Isar collections are generated
  }

  @override
  Future<UserPreferences?> getUserPreferences(String userId) async {
    // TODO: Implement when Isar collections are generated
    return null;
  }

  @override
  Future<void> saveUserPreferences(UserPreferences preferences) async {
    // TODO: Implement when Isar collections are generated
  }

  @override
  Future<void> saveOutfitFeedback(OutfitFeedback feedback) async {
    // TODO: Implement when Isar collections are generated
  }

  @override
  Future<List<OutfitHistory>> getUserOutfitHistory(String userId) async {
    // TODO: Implement when Isar collections are generated
    return [];
  }

  @override
  Future<List<TrendingStyle>> getTrendingStyles() async {
    // TODO: Implement when Isar collections are generated
    return [];
  }
}