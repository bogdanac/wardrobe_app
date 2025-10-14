import '../../domain/repositories/clothing_repository.dart';

ClothingRepository createPlatformClothingRepository() {
  throw UnsupportedError(
    'Platform not supported. This app requires either dart:io (mobile) or dart:html (web).',
  );
}
