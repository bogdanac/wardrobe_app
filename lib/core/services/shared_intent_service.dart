import 'dart:io';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../presentation/screens/simple_bulk_add_screen.dart';

class SharedIntentService {
  static final SharedIntentService _instance = SharedIntentService._internal();
  factory SharedIntentService() => _instance;
  SharedIntentService._internal();

  void initializeSharedIntentListeners(BuildContext context) {
    // Only initialize on mobile platforms (not web)
    if (kIsWeb) {
      debugPrint('Shared intent not supported on web, skipping initialization');
      return;
    }

    // Listen for shared images when app is in memory
    ReceiveSharingIntent.instance.getMediaStream().listen(
      (List<SharedMediaFile> files) {
        if (context.mounted) {
          _handleSharedMedia(context, files);
        }
      },
      onError: (err) {
        debugPrint('Error receiving shared media: $err');
      },
    );

    // Handle shared images when app is launched from share intent
    ReceiveSharingIntent.instance.getInitialMedia().then(
      (List<SharedMediaFile> files) {
        if (files.isNotEmpty) {
          // Wait for the app to finish initializing before navigating
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (context.mounted) {
              _handleSharedMedia(context, files);
            }
          });
        }
      },
    );
  }

  void _handleSharedMedia(BuildContext context, List<SharedMediaFile> files) {
    if (files.isEmpty) return;

    // Filter for image files only
    final imageFiles = files
        .where((file) => _isImageFile(file.path))
        .map((file) => File(file.path))
        .toList();

    if (imageFiles.isNotEmpty) {
      // Navigate to bulk add screen with shared images
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => SimpleBulkAddScreen(preSelectedImages: imageFiles),
        ),
      );
    }
  }

  bool _isImageFile(String path) {
    final extensions = ['.jpg', '.jpeg', '.png', '.gif', '.bmp', '.webp'];
    final lowercasePath = path.toLowerCase();
    return extensions.any((ext) => lowercasePath.endsWith(ext));
  }

  void dispose() {
    // Clean up any listeners if needed (only on mobile)
    if (!kIsWeb) {
      ReceiveSharingIntent.instance.reset();
    }
  }
}

// Provider for the shared intent service
final sharedIntentServiceProvider = Provider<SharedIntentService>((ref) {
  return SharedIntentService();
});