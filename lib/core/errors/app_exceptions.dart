
/// Custom exceptions for the wardrobe app
abstract class AppException implements Exception {
  final String message;
  final String? code;
  final dynamic originalError;
  
  const AppException(this.message, {this.code, this.originalError});
  
  @override
  String toString() => 'AppException: $message';
}

/// General purpose exception
class GeneralException extends AppException {
  const GeneralException(super.message, {super.code, super.originalError});
}

/// Network related exceptions
class NetworkException extends AppException {
  const NetworkException(super.message, {super.code, super.originalError});
}

/// Database related exceptions
class DatabaseException extends AppException {
  const DatabaseException(super.message, {super.code, super.originalError});
}

/// File system related exceptions
class FileException extends AppException {
  const FileException(super.message, {super.code, super.originalError});
}

/// Image processing related exceptions
class ImageProcessingException extends AppException {
  const ImageProcessingException(super.message, {super.code, super.originalError});
}

/// Validation related exceptions
class ValidationException extends AppException {
  final Map<String, String>? fieldErrors;
  
  const ValidationException(super.message, {this.fieldErrors, super.code, super.originalError});
}

/// Permission related exceptions
class PermissionException extends AppException {
  const PermissionException(super.message, {super.code, super.originalError});
}

/// Authentication related exceptions
class AuthException extends AppException {
  const AuthException(super.message, {super.code, super.originalError});
}

/// Clothing item related exceptions
class ClothingItemException extends AppException {
  const ClothingItemException(super.message, {super.code, super.originalError});
}

/// Outfit generation related exceptions
class OutfitGenerationException extends AppException {
  const OutfitGenerationException(super.message, {super.code, super.originalError});
}

/// Backup/restore related exceptions
class BackupException extends AppException {
  const BackupException(super.message, {super.code, super.originalError});
}

/// Extension to provide user-friendly messages
extension AppExceptionExtension on AppException {
  String get userFriendlyMessage {
    switch (runtimeType) {
      case NetworkException _:
        return _getNetworkErrorMessage();
      case DatabaseException _:
        return 'There was an issue accessing your data. Please try again.';
      case FileException _:
        return 'Unable to access files. Please check your storage permissions.';
      case ImageProcessingException _:
        return 'Failed to process the image. Please try with a different photo.';
      case ValidationException _:
        return 'Please check your input and try again.';
      case PermissionException _:
        return 'This feature requires additional permissions. Please grant access in settings.';
      case ClothingItemException _:
        return 'Unable to save the clothing item. Please try again.';
      case OutfitGenerationException _:
        return 'Unable to generate outfit suggestions. Please ensure you have enough clothing items.';
      case BackupException _:
        return 'Backup operation failed. Please check your storage space and try again.';
      default:
        return 'Something went wrong. Please try again later.';
    }
  }
  
  String _getNetworkErrorMessage() {
    if (code == 'no_internet') {
      return 'No internet connection. Please check your network settings.';
    } else if (code == 'timeout') {
      return 'Request timed out. Please try again.';
    } else if (code == 'server_error') {
      return 'Server is currently unavailable. Please try again later.';
    }
    return 'Network error occurred. Please check your internet connection.';
  }
  
  bool get isRetryable {
    switch (runtimeType) {
      case NetworkException _:
        return true;
      case DatabaseException _:
        return false; // Usually indicates data corruption
      case FileException _:
        return code != 'permission_denied';
      case ImageProcessingException _:
        return false; // Usually indicates bad image format
      case ValidationException _:
        return false; // User needs to fix input
      case PermissionException _:
        return false; // User needs to grant permission
      default:
        return true;
    }
  }
}