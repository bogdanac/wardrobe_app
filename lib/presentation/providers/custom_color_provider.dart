import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/custom_color.dart';
import '../../domain/repositories/custom_color_repository.dart';
import '../../data/repositories/firebase_custom_color_repository.dart';
import 'auth_provider.dart';

final customColorRepositoryProvider = Provider<CustomColorRepository>((ref) {
  // Get the current user ID from auth provider
  final userId = ref.watch(currentUserIdProvider);

  // Use Firebase repository
  return FirebaseCustomColorRepository(userId: userId);
});

final allCustomColorsProvider = StreamProvider<List<CustomColor>>((ref) {
  final repository = ref.read(customColorRepositoryProvider);
  return repository.watchColors();
});

final customColorByIdProvider = FutureProvider.family<CustomColor?, String>((ref, id) async {
  final repository = ref.read(customColorRepositoryProvider);
  return repository.getColorById(id);
});
