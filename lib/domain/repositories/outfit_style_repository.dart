import '../entities/outfit_style.dart';

abstract class OutfitStyleRepository {
  Future<List<OutfitStyle>> getAllOutfitStyles();
  Future<OutfitStyle?> getOutfitStyleById(String id);
  Future<void> saveOutfitStyle(OutfitStyle outfitStyle);
  Future<void> updateOutfitStyle(OutfitStyle outfitStyle);
  Future<void> deleteOutfitStyle(String id);
  Stream<List<OutfitStyle>> watchOutfitStyles();
}
