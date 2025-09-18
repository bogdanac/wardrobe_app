# Wardrobe App - Technical Guide for Developers

## Table of Contents
- [Getting Started](#getting-started)
- [Architecture Overview](#architecture-overview)
- [Development Setup](#development-setup)
- [Core Systems](#core-systems)
- [API Documentation](#api-documentation)
- [Database Schema](#database-schema)
- [Testing Strategy](#testing-strategy)
- [Performance Guidelines](#performance-guidelines)
- [Deployment Guide](#deployment-guide)
- [Contributing Guidelines](#contributing-guidelines)

## Getting Started

### Prerequisites
- **Flutter SDK**: 3.1.0 or higher
- **Dart SDK**: 3.0.0 or higher
- **Android Studio**: Latest stable version with Android SDK 21+
- **Xcode**: 14.0+ (for iOS development)
- **Git**: Version control system

### Quick Start
1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-org/wardrobe_app.git
   cd wardrobe_app
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Generate code**:
   ```bash
   flutter packages pub run build_runner build
   ```

4. **Run the app**:
   ```bash
   flutter run
   ```

## Architecture Overview

### Clean Architecture Pattern
The app follows Clean Architecture principles with clear separation of concerns:

```
lib/
├── domain/           # Business logic and entities
│   ├── entities/     # Core business models
│   └── repositories/ # Abstract repository interfaces
├── data/            # Data layer implementation
│   ├── repositories/ # Concrete repository implementations
│   └── datasources/  # Local and remote data sources
├── presentation/    # UI layer
│   ├── screens/     # Application screens
│   ├── widgets/     # Reusable UI components
│   └── providers/   # State management (Riverpod)
└── core/           # Shared utilities and services
    ├── services/    # Business services
    ├── themes/      # UI themes and styling
    └── errors/      # Error handling
```

### Key Architectural Principles
- **Dependency Injection**: Using Riverpod for clean dependency management
- **State Management**: Riverpod providers for reactive state handling
- **Error Handling**: Comprehensive error handling with custom exceptions
- **Testability**: High test coverage with mocked dependencies
- **Performance**: Optimized for 60fps UI and efficient memory usage

## Development Setup

### Environment Configuration
1. **Create environment file**:
   ```bash
   cp .env.example .env
   ```

2. **Configure API keys**:
   ```env
   # Weather API
   OPENWEATHER_API_KEY=your_api_key_here
   
   # Google Vision API
   GOOGLE_VISION_API_KEY=your_api_key_here
   
   # OpenAI API
   OPENAI_API_KEY=your_api_key_here
   ```

### IDE Setup
#### VS Code Extensions
- Dart
- Flutter
- Riverpod Snippets
- Flutter Intl
- GitLens

#### Android Studio Plugins
- Flutter
- Dart
- Riverpod Helper

### Code Generation
The app uses several code generators:

```bash
# Generate all code
flutter packages pub run build_runner build

# Watch for changes (development)
flutter packages pub run build_runner watch

# Clean generated files
flutter packages pub run build_runner clean
```

## Core Systems

### 1. State Management with Riverpod

#### Provider Types
```dart
// Simple value provider
final configProvider = Provider<Config>((ref) {
  return Config();
});

// Async data provider
final clothingItemsProvider = FutureProvider<List<ClothingItem>>((ref) async {
  final repository = ref.read(clothingRepositoryProvider);
  return repository.getAllClothingItems();
});

// Mutable state provider
final filtersProvider = StateNotifierProvider<FiltersNotifier, FiltersState>((ref) {
  return FiltersNotifier();
});
```

#### Best Practices
- Use `ref.read()` for one-time reads
- Use `ref.watch()` for reactive dependencies
- Implement proper disposal for resources
- Use family providers for parameterized providers

### 2. Database with Isar

#### Entity Definition
```dart
@collection
class ClothingItem {
  Id id = Isar.autoIncrement;
  
  @Index()
  late String name;
  
  @Enumerated(EnumType.name)
  late ClothingType type;
  
  // Other properties...
}
```

#### Repository Pattern
```dart
abstract class ClothingRepository {
  Future<List<ClothingItem>> getAllClothingItems();
  Future<ClothingItem?> getClothingItemById(String id);
  Future<void> saveClothingItem(ClothingItem item);
}

class ClothingRepositoryImpl implements ClothingRepository {
  final Isar _isar;
  
  @override
  Future<List<ClothingItem>> getAllClothingItems() async {
    return await _isar.clothingItems.where().findAll();
  }
}
```

### 3. Error Handling System

#### Custom Exceptions
```dart
abstract class AppException implements Exception {
  final String message;
  final String? code;
  final dynamic originalError;
  
  const AppException(this.message, {this.code, this.originalError});
}

class NetworkException extends AppException {
  const NetworkException(super.message, {super.code, super.originalError});
}
```

#### Error Handler Service
```dart
class ErrorHandler {
  AppException handleError(dynamic error, {String? context}) {
    if (error is SocketException) {
      return NetworkException('Network connection failed');
    }
    // Handle other error types...
    return GeneralException(error.toString());
  }
}
```

### 4. ML and AI Integration

#### AI Tagging Service
```dart
class AITaggingService {
  Future<ClothingAnalysisResult> analyzeClothingImage({
    required String imagePath,
    bool useMultipleServices = true,
  }) async {
    // Multi-service AI analysis implementation
    final results = await Future.wait([
      _analyzeWithGoogleVision(imagePath),
      _analyzeWithOpenAI(imagePath),
      _analyzeWithCustomModel(imagePath),
    ]);
    
    return _combineResults(results);
  }
}
```

#### ML Model Integration
```dart
class MLOutfitRecommender {
  Future<List<Outfit>> generateRecommendations({
    required int count,
    Season? season,
    String? occasion,
  }) async {
    // Load user preferences
    final preferences = await _loadUserPreferences();
    
    // Generate combinations
    final combinations = await _generateCombinations();
    
    // Score and rank
    final scored = await _scoreOutfits(combinations, preferences);
    
    return scored.take(count).toList();
  }
}
```

### 5. AR Visualization System

#### AR Service Architecture
```dart
class ARVisualizationService {
  static const MethodChannel _channel = MethodChannel('wardrobe_ar');
  
  Future<bool> initializeARSession() async {
    return await _channel.invokeMethod('initializeAR');
  }
  
  Future<ARVisualization?> visualizeOutfit({
    required Outfit outfit,
    required BodyModel bodyModel,
  }) async {
    final params = {
      'outfitData': outfit.toJson(),
      'bodyModel': bodyModel.toJson(),
    };
    
    final result = await _channel.invokeMethod('visualizeOutfit', params);
    return ARVisualization.fromMap(result);
  }
}
```

## API Documentation

### REST API Endpoints

#### Clothing Items
```http
GET    /api/items                 # Get all clothing items
POST   /api/items                 # Create new item
GET    /api/items/{id}             # Get specific item
PUT    /api/items/{id}             # Update item
DELETE /api/items/{id}             # Delete item
```

#### Outfits
```http
GET    /api/outfits               # Get all outfits
POST   /api/outfits               # Create new outfit
GET    /api/outfits/{id}          # Get specific outfit
PUT    /api/outfits/{id}          # Update outfit
DELETE /api/outfits/{id}          # Delete outfit
POST   /api/outfits/generate      # Generate outfit suggestions
```

#### Analytics
```http
GET    /api/analytics/wardrobe    # Get wardrobe analytics
GET    /api/analytics/usage       # Get usage statistics
GET    /api/analytics/colors      # Get color analysis
```

### WebSocket Events

#### Real-time Collaboration
```javascript
// Join collaboration room
ws.send(JSON.stringify({
  type: 'join_room',
  roomId: 'room_123',
  userId: 'user_456'
}));

// Outfit suggestion
ws.send(JSON.stringify({
  type: 'suggest_outfit',
  roomId: 'room_123',
  outfitData: { /* outfit data */ }
}));
```

## Database Schema

### Core Tables

#### ClothingItems
```sql
CREATE TABLE clothing_items (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  type TEXT NOT NULL,
  category TEXT,
  brand TEXT,
  color TEXT,
  size TEXT,
  price REAL,
  image_path TEXT,
  created_at DATETIME,
  updated_at DATETIME
);

CREATE INDEX idx_clothing_items_name ON clothing_items(name);
CREATE INDEX idx_clothing_items_type ON clothing_items(type);
```

#### Outfits
```sql
CREATE TABLE outfits (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  description TEXT,
  season TEXT,
  is_favorite BOOLEAN DEFAULT FALSE,
  created_at DATETIME,
  updated_at DATETIME
);

CREATE TABLE outfit_items (
  outfit_id INTEGER,
  clothing_item_id INTEGER,
  FOREIGN KEY (outfit_id) REFERENCES outfits(id),
  FOREIGN KEY (clothing_item_id) REFERENCES clothing_items(id),
  PRIMARY KEY (outfit_id, clothing_item_id)
);
```

### Indexes and Optimization
```sql
-- Performance indexes
CREATE INDEX idx_outfits_season ON outfits(season);
CREATE INDEX idx_outfits_favorite ON outfits(is_favorite);
CREATE INDEX idx_outfit_items_outfit ON outfit_items(outfit_id);
```

## Testing Strategy

### Unit Tests
```dart
// Test example for repository
void main() {
  group('ClothingRepository', () {
    late ClothingRepository repository;
    late MockIsar mockIsar;

    setUp(() {
      mockIsar = MockIsar();
      repository = ClothingRepositoryImpl(mockIsar);
    });

    test('should return all clothing items', () async {
      // Arrange
      final expectedItems = [ClothingItem()..name = 'Test Item'];
      when(mockIsar.clothingItems.where()).thenReturn(mockQuery);
      when(mockQuery.findAll()).thenAnswer((_) async => expectedItems);

      // Act
      final result = await repository.getAllClothingItems();

      // Assert
      expect(result, equals(expectedItems));
    });
  });
}
```

### Widget Tests
```dart
void main() {
  group('ClothingItemCard', () {
    testWidgets('should display clothing item information', (tester) async {
      // Arrange
      final item = ClothingItem()..name = 'Test Shirt';
      
      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: ClothingItemCard(item: item),
        ),
      );
      
      // Assert
      expect(find.text('Test Shirt'), findsOneWidget);
    });
  });
}
```

### Integration Tests
```dart
void main() {
  group('App Integration Tests', () {
    testWidgets('complete outfit creation flow', (tester) async {
      // Setup app
      await tester.pumpWidget(MyApp());
      
      // Navigate to outfit creation
      await tester.tap(find.byKey(Key('create_outfit_button')));
      await tester.pumpAndSettle();
      
      // Add items to outfit
      await tester.tap(find.byKey(Key('item_1')));
      await tester.tap(find.byKey(Key('item_2')));
      
      // Save outfit
      await tester.tap(find.byKey(Key('save_outfit_button')));
      await tester.pumpAndSettle();
      
      // Verify outfit was created
      expect(find.text('Outfit saved!'), findsOneWidget);
    });
  });
}
```

## Performance Guidelines

### Memory Management
```dart
class ImageService {
  final Map<String, ui.Image> _imageCache = {};
  
  Future<ui.Image> loadImage(String path) async {
    if (_imageCache.containsKey(path)) {
      return _imageCache[path]!;
    }
    
    final image = await _loadImageFromPath(path);
    
    // Limit cache size
    if (_imageCache.length > 50) {
      _imageCache.remove(_imageCache.keys.first);
    }
    
    _imageCache[path] = image;
    return image;
  }
}
```

### UI Performance
```dart
class OptimizedListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      cacheExtent: 1000, // Pre-cache items
      itemBuilder: (context, index) {
        // Use const widgets when possible
        return const ClothingItemCard(key: ValueKey(item.id));
      },
    );
  }
}
```

### Database Optimization
```dart
class OptimizedRepository {
  Future<List<ClothingItem>> getFilteredItems({
    ClothingType? type,
    Season? season,
  }) async {
    var query = _isar.clothingItems.where();
    
    // Use indexed fields for filtering
    if (type != null) {
      query = query.typeEqualTo(type);
    }
    
    // Limit results to prevent memory issues
    return await query.limit(100).findAll();
  }
}
```

## Deployment Guide

### Build Configuration

#### Android
```gradle
// android/app/build.gradle
android {
    compileSdkVersion 34
    
    defaultConfig {
        minSdkVersion 21
        targetSdkVersion 34
        versionCode flutterVersionCode.toInteger()
        versionName flutterVersionName
    }
    
    buildTypes {
        release {
            signingConfig signingConfigs.release
            minifyEnabled true
            proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'
        }
    }
}
```

#### iOS
```ruby
# ios/Podfile
platform :ios, '12.0'

target 'Runner' do
  use_frameworks!
  use_modular_headers!

  flutter_install_all_ios_pods File.dirname(File.realpath(__FILE__))
end
```

### Environment-Specific Builds
```bash
# Development build
flutter build apk --flavor dev -t lib/main_dev.dart

# Staging build
flutter build apk --flavor staging -t lib/main_staging.dart

# Production build
flutter build apk --release --flavor prod -t lib/main_prod.dart
```

### CI/CD Pipeline
```yaml
# .github/workflows/build.yml
name: Build and Test

on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
      - run: flutter pub get
      - run: flutter analyze
      - run: flutter test
      
  build:
    needs: test
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
      - run: flutter build apk --release
```

## Contributing Guidelines

### Code Style
- Follow [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- Use `dart format` for consistent formatting
- Maximum line length: 80 characters
- Use meaningful variable and function names

### Commit Messages
```
type(scope): description

feat(outfit): add ML-powered outfit recommendations
fix(database): resolve Isar query optimization issue
docs(readme): update installation instructions
```

### Pull Request Process
1. **Create Feature Branch**: `git checkout -b feature/awesome-feature`
2. **Implement Changes**: Follow coding standards and write tests
3. **Run Tests**: Ensure all tests pass
4. **Create PR**: Provide clear description and link related issues
5. **Code Review**: Address reviewer feedback
6. **Merge**: Squash commits before merging

### Development Workflow
```bash
# 1. Setup development environment
flutter pub get
flutter packages pub run build_runner build

# 2. Create feature branch
git checkout -b feature/new-feature

# 3. Develop with hot reload
flutter run

# 4. Run tests
flutter test

# 5. Format and analyze code
dart format .
flutter analyze

# 6. Commit changes
git add .
git commit -m "feat: implement new feature"

# 7. Push and create PR
git push origin feature/new-feature
```

### Code Review Checklist
- [ ] Code follows project style guidelines
- [ ] Tests are included and passing
- [ ] Documentation is updated
- [ ] No breaking changes without version bump
- [ ] Error handling is implemented
- [ ] Performance impact is considered
- [ ] Security implications are reviewed

### Release Process
1. **Version Bump**: Update version in `pubspec.yaml`
2. **Changelog**: Update `CHANGELOG.md` with new features and fixes
3. **Tag Release**: Create git tag with version number
4. **Build Artifacts**: Generate release builds for all platforms
5. **Deploy**: Upload to app stores and update documentation

## Troubleshooting

### Common Issues

#### Build Failures
```bash
# Clean build cache
flutter clean
flutter pub get
flutter packages pub run build_runner clean
flutter packages pub run build_runner build

# Reset Flutter
flutter doctor
flutter upgrade
```

#### Database Issues
```dart
// Reset database during development
await Isar.close();
final dir = await getApplicationDocumentsDirectory();
await Isar.initializeIsarCore(download: true);
final isar = await Isar.open(schemas);
```

#### Performance Issues
```bash
# Profile app performance
flutter run --profile
flutter run --trace-skia
```

### Debug Tools
- **Flutter Inspector**: Visual debugging of widget tree
- **Timeline View**: Performance profiling
- **Memory Usage**: Track memory leaks
- **Network Tab**: Monitor API calls

## Resources

### Documentation
- [Flutter Documentation](https://docs.flutter.dev/)
- [Riverpod Guide](https://riverpod.dev/docs/introduction/getting_started)
- [Isar Documentation](https://isar.dev/tutorials/quickstart.html)

### Tools
- [Flutter DevTools](https://docs.flutter.dev/development/tools/devtools/overview)
- [Dart Packages](https://pub.dev/)
- [Firebase Console](https://console.firebase.google.com/)

### Community
- [Flutter Community](https://flutter.dev/community)
- [Stack Overflow](https://stackoverflow.com/questions/tagged/flutter)
- [Discord](https://discord.gg/flutter)

This technical guide provides the foundation for developers to contribute effectively to the Wardrobe App. For specific implementation details, refer to the inline documentation and the comprehensive development documentation.