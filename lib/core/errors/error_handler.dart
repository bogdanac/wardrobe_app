import 'package:flutter/material.dart';
import 'dart:io';
import 'app_exceptions.dart';
import '../themes/app_theme.dart';

class ErrorHandler {
  static final ErrorHandler _instance = ErrorHandler._internal();
  factory ErrorHandler() => _instance;
  ErrorHandler._internal();

  /// Convert platform errors to app-specific exceptions
  AppException handleError(dynamic error, {String? context}) {
    if (error is AppException) {
      return error;
    }

    // Network errors
    if (error is SocketException || error is HttpException) {
      return NetworkException(
        'Network connection failed',
        code: 'no_internet',
        originalError: error,
      );
    }

    // File system errors
    if (error is FileSystemException) {
      String code = 'file_error';
      String message = 'File operation failed';
      
      if (error.message.contains('Permission denied')) {
        code = 'permission_denied';
        message = 'Access denied to file system';
      } else if (error.message.contains('No space left')) {
        code = 'no_space';
        message = 'Insufficient storage space';
      } else if (error.message.contains('No such file')) {
        code = 'file_not_found';
        message = 'File not found';
      }
      
      return FileException(message, code: code, originalError: error);
    }

    // Format errors (for image processing)
    if (error is FormatException) {
      return ImageProcessingException(
        'Invalid image format',
        code: 'invalid_format',
        originalError: error,
      );
    }

    // Timeout errors
    if (error.toString().contains('timeout') || error.toString().contains('TimeoutException')) {
      return NetworkException(
        'Operation timed out',
        code: 'timeout',
        originalError: error,
      );
    }

    // Generic error
    return GeneralException(
      context != null ? '$context: ${error.toString()}' : error.toString(),
      originalError: error,
    );
  }

  /// Show user-friendly error message
  void showErrorDialog(BuildContext context, AppException exception) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(
              _getErrorIcon(exception),
              color: AppTheme.error,
              size: 24,
            ),
            const SizedBox(width: 8),
            const Text('Error'),
          ],
        ),
        content: Text(exception.userFriendlyMessage),
        actions: [
          if (exception.isRetryable)
            TextButton(
              onPressed: () => Navigator.of(context).pop('retry'),
              child: const Text('Retry'),
            ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  /// Show error snackbar
  void showErrorSnackBar(BuildContext context, AppException exception) {
    final messenger = ScaffoldMessenger.of(context);
    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              _getErrorIcon(exception),
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                exception.userFriendlyMessage,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        backgroundColor: AppTheme.error,
        duration: const Duration(seconds: 4),
        action: exception.isRetryable
            ? SnackBarAction(
                label: 'Retry',
                textColor: Colors.white,
                onPressed: () {
                  // Callback handled by caller
                },
              )
            : null,
      ),
    );
  }

  /// Show success message
  void showSuccessSnackBar(BuildContext context, String message) {
    final messenger = ScaffoldMessenger.of(context);
    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(
              Icons.check_circle_outline,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        backgroundColor: AppTheme.success,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  /// Show info message
  void showInfoSnackBar(BuildContext context, String message) {
    final messenger = ScaffoldMessenger.of(context);
    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(
              Icons.info_outline,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        backgroundColor: AppTheme.info,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  /// Show warning message
  void showWarningSnackBar(BuildContext context, String message) {
    final messenger = ScaffoldMessenger.of(context);
    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(
              Icons.warning_outlined,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        backgroundColor: AppTheme.warning,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  IconData _getErrorIcon(AppException exception) {
    switch (exception.runtimeType) {
      case NetworkException _:
        return Icons.wifi_off;
      case DatabaseException _:
        return Icons.storage;
      case FileSystemException _:
        return Icons.folder_off;
      case ImageProcessingException _:
        return Icons.image_not_supported;
      case ValidationException _:
        return Icons.error_outline;
      case PermissionException _:
        return Icons.lock_outline;
      case ClothingItemException _:
        return Icons.checkroom;
      case OutfitGenerationException _:
        return Icons.auto_awesome_outlined;
      case BackupException _:
        return Icons.backup;
      default:
        return Icons.error_outline;
    }
  }
}

// Extension to add error constants to AppTheme
extension AppThemeErrors on AppTheme {
  static const Color error = Color(0xFFF44336);
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color info = Color(0xFF2196F3);
}