# 👔 AI-Powered Wardrobe Management App

A comprehensive Flutter application for managing your wardrobe with real AI-powered outfit recommendations, machine learning feedback systems, and computer vision analysis.

## 🌟 Features

### Core Functionality
- **Digital Wardrobe Management**: Add, edit, and organize clothing items with photos
- **Smart Outfit Creation**: Manual drag-and-drop outfit builder with real-time compatibility checking
- **AI Outfit Generation**: Multiple generation algorithms including rule-based and ML-enhanced
- **Advanced Search & Filtering**: Filter by category, color, season, weather, and custom tags
- **Wear Tracking**: Track usage statistics and last worn dates
- **Backup & Restore**: Complete data backup with JSON export/import

### AI & Machine Learning Features
- **Preference Learning**: Learns from like/dislike feedback to personalize recommendations
- **Computer Vision Analysis**: Analyzes clothing photos for color, texture, and style classification
- **Collaborative Filtering**: Finds similar users and recommends based on their preferences
- **Fashion Trend Integration**: Incorporates current fashion trends with personal style
- **Smart Compatibility Scoring**: Uses ML to rate outfit combinations
- **Contextual Recommendations**: Different suggestions for different occasions and contexts

### Advanced Analytics
- **Comprehensive Statistics**: Wear frequency, color analysis, category distribution
- **Visual Data Representation**: Charts and graphs for wardrobe insights
- **Usage Patterns**: Track seasonal preferences and style evolution
- **Recommendation Confidence**: Shows reliability scores for AI suggestions

## 🏗️ Architecture

### Clean Architecture Implementation
```
lib/
├── main.dart                           # App entry point
├── core/                              # Core functionality
│   ├── constants/                     # App constants and themes
│   ├── services/                      # Business logic services
│   └── utils/                         # Utility functions
├── data/                              # Data layer
│   ├── models/                        # Isar database models
│   └── repositories/                  # Repository implementations
├── domain/                            # Domain layer
│   ├── entities/                      # Business entities
│   └── repositories/                  # Repository interfaces
└── presentation/                      # Presentation layer
    ├── providers/                     # Riverpod state management
    ├── screens/                       # App screens
    └── widgets/                       # Reusable UI components
```

## 📱 Screens & Navigation

### 1. Closet Screen (`lib/presentation/screens/closet_screen.dart`)
- **Grid View**: Visual browsing of all clothing items
- **Advanced Filtering**: Category, color, season, weather filters
- **Search Functionality**: Find items by name or description
- **Quick Actions**: Add new items, edit existing ones
- **Sorting Options**: By date added, name, wear count, or last worn

### 2. Outfits Screen (`lib/presentation/screens/outfits_screen.dart`)
- **Outfit Gallery**: Visual grid of saved outfits
- **Filtering & Search**: Find outfits by season, weather, or tags
- **Wear Tracking**: Mark outfits as worn and track usage
- **Favorite System**: Star favorite outfits for quick access
- **AI Scoring**: See compatibility scores for each outfit

### 3. Generator Screen (`lib/presentation/screens/generator_screen.dart`)
- **Smart Generation**: Multiple AI-powered generation modes
- **Filter Controls**: Season, weather, color, and category preferences
- **Batch Generation**: Create multiple outfit options at once
- **ML Enhancement**: Toggle between rule-based and AI-enhanced generation
- **Feedback Integration**: Like/dislike buttons to improve future recommendations

### 4. Statistics Screen (`lib/presentation/screens/stats_screen.dart`)
- **Usage Analytics**: Comprehensive wear statistics and trends
- **Color Analysis**: Visual breakdown of wardrobe color distribution
- **Category Insights**: Distribution across clothing types
- **Seasonal Tracking**: Seasonal preference analysis
- **ML Insights**: Show learned preferences and recommendation confidence

### 5. Settings Screen (`lib/presentation/screens/settings_screen.dart`)
- **App Preferences**: Theme, notifications, and display options
- **Data Management**: Backup, restore, and data export options
- **ML Settings**: Configure learning sensitivity and feedback preferences
- **Account Settings**: User profile and preference management

## 🤖 AI & Machine Learning Systems

### 1. Feedback Learning System (`lib/core/services/ml_feedback_service.dart`)
**Purpose**: Learn user style preferences from interactions

**Key Features**:
- **Adaptive Learning**: Uses learning rate (0.1) and decay factor (0.95)
- **Multi-dimensional Preferences**: Tracks colors, categories, combinations, weather, seasons
- **Feedback Types**: Love (0.8), Like (0.4), Worn (0.6), Dislike (-0.4), Skipped (-0.2)
- **Confidence Building**: Requires minimum 5 feedbacks for reliable recommendations
- **Real-time Updates**: Preferences update immediately after each interaction

**Data Models**:
- `UserFeedback`: Individual feedback records with context
- `UserPreferences`: Learned preference scores across multiple dimensions

### 2. Computer Vision Service (`lib/core/services/computer_vision_service.dart`)
**Purpose**: Analyze clothing photos for automated classification and style insights

**Capabilities**:
- **Color Extraction**: Dominant color analysis with quantization
- **Texture Analysis**: Smoothness, contrast, and entropy measurements
- **Shape Recognition**: Compactness, aspect ratio, and fill pattern analysis
- **Style Classification**: Automatic categorization (casual, formal, bohemian, minimalist)
- **Quality Assessment**: Image sharpness and resolution scoring
- **Outfit Harmony**: Multi-item compatibility analysis

**Analysis Output**:
```dart
ClothingItemAnalysis {
  dominantColors: [Color(0xFF...), ...],
  textureFeatures: {smoothness: 0.8, contrast: 0.6, entropy: 0.4},
  shapeFeatures: {fillRatio: 0.7, aspectRatio: 0.5, compactness: 0.8},
  suggestedStyle: 'minimalist',
  qualityScore: 0.85
}
```

### 3. Fashion ML Service (`lib/core/services/fashion_ml_service.dart`)
**Purpose**: Advanced recommendation engine with trend analysis and collaborative filtering

**Core Components**:
- **Fashion Trends**: Built-in trend database with popularity scores
- **Personalization Engine**: Combines user preferences with trend data
- **Collaborative Filtering**: Synthetic user generation for recommendation diversity
- **Wardrobe Gap Analysis**: Identifies missing clothing types
- **Confidence Metrics**: Reliability scoring for all recommendations

**Trend Database**:
- Minimalist Chic (85% popularity)
- Earthy Tones (78% popularity)  
- Bold Patterns (65% popularity)
- Athleisure (82% popularity)
- Vintage Revival (71% popularity)

### 4. Enhanced Outfit Generator (`lib/core/services/outfit_generator_service.dart`)
**Purpose**: Multiple outfit generation strategies with ML enhancement

**Generation Modes**:
- **Rule-Based**: Traditional color theory and type compatibility
- **ML-Enhanced**: Uses learned preferences for item selection
- **Trend-Based**: Incorporates current fashion trends
- **ML-Ranked**: Scores and ranks multiple generated options

**Color Compatibility Algorithm**:
- Neutral color prioritization
- Complementary color pairing
- User preference weighting
- Context-aware selection

## 📊 Database Schema

### Isar Database Models

#### ClothingItemModel (`lib/data/models/clothing_item_model.dart`)
```dart
@Collection()
class ClothingItemModel {
  Id id = Isar.autoIncrement;
  String itemId;              // Unique identifier
  String name;                // Item name
  ClothingType type;          // Enum: top, bottom, shoes, etc.
  String? imagePath;          // Local image file path
  List<String> colors;        // Color tags
  List<String> categories;    // Custom categories
  Season? season;             // Seasonal appropriateness
  List<WeatherRange> weatherRanges; // Weather conditions
  int wearCount;             // Usage tracking
  DateTime? lastWornDate;    // Last wear timestamp
  DateTime createdAt;        // Creation timestamp
  DateTime updatedAt;        // Modification timestamp
  String? notes;             // User notes
  List<String> tags;         // Custom tags
}
```

#### OutfitModel (`lib/data/models/outfit_model.dart`)
```dart
@Collection()
class OutfitModel {
  Id id = Isar.autoIncrement;
  String outfitId;                    // Unique identifier
  String name;                        // Outfit name
  List<String> clothingItemIds;       // Referenced clothing items
  List<String> categories;            // Categories
  Season? season;                     // Seasonal appropriateness
  List<WeatherRange> weatherRanges;   // Weather conditions
  int wearCount;                      // Usage tracking
  DateTime? lastWornDate;             // Last wear timestamp
  DateTime createdAt;                 // Creation timestamp
  DateTime updatedAt;                 // Modification timestamp
  String? notes;                      // User notes
  List<String> tags;                  // Custom tags
  bool isFavorite;                    // Favorite flag
  String? imagePreviewPath;           // Generated preview image
}
```

#### UserFeedbackModel (`lib/data/models/user_feedback_model.dart`)
```dart
@Collection()
class UserFeedbackModel {
  Id id = Isar.autoIncrement;
  String feedbackId;          // Unique identifier
  String userId;              // User identifier
  String? outfitId;          // Referenced outfit (optional)
  String? itemId;            // Referenced item (optional)
  FeedbackType type;         // love, like, dislike, worn, skipped
  FeedbackContext context;   // generated, manual, suggested
  DateTime timestamp;        // Feedback timestamp
  Map<String, dynamic> metadata; // Additional context data
}
```

#### UserPreferencesModel (`lib/data/models/user_preferences_model.dart`)
```dart
@Collection()
class UserPreferencesModel {
  Id id = Isar.autoIncrement;
  String userId;                           // User identifier
  Map<String, double> colorPreferences;    // Color preference scores (0-1)
  Map<String, double> categoryPreferences; // Category preference scores
  Map<String, double> combinationPreferences; // Item combination scores
  Map<String, double> weatherPreferences;  // Weather condition scores
  Map<String, double> seasonPreferences;   // Seasonal preference scores
  DateTime lastUpdated;                    // Last update timestamp
  int totalFeedbacks;                      // Total feedback count
}
```

## 🎨 UI Components

### Core Widgets

#### FeedbackButton (`lib/presentation/widgets/feedback_button.dart`)
Interactive component for collecting user feedback on outfits and items.

**Features**:
- Visual feedback states (love, like, dislike)
- Real-time preference learning
- Context-aware feedback collection
- Toast notifications with feedback confirmation

#### ClothingItemCard (`lib/presentation/widgets/clothing_item_card.dart`)
Reusable card component for displaying clothing items.

**Features**:
- Image display with fallback
- Color indicator chips
- Wear count and last worn display
- Quick action buttons (edit, delete, mark worn)

#### OutfitCard (`lib/presentation/widgets/outfit_card.dart`)
Card component for outfit display and interaction.

**Features**:
- Multi-item image preview
- Favorite toggle functionality
- AI compatibility score display
- Wear tracking integration

## 📦 Dependencies

### Core Dependencies
```yaml
dependencies:
  flutter: sdk: flutter
  flutter_riverpod: ^2.4.9          # State management
  flutter_screenutil: ^5.9.0        # Responsive UI
  go_router: ^12.1.3                # Navigation
  
  # Database
  isar: ^3.1.0+1                     # Local database
  isar_flutter_libs: ^3.1.0+1       # Platform libraries
  path_provider: ^2.1.1             # File system paths
  
  # Image Processing
  image_picker: ^1.0.4               # Camera/gallery access
  image: ^4.1.3                      # Image manipulation
  palette_generator: ^0.3.3+3        # Color extraction
  
  # UI Enhancement
  cached_network_image: ^3.3.0       # Image caching
  flutter_staggered_grid_view: ^0.7.0 # Advanced grid layouts
  flutter_colorpicker: ^1.0.3        # Color picker
  
  # Data Management
  share_plus: ^7.2.1                 # Sharing functionality
  file_picker: ^6.1.1               # File selection
  
  # Utilities
  equatable: ^2.0.5                  # Value equality
  uuid: ^4.1.0                      # Unique identifiers

dev_dependencies:
  flutter_test: sdk: flutter
  isar_generator: ^3.1.0+1           # Code generation
  build_runner: ^2.4.7               # Build tool
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (>=3.0.0)
- Dart (>=3.0.0)
- Android Studio / VS Code
- Physical device or emulator

### Installation

1. **Clone and Setup**:
   ```bash
   cd C:\Dev\Projects\iknow\wardrobe_app
   flutter pub get
   ```

2. **Generate Database Code**:
   ```bash
   flutter packages pub run build_runner build
   ```

3. **Run the App**:
   ```bash
   flutter run
   ```

### First Time Setup
1. **Add Clothing Items**: Use the camera or gallery to add your wardrobe
2. **Create Outfits**: Use the drag-and-drop builder or AI generator
3. **Provide Feedback**: Like/dislike outfits to train the AI
4. **Explore Analytics**: Check your style insights in the statistics screen

## 🔧 Configuration

### Theme Customization
The app uses a custom theme with the following color scheme:
- **Primary Black**: `#1A1A1A`
- **Primary White**: `#FFFFFF`
- **Pastel Pink**: `#FFB3D1`
- **Gold Accent**: `#FFD700`
- **Light Gray**: `#F5F5F5`

### ML Configuration
Machine learning parameters can be adjusted in the service classes:
- **Learning Rate**: 0.1 (how quickly preferences adapt)
- **Decay Factor**: 0.95 (how past preferences fade)
- **Minimum Feedback**: 5 (minimum interactions for reliable recommendations)

## 📈 Analytics & Insights

### User Preference Tracking
The system tracks and learns from:
- Color preferences (which colors you like/dislike)
- Category preferences (preferred clothing types)
- Combination preferences (which types work well together)
- Seasonal preferences (style changes across seasons)
- Weather preferences (outfit choices for different conditions)

### Recommendation Confidence
Each recommendation includes confidence metrics:
- **Personalization Score**: Based on feedback history
- **Trend Alignment**: How well it matches current trends  
- **Seasonal Fit**: Appropriateness for current season
- **Wardrobe Gap Fill**: How well it completes your wardrobe

## 🔄 Data Flow

### Learning Process
1. **User Interaction**: Like/dislike feedback on outfits or items
2. **Preference Update**: ML service updates preference scores
3. **Recommendation Generation**: New suggestions based on learned preferences
4. **Continuous Improvement**: Each interaction refines the model

### Outfit Generation Flow
1. **Filter Available Items**: Based on season, weather, categories
2. **Apply ML Scoring**: Rank items by preference compatibility
3. **Color Harmony Check**: Ensure color compatibility
4. **Style Compatibility**: Verify style coherence
5. **Final Selection**: Choose best combination based on all factors

## 📋 Development Roadmap

### Completed Features ✅
- Complete wardrobe management system
- AI-powered outfit generation with multiple algorithms
- Machine learning feedback system with preference learning
- Computer vision analysis for clothing classification
- Collaborative filtering recommendations
- Fashion trend integration
- Comprehensive analytics and statistics
- Backup and restore functionality
- Responsive UI with custom theming

### Future Enhancements 🔄
- Cloud synchronization
- Social features (sharing outfits, following friends)
- Weather API integration for daily outfit suggestions
- Occasion-based outfit recommendations
- Shopping integration (suggest items to buy)
- Advanced computer vision (brand recognition, pattern detection)
- Voice commands and natural language processing
- Augmented reality try-on features

## 🐛 Troubleshooting

### Common Issues

**Build Runner Issues**:
```bash
flutter packages pub run build_runner clean
flutter packages pub run build_runner build --delete-conflicting-outputs
```

**Database Issues**:
```bash
flutter clean
flutter pub get
flutter packages pub run build_runner build
```

**Image Picker Issues**:
- Ensure camera/storage permissions in `android/app/src/main/AndroidManifest.xml`
- Check iOS permissions in `ios/Runner/Info.plist`

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 👥 Contributing

Contributions are welcome! Please feel free to submit pull requests or open issues for bugs and feature requests.

---

**Built with ❤️ using Flutter, Riverpod, and Isar Database**

*Last Updated: January 2025*