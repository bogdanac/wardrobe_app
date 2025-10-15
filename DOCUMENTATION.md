# 👔 AI-Powered Wardrobe Management App

A comprehensive Flutter application for managing your wardrobe with AI-powered outfit generation, smart recommendations, and cloud synchronization via Firebase.

## 🌟 Features

### Core Functionality
- **Digital Wardrobe Management**: Add, edit, and organize clothing items with photos
- **Cloud Sync**: Firebase-powered multi-device synchronization
- **Smart Outfit Creation**: Manual outfit builder with drag-and-drop interface
- **AI Outfit Generation**: Multiple generation algorithms with ML-enhanced recommendations
- **Advanced Search & Filtering**: Filter by category, color, season, weather, and custom tags
- **Wear Tracking**: Track usage statistics and last worn dates
- **Backup & Restore**: Complete data backup with ZIP export/import (supports legacy Isar backups)
- **Google Sign-In**: Secure authentication with Google accounts

### Smart Features
- **Background Removal**: AI-powered or manual background removal for clean item photos
- **Color Detection**: Automatic dominant color extraction from photos
- **Smart Defaults**: Auto-suggest categories, seasons, and weather based on selected items
- **Outfit Compatibility**: Smart compatibility scoring for outfit combinations
- **Bulk Operations**: Add/delete multiple items at once
- **Selection Mode**: Multi-select items to create outfits

### Analytics
- **Comprehensive Statistics**: Wear frequency, color analysis, category distribution
- **Visual Data Representation**: Charts and graphs for wardrobe insights
- **Usage Patterns**: Track seasonal preferences and style evolution

## 🏗️ Architecture

### Clean Architecture with Firebase

```
lib/
├── main.dart                           # App entry point with Firebase init
├── core/
│   ├── config/                         # Configuration (API keys, Firebase)
│   ├── services/                       # Business logic services
│   │   ├── firebase_image_service.dart # Firebase Storage management
│   │   ├── outfit_generator_service.dart # AI outfit generation
│   │   ├── ml_outfit_recommender.dart  # ML-powered recommendations
│   │   ├── backup_export_service.dart  # Export to ZIP
│   │   ├── backup_import_service.dart  # Import from ZIP/JSON
│   │   └── smart_defaults_service.dart # Smart suggestions
│   ├── themes/                         # App themes and styling
│   └── utils/                          # Utility functions
├── data/
│   └── repositories/                   # Repository implementations
│       ├── firebase_clothing_repository.dart # Firestore clothing items
│       └── firebase_outfit_repository.dart   # Firestore outfits
├── domain/
│   ├── entities/                       # Business entities
│   │   ├── clothing_item.dart         # ClothingItem entity
│   │   ├── outfit.dart                # Outfit entity
│   │   └── weather_data.dart          # Weather enums
│   └── repositories/                   # Repository interfaces
│       ├── clothing_repository.dart
│       └── outfit_repository.dart
└── presentation/
    ├── providers/                      # Riverpod state management
    │   ├── clothing_provider.dart
    │   ├── outfit_provider.dart
    │   ├── auth_provider.dart
    │   └── stats_provider.dart
    ├── screens/                        # App screens
    └── widgets/                        # Reusable UI components
```

## 📱 Screens & Navigation

### Main Navigation Structure
The app uses a **TabBar navigation** with two main tabs:

#### 1. **Closet Tab** (`lib/presentation/screens/closet_screen.dart`)
- **Grid View**: Visual browsing of all clothing items
- **Minimalist Filters**: Type, Season, Color, Category filters in horizontal scroll
- **Selection Mode**: Long-press to enter multi-select mode
- **Bulk Operations**: Delete, Archive, Create Outfit from selection
- **Quick Actions**:
  - Bulk Add: Add multiple photos from gallery
  - Add Item: Add single item with camera/gallery
- **Empty States**: Helpful onboarding for first-time users

#### 2. **Outfits Tab** (`lib/presentation/screens/outfits_screen.dart`)
- **Masonry Grid**: Pinterest-style layout for outfit cards
- **Outfit Filtering**: Filter by categories, season, weather, favorites
- **Wear Tracking**: Mark outfits as worn today
- **Quick Actions**:
  - Generate: AI-powered outfit generation modal
  - Filter: Access outfit filters
  - Create: Manual outfit creation

### Additional Screens

#### 3. **Home Screen** (`lib/presentation/screens/home_screen.dart`)
- **Unified App Bar**: Tab-specific actions in main app bar
- **Tab Controller**: Manages navigation between Closet and Outfits
- **Context Actions**: Different buttons for each tab
- **More Menu**: Access to Stats and Settings

#### 4. **Generator Screen** (`lib/presentation/screens/generator_screen.dart`)
- **Modal Bottom Sheet**: Accessed from Outfits tab
- **Unified Filters**: Categories, Season, Weather, Colors, Metallic Elements
- **ML Toggle**: Switch between rule-based and AI-enhanced generation
- **Batch Generation**: Create multiple outfit options at once
- **Smart Context**: Occasion, mood, and temperature controls for ML mode

#### 5. **Create Outfit Screen** (`lib/presentation/screens/create_outfit_screen.dart`)
- **Two-Tab Interface**: "Select Items" and "Outfit Details"
- **Smart Suggestions**: Auto-suggest categories/season based on selected items
- **Visual Preview**: See outfit composition before saving
- **Drag-and-Drop**: Reorder items in outfit

#### 6. **Add/Edit Clothing Item** (`lib/presentation/screens/add_clothing_item_screen.dart`)
- **Multi-Image Support**: Add main photo + additional images
- **Background Removal**: AI or manual background removal
- **Smart Detection**: Auto-detect colors and clothing type
- **Rich Metadata**: Name, type, colors, season, weather, categories, tags
- **Archive Option**: Archive rarely-worn items

#### 7. **Bulk Add Screen** (`lib/presentation/screens/simple_bulk_add_screen.dart`)
- **Multi-Image Picker**: Select multiple photos at once
- **Quick Processing**: Streamlined item creation
- **Progress Tracking**: See import progress

#### 8. **Statistics Screen** (`lib/presentation/screens/stats_screen.dart`)
- **Wardrobe Overview**: Total items, outfits, most worn
- **Color Distribution**: Visual breakdown of wardrobe colors
- **Category Analysis**: Distribution across clothing types
- **Wear Analytics**: Most and least worn items

#### 9. **Settings Screen** (`lib/presentation/screens/settings_screen.dart`)
- **Account Section**: Google profile, sign out
- **Image Processing**: Configure background removal method
- **Data Management**: Export/import backups
- **App Settings**: Notifications, categories, colors
- **About**: App version, help, privacy policy

## 🔥 Firebase Integration

### Firebase Services Used

#### 1. **Firebase Authentication**
- Google Sign-In for user authentication
- User ID used to partition data per user

#### 2. **Cloud Firestore**
- **Collections**:
  - `users/{userId}/clothing_items` - User's clothing items
  - `users/{userId}/outfits` - User's outfits
- **Offline Persistence**: Enabled with unlimited cache
- **Real-time Sync**: Changes sync across devices instantly

#### 3. **Firebase Storage**
- **Path Structure**: `users/{userId}/clothing_items/{itemId}/{suffix}.jpg`
- **Image Types**: main, back, detail1-3 for clothing items
- **Outfit Previews**: `users/{userId}/outfits/{outfitId}_preview.jpg`
- **Offline Support**: CachedNetworkImage for offline access

### Data Models

#### ClothingItem Entity
```dart
class ClothingItem {
  final String id;                    // Unique identifier (UUID)
  final String name;                  // Item name
  final ClothingType type;            // top, bottom, dress, shoes, etc.
  final String? imagePath;            // Firebase Storage URL or local path
  final List<String> additionalImages; // Additional image URLs
  final List<String> colors;          // Color tags
  final List<String> categories;      // Custom categories
  final Season? season;               // spring, summer, autumn, winter, allSeason
  final List<WeatherRange> weatherRanges; // veryHot to veryCold
  final String? sizeFit;              // Size/fit information
  final MetallicElements? metallicElements; // gold, silver, rose_gold, none
  final int wearCount;                // Usage tracking
  final DateTime? lastWornDate;       // Last wear timestamp
  final DateTime createdAt;           // Creation timestamp
  final DateTime updatedAt;           // Modification timestamp
  final String? notes;                // User notes
  final List<String> tags;            // Custom tags
  final bool isArchived;              // Archive flag
  final DateTime? dateArchived;       // Archive timestamp
}
```

#### Outfit Entity
```dart
class Outfit {
  final String id;                    // Unique identifier (UUID)
  final String name;                  // Outfit name
  final List<String> clothingItemIds; // Referenced clothing items
  final List<String> categories;      // Style categories
  final Season? season;               // Seasonal appropriateness
  final List<WeatherRange> weatherRanges; // Weather conditions
  final int wearCount;                // Usage tracking
  final DateTime? lastWornDate;       // Last wear timestamp
  final DateTime createdAt;           // Creation timestamp
  final DateTime updatedAt;           // Modification timestamp
  final String? notes;                // User notes
  final bool isFavorite;              // Favorite flag
  final String? imagePreviewPath;     // Firebase Storage URL for preview
  final bool isArchived;              // Archive flag
  final DateTime? dateArchived;       // Archive timestamp
}
```

### Enums

```dart
enum ClothingType {
  top, bottom, dress, outerwear, shoes, accessories, underwear
}

enum Season {
  spring, summer, autumn, winter, allSeason
}

enum WeatherRange {
  veryHot,    // 28°C+
  hot,        // 22-28°C
  warm,       // 14-22°C
  cool,       // 4-14°C
  cold,       // -4-4°C
  veryCold    // -15 to -4°C
}

enum MetallicElements {
  none, gold, silver, rose_gold
}
```

## 🤖 AI & Smart Features

### 1. **Outfit Generation Service** (`lib/core/services/outfit_generator_service.dart`)
**Purpose**: Generate outfit combinations using rule-based and ML algorithms

**Generation Strategies**:
- **Color Harmony**: Matches complementary and analogous colors
- **Type Compatibility**: Ensures valid clothing combinations (e.g., top + bottom + shoes)
- **Seasonal Matching**: Filters items by season
- **Weather Matching**: Filters items by weather appropriateness
- **Constraint Satisfaction**: Respects user filters (categories, colors, metallic elements)

### 2. **ML Outfit Recommender** (`lib/core/services/ml_outfit_recommender.dart`)
**Purpose**: Machine learning-powered outfit recommendations

**Features**:
- **Context-Aware**: Considers occasion, mood, temperature
- **Preference Learning**: Learns from user outfit history
- **Item Clustering**: Groups similar items for better combinations
- **Diversity**: Ensures varied recommendations

### 3. **Smart Defaults Service** (`lib/core/services/smart_defaults_service.dart`)
**Purpose**: Auto-suggest outfit metadata based on selected items

**Capabilities**:
- **Category Suggestions**: Analyzes item combinations to suggest outfit categories
- **Season Detection**: Determines appropriate season from item seasons
- **Weather Inference**: Suggests weather ranges based on item compatibility

### 4. **Background Removal**
**Methods Available**:
- **AI (remove.bg API)**: High-quality AI-powered removal (requires API key)
- **Manual (Flutter)**: Basic manual removal using color-based segmentation
- **None**: Keep original image

**Configuration**: `lib/core/config/background_removal_config.dart`

### 5. **Color Palette Service** (`lib/core/services/color_palette_service.dart`)
**Purpose**: Extract and analyze colors from clothing photos

**Features**:
- Dominant color detection
- Palette generation
- Color clustering
- HSL color space analysis

## 📊 State Management

### Riverpod Providers

#### Authentication
```dart
authServiceProvider          // Firebase Auth service
authStateProvider           // Current user auth state
currentUserIdProvider       // Current user ID
```

#### Clothing Items
```dart
clothingRepositoryProvider          // Clothing repository
allClothingItemsProvider           // All items (cached)
filteredClothingItemsProvider      // Filtered items
clothingItemByIdProvider(id)       // Single item lookup
clothingFilterProvider             // Filter state
```

#### Outfits
```dart
outfitRepositoryProvider           // Outfit repository
allOutfitsProvider                 // All outfits (cached)
filteredOutfitsProvider            // Filtered outfits
favoriteOutfitsProvider            // Favorite outfits only
outfitByIdProvider(id)             // Single outfit lookup
outfitFilterProvider               // Filter state
generatedOutfitsProvider           // AI-generated outfits
```

#### Statistics
```dart
wardrobeStatsProvider              // Wardrobe statistics
```

## 🎨 UI Components & Themes

### Theme System
The app uses a custom dark theme with pastel accents:

**Colors** (`lib/core/themes/app_theme.dart`):
- Primary Black: `#1A1A1A`
- Primary White: `#FFFFFF`
- Pastel Pink: `#FFB3D1`
- Darker Pink: `#FF69B4`
- Gold: `#FFD700`
- Light Gray: `#F5F5F5`
- Medium Gray: `#757575`

**Category Colors** (`lib/core/utils/category_colors.dart`):
Each outfit category has a unique color:
- Brunch: Purple
- Period Safe: Deep Pink
- Errands: Blue Gray
- Work: Indigo
- Elegant: Deep Purple
- Events: Pink
- Festivals: Orange
- Dates: Red
- Comfortable: Teal

### Key Widgets

#### **ClothingItemCard** (`lib/presentation/widgets/clothing_item_card.dart`)
- Image display with aspect ratio preservation
- Selection state with checkmark overlay
- Color chips and metadata display
- Type badge with icon

#### **OutfitCard** (`lib/presentation/widgets/outfit_card.dart`)
- Large preview image or grid of item thumbnails
- Category chips with colors
- Wear count and last worn date
- Favorite toggle
- "Wear Today" quick action

#### **AdaptiveClothingImage** (`lib/presentation/widgets/adaptive_clothing_image.dart`)
- Supports both network URLs (Firebase) and local file paths
- CachedNetworkImage for offline support
- Graceful error handling with placeholders

#### **MinimalistFilters** (`lib/presentation/widgets/minimalist_filters.dart`)
- Horizontal scrolling filter chips
- Type, Season, Color, Category filters
- Compact design for space efficiency

#### **UnifiedFilters** (`lib/presentation/widgets/unified_filters.dart`)
- Comprehensive filter UI for generator
- Categories, Seasons, Weather, Colors, Metallic Elements
- Configurable: show/hide specific filter sections

## 📦 Dependencies

### Core Dependencies
```yaml
dependencies:
  flutter: sdk: flutter

  # State Management & Navigation
  flutter_riverpod: ^2.6.1
  go_router: ^14.6.2

  # Firebase
  firebase_core: ^3.12.0
  firebase_auth: ^5.3.4
  cloud_firestore: ^5.7.0
  firebase_storage: ^12.6.0
  google_sign_in: ^6.2.2

  # Image Processing
  image_picker: ^1.1.2
  image: ^4.3.0
  cached_network_image: ^3.4.1
  http: ^1.2.2

  # UI Components
  flutter_staggered_grid_view: ^0.7.0
  flutter_colorpicker: ^1.1.0

  # Data & Files
  share_plus: ^10.1.2
  file_picker: ^8.1.4
  path_provider: ^2.1.5
  archive: ^3.6.1

  # Utilities
  equatable: ^2.0.7
  uuid: ^4.5.1
  intl: ^0.19.0

dev_dependencies:
  flutter_test: sdk: flutter
  flutter_lints: ^5.0.0
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (>=3.5.0)
- Dart (>=3.5.0)
- Firebase project configured
- Android Studio / VS Code
- Physical device or emulator

### Firebase Setup

1. **Create Firebase Project**: https://console.firebase.google.com
2. **Enable Services**:
   - Authentication (Google Sign-In)
   - Cloud Firestore
   - Firebase Storage
3. **Configure Platforms**:
   - Run `flutterfire configure`
   - Select your Firebase project
   - Select platforms (Android, iOS, Web)
4. **Security Rules**: See `FIREBASE_SECURITY_RULES.md`

### Installation

1. **Clone and Setup**:
   ```bash
   cd C:\Dev\Projects\iknow\wardrobe_app
   flutter pub get
   ```

2. **Configure Firebase**:
   ```bash
   flutterfire configure
   ```

3. **Run the App**:
   ```bash
   flutter run
   ```

### First Time Setup
1. **Sign In**: Use Google Sign-In on first launch
2. **Add Clothing Items**:
   - Use Bulk Add to quickly import multiple photos
   - Or add items one-by-one with detailed metadata
3. **Create Outfits**:
   - Manual creation via drag-and-drop
   - Or use AI Generator with your preferences
4. **Explore Features**:
   - Check Statistics for insights
   - Try different filters
   - Mark items as worn to track usage

## 🔧 Configuration

### API Keys

#### Background Removal (Optional)
If you want AI-powered background removal:

1. Get API key from https://remove.bg
2. Add to `lib/core/config/api_config.dart`:
```dart
static const String removeBgApiKey = 'YOUR_API_KEY_HERE';
```

### Theme Customization
Edit `lib/core/themes/app_theme.dart` to customize colors and styling.

## 💾 Backup & Restore

### Export Backup
1. **Settings → Data Management → Export Complete Backup**
2. Creates two files:
   - `wardrobe_backup_YYYYMMDD_HHMMSS.json` - All data
   - `wardrobe_backup_YYYYMMDD_HHMMSS.zip` - All images
3. Share or save locally

### Import Backup
1. **Settings → Data Management → Import Backup**
2. Select JSON file
3. Optionally select ZIP file (for images)
4. Supports both:
   - New Firebase backups (with Firebase URLs)
   - Legacy Isar backups (with local paths)

## 🔄 Migration from Isar

The app now uses Firebase instead of Isar. See `COMPLETE_MIGRATION_PLAN.md` for migration details.

**Legacy Support**: The import function supports old Isar backup files, automatically:
- Extracting images from ZIP
- Uploading to Firebase Storage
- Updating references to Firebase URLs

## 📈 Usage Analytics

### Tracked Metrics
- **Item-level**: Wear count, last worn date, color distribution
- **Outfit-level**: Wear count, favorite status, category usage
- **Wardrobe-level**: Total items, total outfits, most worn, least worn

### Privacy
- All data stored in user-specific Firebase collections
- No cross-user data sharing
- Google account required for authentication
- Sign out to stop cloud sync

## 🐛 Troubleshooting

### Common Issues

**Firebase Connection Issues**:
```bash
flutter clean
flutter pub get
flutterfire configure
```

**Build Issues**:
```bash
flutter clean
flutter pub get
flutter run
```

**Image Upload Fails**:
- Check Firebase Storage rules
- Verify internet connection
- Check Firebase Storage quota

**Sign-In Issues**:
- Verify SHA-1/SHA-256 fingerprints in Firebase Console
- Check Google Sign-In configuration
- Ensure Google Sign-In is enabled in Firebase Auth

**Offline Issues**:
- Images may take time to cache on first load
- Firestore offline persistence enabled by default
- Check device storage for cache space

## 📋 Development Roadmap

### Completed Features ✅
- Complete wardrobe management with Firebase sync
- AI-powered outfit generation with multiple algorithms
- Google Sign-In authentication
- Multi-device synchronization
- Offline support with caching
- Backup and restore (supports legacy Isar backups)
- Smart defaults and suggestions
- Comprehensive statistics
- Background removal (AI and manual)
- Bulk operations
- Responsive UI with custom theming

### Future Enhancements 🔄
- Weather API integration for daily outfit suggestions
- Social features (sharing outfits, following friends)
- Shopping integration (suggest items to buy based on gaps)
- Calendar integration for outfit planning
- Voice commands
- Advanced ML recommendations with feedback learning
- Augmented reality try-on features
- Web support with responsive design

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 👥 Contributing

Contributions are welcome! Please feel free to submit pull requests or open issues for bugs and feature requests.

---

**Built with ❤️ using Flutter, Riverpod, and Firebase**

*Last Updated: January 2025*
