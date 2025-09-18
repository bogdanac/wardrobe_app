import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:geolocator/geolocator.dart'; // Commented out until dependency is added
import '../../domain/entities/weather_data.dart';
import '../../domain/entities/clothing_item.dart';

class WeatherService {
  static const String _apiKey = 'YOUR_API_KEY'; // Replace with actual API key
  static const String _baseUrl = 'https://api.openweathermap.org/data/2.5';
  
  // Get current weather by location
  Future<WeatherData?> getCurrentWeather() async {
    try {
      final position = await _getCurrentPosition();
      if (position == null) return null;
      
      return getCurrentWeatherByCoordinates(
        latitude: position.latitude,
        longitude: position.longitude,
      );
    } catch (e) {
      return null;
    }
  }

  // Get current weather by coordinates
  Future<WeatherData?> getCurrentWeatherByCoordinates({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final url = '$_baseUrl/weather?lat=$latitude&lon=$longitude&appid=$_apiKey&units=metric';
      final response = await http.get(Uri.parse(url));
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return WeatherData.fromCurrentWeatherJson(data);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  // Get weather by city name
  Future<WeatherData?> getWeatherByCity(String cityName) async {
    try {
      final url = '$_baseUrl/weather?q=$cityName&appid=$_apiKey&units=metric';
      final response = await http.get(Uri.parse(url));
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return WeatherData.fromCurrentWeatherJson(data);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  // Get 5-day weather forecast
  Future<List<WeatherData>> getWeatherForecast() async {
    try {
      final position = await _getCurrentPosition();
      if (position == null) return [];
      
      return getWeatherForecastByCoordinates(
        latitude: position.latitude,
        longitude: position.longitude,
      );
    } catch (e) {
      return [];
    }
  }

  // Get 5-day forecast by coordinates
  Future<List<WeatherData>> getWeatherForecastByCoordinates({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final url = '$_baseUrl/forecast?lat=$latitude&lon=$longitude&appid=$_apiKey&units=metric';
      final response = await http.get(Uri.parse(url));
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return WeatherData.fromForecastJson(data);
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  // Get weather for specific date (if available in forecast)
  Future<WeatherData?> getWeatherForDate(DateTime date) async {
    try {
      final forecast = await getWeatherForecast();
      
      // Find the closest weather data to the requested date
      WeatherData? closestWeather;
      Duration? closestDifference;
      
      for (final weatherData in forecast) {
        final difference = weatherData.dateTime.difference(date).abs();
        if (closestDifference == null || difference < closestDifference) {
          closestDifference = difference;
          closestWeather = weatherData;
        }
      }
      
      return closestWeather;
    } catch (e) {
      return null;
    }
  }

  // Analyze weather for outfit recommendations
  WeatherOutfitRecommendation analyzeWeatherForOutfit(WeatherData weather) {
    final temperature = weather.temperature;
    final condition = weather.condition.toLowerCase();
    final humidity = weather.humidity;
    final windSpeed = weather.windSpeed;
    
    // Determine base clothing recommendations
    List<ClothingType> recommendedTypes = [];
    List<String> avoidTypes = [];
    List<String> weatherTags = [];
    String comfortLevel = 'comfortable';
    
    // Temperature-based recommendations
    if (temperature <= 0) {
      recommendedTypes.addAll([ClothingType.outerwear, ClothingType.top, ClothingType.shoes]);
      weatherTags.addAll(['freezing', 'very-cold', 'winter']);
      comfortLevel = 'very cold';
    } else if (temperature <= 10) {
      recommendedTypes.addAll([ClothingType.outerwear, ClothingType.top, ClothingType.bottom]);
      weatherTags.addAll(['cold', 'cool']);
      comfortLevel = 'cold';
    } else if (temperature <= 20) {
      recommendedTypes.addAll([ClothingType.top, ClothingType.bottom, ClothingType.shoes]);
      weatherTags.addAll(['mild', 'comfortable']);
      comfortLevel = 'mild';
    } else if (temperature <= 30) {
      recommendedTypes.addAll([ClothingType.top, ClothingType.bottom, ClothingType.shoes]);
      weatherTags.addAll(['warm', 'pleasant']);
      comfortLevel = 'warm';
    } else {
      recommendedTypes.addAll([ClothingType.top, ClothingType.bottom, ClothingType.shoes]);
      weatherTags.addAll(['hot', 'very-hot', 'summer']);
      comfortLevel = 'hot';
    }
    
    // Weather condition adjustments
    if (condition.contains('rain') || condition.contains('drizzle')) {
      recommendedTypes.add(ClothingType.outerwear); // Waterproof jacket
      avoidTypes.addAll(['suede', 'silk', 'white']);
      weatherTags.addAll(['rainy', 'wet']);
    }
    
    if (condition.contains('snow')) {
      recommendedTypes.addAll([ClothingType.shoes, ClothingType.outerwear]);
      avoidTypes.addAll(['sandals', 'shorts']);
      weatherTags.addAll(['snowy', 'winter']);
    }
    
    if (condition.contains('wind') || windSpeed > 10) {
      avoidTypes.addAll(['loose', 'flowy']);
      weatherTags.add('windy');
    }
    
    if (humidity > 70) {
      avoidTypes.addAll(['thick', 'heavy']);
      weatherTags.add('humid');
    }
    
    // Sun protection
    if (condition.contains('clear') || condition.contains('sunny')) {
      weatherTags.addAll(['sunny', 'bright']);
      // Could recommend hats, sunglasses
    }
    
    return WeatherOutfitRecommendation(
      weather: weather,
      recommendedClothingTypes: recommendedTypes,
      avoidClothingTypes: avoidTypes,
      weatherTags: weatherTags,
      comfortLevel: comfortLevel,
      layeringRecommended: temperature < 15 || (temperature > 15 && temperature < 25),
      umbrellaNeeded: condition.contains('rain'),
      sunProtectionNeeded: condition.contains('sunny') || condition.contains('clear'),
    );
  }

  // Get outfit suggestions based on weather
  Future<List<String>> getWeatherBasedOutfitSuggestions() async {
    try {
      final weather = await getCurrentWeather();
      if (weather == null) return [];
      
      final recommendation = analyzeWeatherForOutfit(weather);
      return _generateOutfitSuggestionStrings(recommendation);
    } catch (e) {
      return [];
    }
  }

  // Private helper methods
  Future<dynamic> _getCurrentPosition() async {
    try {
      // Geolocator functionality commented out until dependency is added
      // bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      // if (!serviceEnabled) return null;
      //
      // LocationPermission permission = await Geolocator.checkPermission();
      // if (permission == LocationPermission.denied) {
      //   permission = await Geolocator.requestPermission();
      //   if (permission == LocationPermission.denied) return null;
      // }
      //
      // if (permission == LocationPermission.deniedForever) return null;
      //
      // return await Geolocator.getCurrentPosition(
      //   desiredAccuracy: LocationAccuracy.low,
      // );
      return null; // Return null until geolocator is available
    } catch (e) {
      return null;
    }
  }

  List<String> _generateOutfitSuggestionStrings(WeatherOutfitRecommendation recommendation) {
    final suggestions = <String>[];
    final weather = recommendation.weather;
    final temp = weather.temperature;
    
    if (temp <= 0) {
      suggestions.addAll([
        'Layer a warm sweater under a heavy coat',
        'Don\'t forget thermal underwear!',
        'Insulated boots are essential',
        'Add a scarf and warm hat'
      ]);
    } else if (temp <= 10) {
      suggestions.addAll([
        'A warm jacket or coat is recommended',
        'Long pants and closed-toe shoes',
        'Consider layering with a sweater',
        'Light scarf for extra warmth'
      ]);
    } else if (temp <= 20) {
      suggestions.addAll([
        'Perfect weather for a light jacket or cardigan',
        'Comfortable jeans or long pants',
        'Sneakers or casual shoes work great'
      ]);
    } else if (temp <= 30) {
      suggestions.addAll([
        'Light, breathable fabrics are ideal',
        'T-shirt and jeans combination works well',
        'Comfortable sneakers recommended'
      ]);
    } else {
      suggestions.addAll([
        'Light, loose-fitting clothes are best',
        'Shorts and t-shirts for comfort',
        'Sandals or breathable shoes',
        'Don\'t forget sun protection!'
      ]);
    }
    
    // Add weather-specific suggestions
    if (weather.condition.toLowerCase().contains('rain')) {
      suggestions.add('Don\'t forget an umbrella or rain jacket!');
      suggestions.add('Avoid light-colored clothing that shows water stains');
    }
    
    if (weather.condition.toLowerCase().contains('sunny')) {
      suggestions.add('Consider sunglasses and a hat');
      suggestions.add('Light colors reflect heat better');
    }
    
    if (recommendation.layeringRecommended) {
      suggestions.add('Layering is key for temperature changes throughout the day');
    }
    
    return suggestions;
  }
}

// Data classes for weather recommendations
class WeatherOutfitRecommendation {
  final WeatherData weather;
  final List<ClothingType> recommendedClothingTypes;
  final List<String> avoidClothingTypes;
  final List<String> weatherTags;
  final String comfortLevel;
  final bool layeringRecommended;
  final bool umbrellaNeeded;
  final bool sunProtectionNeeded;

  const WeatherOutfitRecommendation({
    required this.weather,
    required this.recommendedClothingTypes,
    required this.avoidClothingTypes,
    required this.weatherTags,
    required this.comfortLevel,
    this.layeringRecommended = false,
    this.umbrellaNeeded = false,
    this.sunProtectionNeeded = false,
  });
}

// Mock weather data for development/testing
class MockWeatherService extends WeatherService {
  @override
  Future<WeatherData?> getCurrentWeather() async {
    // Return mock data for testing
    return WeatherData(
      temperature: 22.5,
      feelsLike: 24.0,
      humidity: 65,
      windSpeed: 8.5,
      condition: 'Clear',
      description: 'Clear sky',
      dateTime: DateTime.now(),
      location: 'Mock Location',
    );
  }

  @override
  Future<List<WeatherData>> getWeatherForecast() async {
    final now = DateTime.now();
    return List.generate(5, (index) {
      return WeatherData(
        temperature: 20.0 + (index * 2),
        feelsLike: 22.0 + (index * 2),
        humidity: 60 + (index * 5),
        windSpeed: 5.0 + index,
        condition: ['Clear', 'Partly Cloudy', 'Cloudy', 'Rain', 'Sunny'][index],
        description: 'Mock weather condition',
        dateTime: now.add(Duration(days: index)),
        location: 'Mock Location',
      );
    });
  }
}