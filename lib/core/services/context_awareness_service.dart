import '../../domain/entities/clothing_item.dart';
import '../../domain/repositories/clothing_repository.dart';
import '../../domain/repositories/outfit_repository.dart';

/// Enhanced context-aware service for smarter outfit recommendations
class ContextAwarenessService {
  final ClothingRepository _clothingRepository;
  final OutfitRepository _outfitRepository;

  ContextAwarenessService(this._clothingRepository, this._outfitRepository);

  /// Get context-aware item suggestions based on current conditions
  Future<List<ClothingItem>> getContextAwareSuggestions({
    ClothingType? type,
    List<ClothingItem>? existingItems,
    WeatherContext? weather,
    TimeContext? timeContext,
    LocationContext? location,
    int limit = 10,
  }) async {
    try {
      final allItems = await _clothingRepository.filterClothingItems(
        season: weather?.suggestedSeason,
        weatherRanges: weather?.weatherRanges,
      );
      
      // Filter by type if specified
      final filteredItems = type != null 
          ? allItems.where((item) => item.type == type).toList()
          : allItems;

      if (filteredItems.isEmpty) return [];

      final scoredItems = <ScoredContextItem>[];

      for (final item in filteredItems) {
        double score = await _calculateContextualScore(
          item,
          existingItems ?? [],
          weather,
          timeContext,
          location,
        );
        scoredItems.add(ScoredContextItem(item, score));
      }

      scoredItems.sort((a, b) => b.score.compareTo(a.score));
      return scoredItems.take(limit).map((si) => si.item).toList();
    } catch (e) {
      throw Exception('Failed to get context-aware suggestions: $e');
    }
  }

  /// Calculate comprehensive contextual score for an item
  Future<double> _calculateContextualScore(
    ClothingItem item,
    List<ClothingItem> existingItems,
    WeatherContext? weather,
    TimeContext? timeContext,
    LocationContext? location,
  ) async {
    double totalScore = 0.0;
    int factors = 0;

    // Weather appropriateness (30% weight)
    if (weather != null) {
      totalScore += await _calculateWeatherScore(item, weather) * 0.3;
      factors++;
    }

    // Time context (20% weight)
    if (timeContext != null) {
      totalScore += await _calculateTimeScore(item, timeContext) * 0.2;
      factors++;
    }

    // Wear history patterns (25% weight)
    totalScore += await _calculateWearHistoryScore(item, timeContext) * 0.25;
    factors++;

    // Style consistency with existing items (15% weight)
    if (existingItems.isNotEmpty) {
      totalScore += _calculateStyleConsistencyScore(item, existingItems) * 0.15;
      factors++;
    }

    // Location appropriateness (10% weight)
    if (location != null) {
      totalScore += _calculateLocationScore(item, location) * 0.1;
      factors++;
    }

    return factors > 0 ? totalScore / factors : 0.5;
  }

  /// Calculate weather appropriateness score
  Future<double> _calculateWeatherScore(ClothingItem item, WeatherContext weather) async {
    double score = 0.5; // Base score

    // Temperature appropriateness
    if (weather.temperature != null) {
      final temp = weather.temperature!;
      
      if (temp < 5) { // Very cold
        if (item.type == ClothingType.outerwear || 
            item.weatherRanges.contains(WeatherRange.veryCold)) {
          score += 0.4;
        }
        // Penalize summer items in cold weather
        if (item.weatherRanges.contains(WeatherRange.veryHot)) {
          score -= 0.3;
        }
      } else if (temp < 15) { // Cold
        if (item.weatherRanges.contains(WeatherRange.cold) ||
            item.weatherRanges.contains(WeatherRange.cool)) {
          score += 0.3;
        }
      } else if (temp < 25) { // Mild
        if (item.weatherRanges.contains(WeatherRange.warm) ||
            item.weatherRanges.contains(WeatherRange.cool)) {
          score += 0.3;
        }
      } else { // Hot
        if (item.weatherRanges.contains(WeatherRange.hot) ||
            item.weatherRanges.contains(WeatherRange.veryHot)) {
          score += 0.4;
        }
        // Penalize heavy items in hot weather
        if (item.type == ClothingType.outerwear) {
          score -= 0.2;
        }
      }
    }

    // Weather condition appropriateness
    if (weather.conditions != null) {
      switch (weather.conditions!) {
        case WeatherCondition.rainy:
          // Prefer waterproof/resistant items
          if (item.categories.any((c) => c.toLowerCase().contains('water'))) {
            score += 0.2;
          }
          // Avoid delicate fabrics
          if (item.categories.any((c) => c.toLowerCase().contains('silk') || 
                                       c.toLowerCase().contains('suede'))) {
            score -= 0.2;
          }
          break;
        case WeatherCondition.sunny:
          // Prefer light colors for sun protection
          if (item.colors.any((c) => _isLightColor(c))) {
            score += 0.1;
          }
          break;
        case WeatherCondition.cloudy:
          // Neutral weather - no specific preference
          break;
        case WeatherCondition.windy:
          // Prefer items that work well in wind
          if (item.type == ClothingType.outerwear) {
            score += 0.1;
          }
          break;
        case WeatherCondition.snowy:
          // Prefer warm, waterproof items
          if (item.weatherRanges.contains(WeatherRange.veryCold) ||
              item.type == ClothingType.outerwear) {
            score += 0.3;
          }
          break;
      }
    }

    return score.clamp(0.0, 1.0);
  }

  /// Calculate time-based appropriateness score
  Future<double> _calculateTimeScore(ClothingItem item, TimeContext timeContext) async {
    double score = 0.5;

    // Time of day appropriateness
    switch (timeContext.timeOfDay) {
      case TimeOfDay.morning:
        // Prefer comfortable, practical items for morning
        if (item.categories.any((c) => c.toLowerCase().contains('comfortable') ||
                                       c.toLowerCase().contains('casual'))) {
          score += 0.2;
        }
        break;
      case TimeOfDay.afternoon:
        // Balanced approach for afternoon
        score += 0.1; // Slight boost for all items
        break;
      case TimeOfDay.evening:
        // Prefer more polished items for evening
        if (item.categories.any((c) => c.toLowerCase().contains('elegant') ||
                                       c.toLowerCase().contains('formal'))) {
          score += 0.2;
        }
        break;
      case TimeOfDay.night:
        // Prefer darker colors and sophisticated items
        if (item.colors.any((c) => _isDarkColor(c))) {
          score += 0.1;
        }
        break;
    }

    // Day of week patterns
    switch (timeContext.dayOfWeek) {
      case DayType.weekday:
        // Prefer work-appropriate items
        if (item.categories.any((c) => c.toLowerCase().contains('work') ||
                                       c.toLowerCase().contains('professional'))) {
          score += 0.2;
        }
        break;
      case DayType.weekend:
        // Prefer casual, comfortable items
        if (item.categories.any((c) => c.toLowerCase().contains('casual') ||
                                       c.toLowerCase().contains('comfortable'))) {
          score += 0.2;
        }
        break;
    }

    return score.clamp(0.0, 1.0);
  }

  /// Calculate wear history score based on patterns
  Future<double> _calculateWearHistoryScore(ClothingItem item, TimeContext? timeContext) async {
    double score = 0.5;

    // Freshness score - prefer items not worn recently
    if (item.lastWornDate != null) {
      final daysSinceWorn = DateTime.now().difference(item.lastWornDate!).inDays;
      if (daysSinceWorn > 14) {
        score += 0.3; // Strong preference for items not worn in 2+ weeks
      } else if (daysSinceWorn > 7) {
        score += 0.2; // Moderate preference for items not worn in 1+ week
      } else if (daysSinceWorn > 3) {
        score += 0.1; // Slight preference for items not worn in 3+ days
      } else {
        score -= 0.1; // Slight penalty for recently worn items
      }
    } else {
      score += 0.2; // Preference for never-worn items
    }

    // Frequency patterns - analyze historical usage
    try {
      final outfits = await _outfitRepository.getAllOutfits();
      final recentOutfits = outfits.where((outfit) => 
        outfit.lastWornDate != null && 
        DateTime.now().difference(outfit.lastWornDate!).inDays <= 30
      ).toList();

      // Check if item appears frequently in recent outfits
      final recentUsage = recentOutfits.where((outfit) => 
        outfit.clothingItemIds.contains(item.id)).length;
      
      if (recentUsage > 5) {
        score -= 0.1; // Penalty for overused items
      } else if (recentUsage == 0) {
        score += 0.1; // Bonus for underused items
      }

      // Day-of-week patterns
      if (timeContext != null) {
        final sameDayOutfits = recentOutfits.where((outfit) => 
          outfit.lastWornDate != null &&
          outfit.lastWornDate!.weekday == DateTime.now().weekday &&
          outfit.clothingItemIds.contains(item.id)
        ).length;

        if (sameDayOutfits > 2) {
          score -= 0.05; // Small penalty for same-day-of-week repetition
        }
      }
    } catch (e) {
      // Continue with base score if history analysis fails
    }

    return score.clamp(0.0, 1.0);
  }

  /// Calculate style consistency score
  double _calculateStyleConsistencyScore(ClothingItem item, List<ClothingItem> existingItems) {
    double score = 0.5;
    int comparisons = 0;

    for (final existingItem in existingItems) {
      // Metallic elements consistency
      if (item.metallicElements == existingItem.metallicElements ||
          item.metallicElements == MetallicElements.none ||
          existingItem.metallicElements == MetallicElements.none) {
        score += 0.2;
      } else {
        score -= 0.1; // Penalty for conflicting metallics
      }

      // Category overlap (some shared style elements)
      final sharedCategories = item.categories.toSet()
          .intersection(existingItem.categories.toSet());
      score += sharedCategories.length * 0.1;

      // Color harmony check
      for (final itemColor in item.colors) {
        for (final existingColor in existingItem.colors) {
          if (_areColorsHarmonious(itemColor, existingColor)) {
            score += 0.1;
          }
        }
      }

      comparisons++;
    }

    return comparisons > 0 ? (score / comparisons).clamp(0.0, 1.0) : 0.5;
  }

  /// Calculate location appropriateness score
  double _calculateLocationScore(ClothingItem item, LocationContext location) {
    double score = 0.5;

    switch (location.setting) {
      case LocationSetting.indoor:
        // Prefer lighter items for indoor settings
        if (item.type != ClothingType.outerwear) {
          score += 0.1;
        }
        break;
      case LocationSetting.outdoor:
        // Consider weather protection for outdoor settings
        if (item.type == ClothingType.outerwear || 
            item.categories.any((c) => c.toLowerCase().contains('outdoor'))) {
          score += 0.2;
        }
        break;
      case LocationSetting.office:
        // Prefer professional items for office
        if (item.categories.any((c) => c.toLowerCase().contains('work') ||
                                       c.toLowerCase().contains('professional') ||
                                       c.toLowerCase().contains('formal'))) {
          score += 0.3;
        }
        break;
      case LocationSetting.casual:
        // Prefer casual items
        if (item.categories.any((c) => c.toLowerCase().contains('casual') ||
                                       c.toLowerCase().contains('comfortable'))) {
          score += 0.2;
        }
        break;
    }

    return score.clamp(0.0, 1.0);
  }

  /// Analyze user's style patterns from outfit history
  Future<StylePatterns> analyzeStylePatterns() async {
    try {
      final outfits = await _outfitRepository.getAllOutfits();
      final allItems = await _clothingRepository.getAllClothingItems();

      final patterns = StylePatterns();

      // Analyze color preferences
      final colorUsage = <String, int>{};
      for (final item in allItems) {
        for (final color in item.colors) {
          colorUsage[color] = (colorUsage[color] ?? 0) + item.wearCount;
        }
      }
      patterns.preferredColors = colorUsage.entries
          .where((entry) => entry.value > 0)
          .map((entry) => entry.key)
          .take(5)
          .toList();

      // Analyze category preferences
      final categoryUsage = <String, int>{};
      for (final item in allItems) {
        for (final category in item.categories) {
          categoryUsage[category] = (categoryUsage[category] ?? 0) + item.wearCount;
        }
      }
      patterns.preferredCategories = categoryUsage.entries
          .where((entry) => entry.value > 3) // Only categories used 3+ times
          .map((entry) => entry.key)
          .take(5)
          .toList();

      // Analyze outfit composition patterns
      final outfitSizes = outfits.map((o) => o.clothingItemIds.length).toList();
      if (outfitSizes.isNotEmpty) {
        patterns.averageOutfitSize = outfitSizes.reduce((a, b) => a + b) / outfitSizes.length;
      }

      // Analyze day-of-week preferences
      final weekdayOutfits = outfits.where((o) => 
        o.lastWornDate != null && o.lastWornDate!.weekday <= 5).length;
      final weekendOutfits = outfits.where((o) => 
        o.lastWornDate != null && o.lastWornDate!.weekday > 5).length;
      
      patterns.weekdayToWeekendRatio = weekendOutfits > 0 
          ? weekdayOutfits / weekendOutfits 
          : weekdayOutfits.toDouble();

      return patterns;
    } catch (e) {
      return StylePatterns(); // Return empty patterns if analysis fails
    }
  }

  /// Helper methods
  bool _isLightColor(String colorHex) {
    try {
      final color = Color(int.parse(colorHex.replaceFirst('#', '0xFF')));
      final luminance = color.computeLuminance();
      return luminance > 0.5;
    } catch (e) {
      return false;
    }
  }

  bool _isDarkColor(String colorHex) {
    return !_isLightColor(colorHex);
  }

  bool _areColorsHarmonious(String color1, String color2) {
    // Simple color harmony check - would be more sophisticated in production
    try {
      final c1 = Color(int.parse(color1.replaceFirst('#', '0xFF')));
      final c2 = Color(int.parse(color2.replaceFirst('#', '0xFF')));
      
      // Check if colors are similar (within tolerance)
      const tolerance = 30;
      return (c1.red - c2.red).abs() < tolerance &&
             (c1.green - c2.green).abs() < tolerance &&
             (c1.blue - c2.blue).abs() < tolerance;
    } catch (e) {
      return false;
    }
  }
}

/// Context classes for enhanced recommendations
class WeatherContext {
  final double? temperature;
  final WeatherCondition? conditions;
  final Season? suggestedSeason;
  final List<WeatherRange>? weatherRanges;
  final double? humidity;
  final double? windSpeed;

  WeatherContext({
    this.temperature,
    this.conditions,
    this.suggestedSeason,
    this.weatherRanges,
    this.humidity,
    this.windSpeed,
  });
}

class TimeContext {
  final TimeOfDay timeOfDay;
  final DayType dayOfWeek;
  final DateTime dateTime;

  TimeContext({
    required this.timeOfDay,
    required this.dayOfWeek,
    required this.dateTime,
  });

  factory TimeContext.now() {
    final now = DateTime.now();
    final hour = now.hour;
    
    TimeOfDay timeOfDay;
    if (hour < 6) {
      timeOfDay = TimeOfDay.night;
    } else if (hour < 12) {
      timeOfDay = TimeOfDay.morning;
    } else if (hour < 18) {
      timeOfDay = TimeOfDay.afternoon;
    } else if (hour < 22) {
      timeOfDay = TimeOfDay.evening;
    } else {
      timeOfDay = TimeOfDay.night;
    }

    final dayType = now.weekday <= 5 ? DayType.weekday : DayType.weekend;

    return TimeContext(
      timeOfDay: timeOfDay,
      dayOfWeek: dayType,
      dateTime: now,
    );
  }
}

class LocationContext {
  final LocationSetting setting;
  final String? specificLocation;
  final double? latitude;
  final double? longitude;

  LocationContext({
    required this.setting,
    this.specificLocation,
    this.latitude,
    this.longitude,
  });
}

class StylePatterns {
  List<String> preferredColors = [];
  List<String> preferredCategories = [];
  double averageOutfitSize = 3.0;
  double weekdayToWeekendRatio = 1.0;
  Map<String, double> typePreferences = {};
  Map<String, double> occasionPreferences = {};

  StylePatterns();
}

/// Supporting enums
enum WeatherCondition { sunny, cloudy, rainy, snowy, windy }
enum TimeOfDay { morning, afternoon, evening, night }
enum DayType { weekday, weekend }
enum LocationSetting { indoor, outdoor, office, casual }

/// Scored item for context-aware recommendations
class ScoredContextItem {
  final ClothingItem item;
  final double score;

  ScoredContextItem(this.item, this.score);
}

/// Fix for Color import
class Color {
  final int value;
  Color(this.value);
  
  int get red => (value >> 16) & 0xFF;
  int get green => (value >> 8) & 0xFF;
  int get blue => value & 0xFF;
  
  double computeLuminance() {
    final r = red / 255.0;
    final g = green / 255.0;
    final b = blue / 255.0;
    return 0.299 * r + 0.587 * g + 0.114 * b;
  }
}