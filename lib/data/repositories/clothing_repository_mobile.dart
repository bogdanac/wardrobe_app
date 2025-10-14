import '../../domain/repositories/clothing_repository.dart';
import 'clothing_repository_impl.dart';

ClothingRepository createPlatformClothingRepository() {
  return ClothingRepositoryImpl(); // Uses Isar for local storage
}
