import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:uuid/uuid.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class FirebaseImageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final _uuid = const Uuid();
  final String? _userId;

  FirebaseImageService({String? userId}) : _userId = userId;

  String get _storagePath => _userId != null ? 'users/$_userId/images' : 'images';

  /// Upload image to Firebase Storage and return download URL
  Future<String> uploadImage(File image, {String? customPath}) async {
    final fileName = '${_uuid.v4()}.jpg';
    final path = customPath ?? '$_storagePath/$fileName';

    final ref = _storage.ref().child(path);

    if (kIsWeb) {
      // Web: read as bytes
      final bytes = await image.readAsBytes();
      await ref.putData(bytes);
    } else {
      // Mobile: upload file directly
      await ref.putFile(image);
    }

    return await ref.getDownloadURL();
  }

  /// Upload image from bytes (useful for web)
  Future<String> uploadImageBytes(Uint8List bytes, {String? customPath}) async {
    final fileName = '${_uuid.v4()}.jpg';
    final path = customPath ?? '$_storagePath/$fileName';

    final ref = _storage.ref().child(path);
    await ref.putData(bytes);

    return await ref.getDownloadURL();
  }

  /// Upload multiple images and return list of URLs
  Future<List<String>> uploadImages(List<File> images) async {
    final urls = <String>[];
    for (final image in images) {
      final url = await uploadImage(image);
      urls.add(url);
    }
    return urls;
  }

  /// Delete image from Firebase Storage
  Future<void> deleteImage(String imageUrl) async {
    try {
      final ref = _storage.refFromURL(imageUrl);
      await ref.delete();
    } catch (e) {
      // Image might already be deleted or URL is invalid
    }
  }

  /// Delete multiple images
  Future<void> deleteImages(List<String> imageUrls) async {
    for (final url in imageUrls) {
      await deleteImage(url);
    }
  }

  /// Get image metadata
  Future<FullMetadata?> getImageMetadata(String imageUrl) async {
    try {
      final ref = _storage.refFromURL(imageUrl);
      return await ref.getMetadata();
    } catch (e) {
      return null;
    }
  }

  /// Pick image from gallery
  Future<File?> pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  /// Pick image from camera
  Future<File?> pickImageFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  /// Pick multiple images from gallery
  Future<List<File>> pickMultipleImagesFromGallery() async {
    final picker = ImagePicker();
    final pickedFiles = await picker.pickMultiImage();
    return pickedFiles.map((xFile) => File(xFile.path)).toList();
  }

  /// Upload picked image directly to Firebase and return URL
  Future<String?> pickAndUploadImage({bool fromCamera = false}) async {
    final File? image = fromCamera
        ? await pickImageFromCamera()
        : await pickImageFromGallery();

    if (image != null) {
      return await uploadImage(image);
    }
    return null;
  }

  /// Upload multiple picked images and return URLs
  Future<List<String>> pickAndUploadMultipleImages() async {
    final images = await pickMultipleImagesFromGallery();
    return await uploadImages(images);
  }

  /// Check if URL is a Firebase Storage URL
  bool isFirebaseUrl(String? url) {
    if (url == null) return false;
    return url.contains('firebasestorage.googleapis.com') ||
           url.contains('firebasestorage.app');
  }

  /// Download image from Firebase Storage URL to local file
  Future<File> downloadImageToLocal(String imageUrl) async {
    try {
      // Download image from URL
      final response = await http.get(Uri.parse(imageUrl));
      if (response.statusCode != 200) {
        throw Exception('Failed to download image: ${response.statusCode}');
      }

      // Save to temporary directory
      final tempDir = await getTemporaryDirectory();
      final fileName = '${_uuid.v4()}.jpg';
      final localFile = File('${tempDir.path}/$fileName');
      await localFile.writeAsBytes(response.bodyBytes);

      return localFile;
    } catch (e) {
      throw Exception('Failed to download image from Firebase: $e');
    }
  }

  /// Get file size in bytes
  Future<int?> getFileSize(String imageUrl) async {
    try {
      final metadata = await getImageMetadata(imageUrl);
      return metadata?.size;
    } catch (e) {
      return null;
    }
  }

  /// List all images in user's storage
  Future<List<String>> listAllImages() async {
    try {
      final ref = _storage.ref().child(_storagePath);
      final result = await ref.listAll();

      final urls = <String>[];
      for (final item in result.items) {
        final url = await item.getDownloadURL();
        urls.add(url);
      }
      return urls;
    } catch (e) {
      return [];
    }
  }

  /// Get storage usage in bytes
  Future<int> getStorageUsage() async {
    try {
      final ref = _storage.ref().child(_storagePath);
      final result = await ref.listAll();

      int totalSize = 0;
      for (final item in result.items) {
        final metadata = await item.getMetadata();
        totalSize += metadata.size ?? 0;
      }
      return totalSize;
    } catch (e) {
      return 0;
    }
  }

  /// Clean up unused images (images not referenced in any document)
  Future<void> cleanupUnusedImages(List<String> referencedUrls) async {
    final allUrls = await listAllImages();
    final unusedUrls = allUrls.where((url) => !referencedUrls.contains(url)).toList();

    for (final url in unusedUrls) {
      await deleteImage(url);
    }
  }
}
