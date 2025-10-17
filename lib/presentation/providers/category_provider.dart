import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/category.dart';
import '../../domain/repositories/category_repository.dart';
import '../../data/repositories/firebase_category_repository.dart';
import 'auth_provider.dart';

final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  // Get the current user ID from auth provider
  final userId = ref.watch(currentUserIdProvider);

  // Use Firebase repository
  return FirebaseCategoryRepository(userId: userId);
});

final allCategoriesProvider = StreamProvider<List<Category>>((ref) {
  final repository = ref.read(categoryRepositoryProvider);
  return repository.watchCategories();
});

final categoryByIdProvider = FutureProvider.family<Category?, String>((ref, id) async {
  final repository = ref.read(categoryRepositoryProvider);
  return repository.getCategoryById(id);
});
