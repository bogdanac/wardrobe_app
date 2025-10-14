import '../../domain/repositories/clothing_repository.dart';

// Conditional imports - only import platform-specific code when needed
import 'clothing_repository_stub.dart'
    if (dart.library.io) 'clothing_repository_mobile.dart'
    if (dart.library.html) 'clothing_repository_web.dart';

ClothingRepository createClothingRepository() {
  return createPlatformClothingRepository();
}
