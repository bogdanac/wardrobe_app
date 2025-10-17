import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/outfit_style.dart';
import '../../domain/repositories/outfit_style_repository.dart';
import '../../data/repositories/firebase_outfit_style_repository.dart';
import 'auth_provider.dart';

final outfitStyleRepositoryProvider = Provider<OutfitStyleRepository>((ref) {
  // Get the current user ID from auth provider
  final userId = ref.watch(currentUserIdProvider);

  // Use Firebase repository
  return FirebaseOutfitStyleRepository(userId: userId);
});

final allOutfitStylesProvider = StreamProvider<List<OutfitStyle>>((ref) {
  final repository = ref.read(outfitStyleRepositoryProvider);
  return repository.watchOutfitStyles();
});

final outfitStyleByIdProvider = FutureProvider.family<OutfitStyle?, String>((ref, id) async {
  final repository = ref.read(outfitStyleRepositoryProvider);
  return repository.getOutfitStyleById(id);
});
