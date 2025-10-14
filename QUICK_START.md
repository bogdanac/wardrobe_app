# Quick Start Guide - Firebase & Web Deployment

## TL;DR - Get Your App on the Web in 10 Minutes

### Prerequisites
```bash
npm install -g firebase-tools
dart pub global activate flutterfire_cli
```

### 5 Simple Steps

#### 1. Create Firebase Project (2 min)
- Go to https://console.firebase.google.com/
- Click "Add project" → Enter name "wardrobe-app" → Create

#### 2. Enable Services in Firebase Console (2 min)
- **Firestore**: Click "Firestore Database" → Create database → Test mode → Enable
- **Storage**: Click "Storage" → Get started → Test mode → Done
- **Auth**: Click "Authentication" → Get started → Email/Password → Enable

#### 3. Configure Firebase (1 min)
```bash
firebase login
cd C:\Dev\Projects\iknow\wardrobe_app
flutterfire configure --project=wardrobe-app
```
Select all platforms when prompted.

#### 4. Update main.dart (1 min)
Open `lib/main.dart` and add at the top:
```dart
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
```

Then update the `main()` function:
```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: MyApp()));
}
```

#### 5. Test It! (1 min)
```bash
flutter run -d chrome
```

## Done! 🎉

Your app is now running on the web with cloud storage!

## Optional: Deploy to Firebase Hosting (3 min)

```bash
# Build
flutter build web

# Initialize hosting
firebase init hosting
# Choose: build/web as public directory
# Configure as single-page app: Yes

# Deploy
firebase deploy --only hosting
```

Your app is now live at: `https://wardrobe-app.web.app`

## What You Get

✅ Web app running in browser
✅ Cloud database (Firestore)
✅ Cloud image storage (Firebase Storage)
✅ User authentication
✅ Multi-device sync
✅ Free hosting

## Switching Between Local and Cloud

The app automatically:
- Uses **Cloud (Firebase)** when running on web
- Can use **Local (Isar)** when running on mobile

## Need Help?

- 📖 Full guide: See [FIREBASE_SETUP_GUIDE.md](FIREBASE_SETUP_GUIDE.md)
- 📝 Details: See [FIREBASE_MIGRATION_SUMMARY.md](FIREBASE_MIGRATION_SUMMARY.md)
- 🐛 Issues: Check Firebase Console logs

## Pro Tips

1. **Start in Test Mode**: Security rules are open (easy testing)
2. **Update Security Rules**: Before going public, secure your data
3. **Monitor Usage**: Check Firebase Console → Usage tab
4. **Free Tier**: You get 50K reads/day and 1GB storage FREE

## Common Commands

```bash
# Run on web
flutter run -d chrome

# Build for web
flutter build web

# Deploy to Firebase
firebase deploy

# View logs
firebase functions:log
```

That's it! Your wardrobe app is now cloud-enabled and web-ready! 🚀
