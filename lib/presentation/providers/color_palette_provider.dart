import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/color_palette.dart';
import '../../domain/repositories/color_palette_repository.dart';
import '../../data/repositories/firebase_color_palette_repository.dart';
import 'auth_provider.dart';

final colorPaletteRepositoryProvider = Provider<ColorPaletteRepository>((ref) {
  // Get the current user ID from auth provider
  final userId = ref.watch(currentUserIdProvider);

  // Use Firebase repository
  return FirebaseColorPaletteRepository(userId: userId);
});

final allColorPalettesProvider = FutureProvider<List<ColorPalette>>((ref) async {
  final repository = ref.read(colorPaletteRepositoryProvider);
  return repository.getAllColorPalettes();
});

final colorPaletteByIdProvider = FutureProvider.family<ColorPalette?, String>((ref, id) async {
  final repository = ref.read(colorPaletteRepositoryProvider);
  return repository.getColorPaletteById(id);
});
