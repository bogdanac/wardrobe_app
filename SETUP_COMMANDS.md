# Firebase Setup Commands

After enabling Firestore, Storage, and Authentication in Firebase Console, run these commands:

## 1. Install Firebase CLI (if not already installed)
```bash
npm install -g firebase-tools
```

## 2. Install FlutterFire CLI
```bash
dart pub global activate flutterfire_cli
```

## 3. Login to Firebase
```bash
firebase login
```

## 4. Configure Your Flutter App
```bash
flutterfire configure --project=wardrobe-app
```

**What this does:**
- Creates `firebase_options.dart` in your `lib/` folder
- Configures Firebase for Android, iOS, and Web
- Sets up all the connection details

## 5. Initialize Firebase in Your App

Add this to the top of `lib/main.dart`:
```dart
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
```

Then update your `main()` function to:
```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: MyApp()));
}
```

## 6. Test on Web
```bash
flutter run -d chrome
```

## Troubleshooting

### Can't find `flutterfire` command
Make sure Dart pub bin is in your PATH:
```bash
# Windows
set PATH=%PATH%;%LOCALAPPDATA%\Pub\Cache\bin

# Or add to environment variables permanently
```

### Firebase login fails
Try:
```bash
firebase login --reauth
```

### Project not found
Make sure you used the correct project name when running:
```bash
flutterfire configure --project=YOUR_PROJECT_ID
```
(Find your project ID in Firebase Console → Project Settings)
