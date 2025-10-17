import '../entities/color_palette.dart';

abstract class ColorPaletteRepository {
  Future<List<ColorPalette>> getAllColorPalettes();
  Future<ColorPalette?> getColorPaletteById(String id);
  Future<void> saveColorPalette(ColorPalette palette);
  Future<void> updateColorPalette(ColorPalette palette);
  Future<void> deleteColorPalette(String id);
}
