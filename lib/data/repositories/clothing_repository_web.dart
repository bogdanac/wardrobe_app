import '../../domain/repositories/clothing_repository.dart';
import 'firebase_clothing_repository.dart';

ClothingRepository createPlatformClothingRepository() {
  return FirebaseClothingRepository(); // Uses Firebase for cloud storage
}
