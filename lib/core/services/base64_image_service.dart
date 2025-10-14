import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;

/// Alternative image service that stores images as Base64 in Firestore
/// This works without Firebase Storage (no billing required)
///
/// WARNING: This stores images directly in Firestore documents
/// Firestore has a 1MB document size limit, so images must be compressed
class Base64ImageService {
  /// Compress and convert image to Base64 string
  Future<String> imageToBase64(File imageFile, {int quality = 70}) async {
    final bytes = await imageFile.readAsBytes();

    // Decode and compress image
    final image = img.decodeImage(bytes);
    if (image == null) throw Exception('Failed to decode image');

    // Resize if too large (max 800px width/height)
    img.Image resized = image;
    if (image.width > 800 || image.height > 800) {
      resized = img.copyResize(
        image,
        width: image.width > image.height ? 800 : null,
        height: image.height > image.width ? 800 : null,
      );
    }

    // Compress to JPEG
    final compressed = img.encodeJpg(resized, quality: quality);

    // Convert to Base64
    return base64Encode(compressed);
  }

  /// Convert Base64 string back to image bytes
  Uint8List base64ToImageBytes(String base64String) {
    return base64Decode(base64String);
  }

  /// Pick image from gallery and convert to Base64
  Future<String?> pickAndConvertToBase64({bool fromCamera = false}) async {
    final picker = ImagePicker();
    final XFile? pickedFile = fromCamera
        ? await picker.pickImage(source: ImageSource.camera)
        : await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final file = File(pickedFile.path);
      return await imageToBase64(file);
    }
    return null;
  }

  /// Pick multiple images and convert to Base64 list
  Future<List<String>> pickMultipleAndConvertToBase64() async {
    final picker = ImagePicker();
    final List<XFile> pickedFiles = await picker.pickMultiImage();

    final List<String> base64Images = [];
    for (final pickedFile in pickedFiles) {
      final file = File(pickedFile.path);
      final base64 = await imageToBase64(file);
      base64Images.add(base64);
    }
    return base64Images;
  }

  /// Get estimated size of Base64 string in KB
  int getBase64SizeKB(String base64String) {
    return (base64String.length * 0.75 / 1024).round(); // Base64 is ~33% larger
  }

  /// Check if image size is within Firestore limits (< 1MB recommended)
  bool isWithinFirestoreLimit(String base64String) {
    return getBase64SizeKB(base64String) < 900; // Keep under 900KB to be safe
  }
}
