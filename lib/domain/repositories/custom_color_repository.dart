import '../entities/custom_color.dart';

abstract class CustomColorRepository {
  Future<List<CustomColor>> getAllColors();
  Future<CustomColor?> getColorById(String id);
  Future<void> saveColor(CustomColor color);
  Future<void> updateColor(CustomColor color);
  Future<void> deleteColor(String id);
  Future<void> resetToDefaults();
  Stream<List<CustomColor>> watchColors();
}
