# Firebase Setup Guide for Wardrobe App

This guide will help you set up Firebase for your wardrobe app to enable cloud sync and web deployment.

## Prerequisites
- Firebase CLI installed: `npm install -g firebase-tools`
- Flutter SDK installed
- A Google account

## Step 1: Create Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Click "Add project"
3. Enter project name: `wardrobe-app` (or your preferred name)
4. Enable Google Analytics (optional)
5. Click "Create project"

## Step 2: Configure Firebase for Flutter

### Install FlutterFire CLI
```bash
dart pub global activate flutterfire_cli
```

### Configure Firebase
```bash
# Login to Firebase
firebase login

# Configure Flutter app with Firebase
flutterfire configure --project=wardrobe-app
```

This will:
- Create `firebase_options.dart` in your `lib/` folder
- Add Firebase configuration for all platforms (Android, iOS, Web)

## Step 3: Enable Firebase Services

### In Firebase Console:

1. **Firestore Database**
   - Go to "Firestore Database"
   - Click "Create database"
   - Start in **test mode** (we'll add security rules later)
   - Choose your region
   - Click "Enable"

2. **Firebase Storage**
   - Go to "Storage"
   - Click "Get started"
   - Start in **test mode**
   - Click "Done"

3. **Authentication** (Optional but recommended)
   - Go to "Authentication"
   - Click "Get started"
   - Enable "Email/Password" and/or "Google" sign-in
   - Click "Save"

## Step 4: Update Main.dart

Update your `lib/main.dart` to initialize Firebase:

```dart
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: MyApp()));
}
```

## Step 5: Update Providers to Use Firebase

The app now has both local (Isar) and cloud (Firebase) repository implementations.

### Option A: Use Firebase Only (for web)
In `lib/presentation/providers/clothing_provider.dart`:

```dart
import '../data/repositories/firebase_clothing_repository.dart';

final clothingRepositoryProvider = Provider<ClothingRepository>((ref) {
  return FirebaseClothingRepository();
});
```

### Option B: Use Hybrid Approach (local + cloud sync)
Keep using local storage but add Firebase sync in the background:

```dart
final clothingRepositoryProvider = Provider<ClothingRepository>((ref) {
  // Use local for mobile, Firebase for web
  if (kIsWeb) {
    return FirebaseClothingRepository();
  } else {
    return ClothingRepositoryImpl(); // Your existing Isar implementation
  }
});
```

## Step 6: Configure Firestore Security Rules

In Firebase Console > Firestore Database > Rules:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Allow authenticated users to read/write their own data
    match /users/{userId}/{document=**} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }

    // For unauthenticated mode (testing only!)
    match /{document=**} {
      allow read, write: if true;  // CHANGE THIS IN PRODUCTION!
    }
  }
}
```

## Step 7: Configure Storage Security Rules

In Firebase Console > Storage > Rules:

```javascript
rules_version = '2';
service firebase.storage {
  match /b/{bucket}/o {
    // Allow authenticated users to upload/read their images
    match /users/{userId}/{allPaths=**} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }

    // For unauthenticated mode (testing only!)
    match /{allPaths=**} {
      allow read, write: if true;  // CHANGE THIS IN PRODUCTION!
    }
  }
}
```

## Step 8: Update ImageService for Cloud Storage

The `ImageService` needs to upload images to Firebase Storage instead of local storage.

Create `lib/core/services/firebase_image_service.dart`:

```dart
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class FirebaseImageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final _uuid = const Uuid();

  Future<String> uploadImage(File image, {String? userId}) async {
    final fileName = '${_uuid.v4()}.jpg';
    final path = userId != null ? 'users/$userId/images/$fileName' : 'images/$fileName';

    final ref = _storage.ref().child(path);
    await ref.putFile(image);

    return await ref.getDownloadURL();
  }

  Future<void> deleteImage(String imageUrl) async {
    final ref = _storage.refFromURL(imageUrl);
    await ref.delete();
  }
}
```

## Step 9: Test Web Build

```bash
# Run in Chrome
flutter run -d chrome

# Build for production
flutter build web

# The output will be in: build/web/
```

## Step 10: Deploy to Firebase Hosting (Optional)

```bash
# Initialize Firebase Hosting
firebase init hosting

# Choose "build/web" as your public directory
# Configure as single-page app: Yes
# Set up automatic builds: No

# Deploy
firebase deploy --only hosting
```

Your app will be live at: `https://your-project-id.web.app`

## Step 11: Add Authentication (Recommended)

Update `main.dart` to handle authentication:

```dart
import 'package:firebase_auth/firebase_auth.dart';

class AuthWrapper extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        if (snapshot.hasData) {
          // User is signed in
          return HomeScreen();
        } else {
          // User is NOT signed in
          return LoginScreen();
        }
      },
    );
  }
}
```

## Storage Comparison

| Feature | Local (Isar) | Firebase |
|---------|-------------|----------|
| Offline support | ✅ Yes | ❌ Limited |
| Multi-device sync | ❌ No | ✅ Yes |
| Web support | ❌ No | ✅ Yes |
| Speed | ⚡ Very fast | 🌐 Network dependent |
| Storage limit | 📱 Device only | ☁️ Generous free tier |
| Cost | Free | Free tier: 1GB storage, 50K reads/day |

## Recommended Approach

**Hybrid Solution:**
- Use Isar for mobile apps (fast, offline-first)
- Use Firebase for web app
- Optionally implement background sync between local and cloud

## Firebase Free Tier Limits

- **Firestore**: 1 GB storage, 50K document reads/day, 20K writes/day
- **Storage**: 5 GB total, 1 GB uploaded/day, 10 GB downloaded/day
- **Hosting**: 10 GB storage, 360 MB/day transfer

## Next Steps

1. ✅ Firebase dependencies added to pubspec.yaml
2. ⬜ Run `flutterfire configure`
3. ⬜ Update main.dart with Firebase initialization
4. ⬜ Test on web: `flutter run -d chrome`
5. ⬜ Deploy to Firebase Hosting

## Troubleshooting

### "Firebase not initialized"
- Make sure `Firebase.initializeApp()` is called before `runApp()`
- Ensure `firebase_options.dart` exists

### "Permission denied" errors
- Check Firestore and Storage security rules
- For testing, temporarily use permissive rules (⚠️ not for production!)

### Web build fails
- Run `flutter clean` and `flutter pub get`
- Make sure all Firebase packages support web

## Support

- [FlutterFire Documentation](https://firebase.flutter.dev/)
- [Firebase Console](https://console.firebase.google.com/)
- [Firebase CLI Reference](https://firebase.google.com/docs/cli)
