import 'package:flutter/foundation.dart' show kIsWeb;
import '../../domain/repositories/clothing_repository.dart';
import '../../domain/repositories/outfit_repository.dart';
import '../../data/repositories/firebase_clothing_repository.dart';
import '../../data/repositories/clothing_repository_impl.dart';
import 'firebase_image_service.dart';
import 'image_service.dart';

/// Factory to provide the appropriate storage implementation based on platform
class StorageProviderFactory {
  static bool _useFirebase = kIsWeb;
  static String? _userId;

  /// Set whether to use Firebase (cloud) or local storage
  static void setUseFirebase(bool useFirebase) {
    _useFirebase = useFirebase;
  }

  /// Set the current user ID for multi-user support
  static void setUserId(String? userId) {
    _userId = userId;
  }

  /// Get the appropriate ClothingRepository implementation
  static ClothingRepository getClothingRepository() {
    if (_useFirebase) {
      return FirebaseClothingRepository(userId: _userId);
    } else {
      return ClothingRepositoryImpl();
    }
  }

  /// Get the appropriate image service implementation
  static dynamic getImageService() {
    if (_useFirebase) {
      return FirebaseImageService(userId: _userId);
    } else {
      return ImageService();
    }
  }

  /// Check if currently using Firebase
  static bool get isUsingFirebase => _useFirebase;

  /// Check if currently using local storage
  static bool get isUsingLocalStorage => !_useFirebase;

  /// Get storage type label
  static String get storageTypeLabel => _useFirebase ? 'Cloud' : 'Local';
}

/// Extension to make it easier to check storage mode
extension StorageModeExtension on StorageProviderFactory {
  static bool get isCloudMode => StorageProviderFactory.isUsingFirebase;
  static bool get isLocalMode => StorageProviderFactory.isUsingLocalStorage;
}
