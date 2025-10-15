class WeatherData {
  String id;
  
  late double temperature;
  late double feelsLike;
  late int humidity;
  late double windSpeed;
  late String condition; // e.g., "Clear", "Rain", "Snow"
  late String description; // e.g., "light rain", "broken clouds"
  late DateTime dateTime;
  late String location;
  
  // Additional weather details
  double? pressure;
  double? visibility;
  int? uvIndex;
  
  // Weather icon/code for UI
  String? iconCode;
  
  // Precipitation
  double? precipitationMm;
  double? precipitationChance;
  
  // Air quality (if available)
  int? airQualityIndex;

  WeatherData({
    String? id,
    required this.temperature,
    required this.feelsLike,
    required this.humidity,
    required this.windSpeed,
    required this.condition,
    required this.description,
    required this.dateTime,
    required this.location,
    this.pressure,
    this.visibility,
    this.uvIndex,
    this.iconCode,
    this.precipitationMm,
    this.precipitationChance,
    this.airQualityIndex,
  }) : id = id ?? DateTime.now().millisecondsSinceEpoch.toString();

  // Factory constructor from OpenWeatherMap current weather API
  factory WeatherData.fromCurrentWeatherJson(Map<String, dynamic> json) {
    final main = json['main'] as Map<String, dynamic>;
    final weather = (json['weather'] as List).first as Map<String, dynamic>;
    final wind = json['wind'] as Map<String, dynamic>? ?? {};
    
    return WeatherData(
      temperature: (main['temp'] as num).toDouble(),
      feelsLike: (main['feels_like'] as num).toDouble(),
      humidity: main['humidity'] as int,
      windSpeed: (wind['speed'] as num?)?.toDouble() ?? 0.0,
      condition: weather['main'] as String,
      description: weather['description'] as String,
      dateTime: DateTime.fromMillisecondsSinceEpoch((json['dt'] as int) * 1000),
      location: json['name'] as String,
      pressure: (main['pressure'] as num?)?.toDouble(),
      visibility: (json['visibility'] as num?)?.toDouble(),
      iconCode: weather['icon'] as String?,
    );
  }

  // Factory constructor from OpenWeatherMap forecast API
  static List<WeatherData> fromForecastJson(Map<String, dynamic> json) {
    final list = json['list'] as List;
    final city = json['city'] as Map<String, dynamic>;
    final cityName = city['name'] as String;
    
    return list.map((item) {
      final main = item['main'] as Map<String, dynamic>;
      final weather = (item['weather'] as List).first as Map<String, dynamic>;
      final wind = item['wind'] as Map<String, dynamic>? ?? {};
      final rain = item['rain'] as Map<String, dynamic>? ?? {};
      
      return WeatherData(
        temperature: (main['temp'] as num).toDouble(),
        feelsLike: (main['feels_like'] as num).toDouble(),
        humidity: main['humidity'] as int,
        windSpeed: (wind['speed'] as num?)?.toDouble() ?? 0.0,
        condition: weather['main'] as String,
        description: weather['description'] as String,
        dateTime: DateTime.fromMillisecondsSinceEpoch((item['dt'] as int) * 1000),
        location: cityName,
        pressure: (main['pressure'] as num?)?.toDouble(),
        iconCode: weather['icon'] as String?,
        precipitationMm: (rain['3h'] as num?)?.toDouble(),
        precipitationChance: (item['pop'] as num?)?.toDouble() != null 
            ? ((item['pop'] as num).toDouble() * 100) 
            : null,
      );
    }).toList();
  }

  // Helper methods for outfit recommendations
  bool get isRainy => condition.toLowerCase().contains('rain') || 
                     condition.toLowerCase().contains('drizzle');

  bool get isSnowy => condition.toLowerCase().contains('snow');

  bool get isSunny => condition.toLowerCase().contains('clear') || 
                     condition.toLowerCase().contains('sunny');

  bool get isCloudy => condition.toLowerCase().contains('cloud');

  bool get isWindy => windSpeed > 10; // m/s

  bool get isHumid => humidity > 70;

  bool get isCold => temperature < 10;

  bool get isWarm => temperature > 25;

  bool get isHot => temperature > 30;

  bool get isFreezingCold => temperature < 0;

  String get temperatureRange {
    if (temperature < 0) return 'freezing';
    if (temperature < 10) return 'cold';
    if (temperature < 20) return 'mild';
    if (temperature < 30) return 'warm';
    return 'hot';
  }

  String get windDescription {
    if (windSpeed < 2) return 'calm';
    if (windSpeed < 6) return 'light breeze';
    if (windSpeed < 12) return 'moderate wind';
    if (windSpeed < 20) return 'strong wind';
    return 'very strong wind';
  }

  String get humidityDescription {
    if (humidity < 30) return 'dry';
    if (humidity < 60) return 'comfortable';
    if (humidity < 80) return 'humid';
    return 'very humid';
  }

  // Get weather-appropriate clothing suggestions
  List<String> get clothingRecommendations {
    final recommendations = <String>[];
    
    // Temperature-based recommendations
    if (isFreezingCold) {
      recommendations.addAll(['heavy coat', 'thermal layers', 'insulated boots', 'warm hat', 'gloves']);
    } else if (isCold) {
      recommendations.addAll(['warm jacket', 'sweater', 'long pants', 'closed shoes']);
    } else if (temperatureRange == 'mild') {
      recommendations.addAll(['light jacket', 'cardigan', 'long or short sleeves']);
    } else if (isWarm) {
      recommendations.addAll(['light clothing', 't-shirt', 'shorts or light pants']);
    } else if (isHot) {
      recommendations.addAll(['minimal clothing', 'shorts', 'tank tops', 'breathable fabrics']);
    }
    
    // Weather condition adjustments
    if (isRainy) {
      recommendations.addAll(['waterproof jacket', 'umbrella', 'avoid suede/leather']);
    }
    
    if (isSnowy) {
      recommendations.addAll(['waterproof boots', 'warm layers', 'avoid light colors']);
    }
    
    if (isSunny) {
      recommendations.addAll(['sun hat', 'sunglasses', 'light colors']);
    }
    
    if (isWindy) {
      recommendations.addAll(['fitted clothing', 'avoid loose/flowy items']);
    }
    
    if (isHumid) {
      recommendations.addAll(['breathable fabrics', 'moisture-wicking materials']);
    }
    
    return recommendations;
  }

  // Get colors that work well with this weather
  List<String> get recommendedColors {
    final colors = <String>[];
    
    if (isSunny) {
      colors.addAll(['light colors', 'white', 'pastels', 'bright colors']);
    } else if (isCloudy || isRainy) {
      colors.addAll(['darker colors', 'navy', 'black', 'burgundy']);
    } else if (isSnowy) {
      colors.addAll(['dark colors', 'jewel tones', 'rich colors']);
    } else {
      colors.addAll(['neutral colors', 'earth tones']);
    }
    
    return colors;
  }

  // Convert to JSON for API calls or storage
  Map<String, dynamic> toJson() {
    return {
      'temperature': temperature,
      'feelsLike': feelsLike,
      'humidity': humidity,
      'windSpeed': windSpeed,
      'condition': condition,
      'description': description,
      'dateTime': dateTime.toIso8601String(),
      'location': location,
      'pressure': pressure,
      'visibility': visibility,
      'uvIndex': uvIndex,
      'iconCode': iconCode,
      'precipitationMm': precipitationMm,
      'precipitationChance': precipitationChance,
      'airQualityIndex': airQualityIndex,
    };
  }

  // Create from JSON
  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      temperature: (json['temperature'] as num).toDouble(),
      feelsLike: (json['feelsLike'] as num).toDouble(),
      humidity: json['humidity'] as int,
      windSpeed: (json['windSpeed'] as num).toDouble(),
      condition: json['condition'] as String,
      description: json['description'] as String,
      dateTime: DateTime.parse(json['dateTime'] as String),
      location: json['location'] as String,
      pressure: (json['pressure'] as num?)?.toDouble(),
      visibility: (json['visibility'] as num?)?.toDouble(),
      uvIndex: json['uvIndex'] as int?,
      iconCode: json['iconCode'] as String?,
      precipitationMm: (json['precipitationMm'] as num?)?.toDouble(),
      precipitationChance: (json['precipitationChance'] as num?)?.toDouble(),
      airQualityIndex: json['airQualityIndex'] as int?,
    );
  }
}

class WeatherLocation {
  String id;
  String name;
  double latitude;
  double longitude;
  String? country;
  String? region;

  bool isDefault;
  bool isCurrentLocation;

  DateTime createdAt;
  DateTime? lastUsed;

  WeatherLocation({
    String? id,
    required this.name,
    required this.latitude,
    required this.longitude,
    this.country,
    this.region,
    this.isDefault = false,
    this.isCurrentLocation = false,
    DateTime? createdAt,
    this.lastUsed,
  }) : id = id ?? DateTime.now().millisecondsSinceEpoch.toString(),
       createdAt = createdAt ?? DateTime.now();
}

class WeatherForecast {
  String id;
  String locationId;
  DateTime forecastDate;
  DateTime fetchedAt;

  // Daily summary
  double minTemperature;
  double maxTemperature;
  String condition;
  String description;
  String? iconCode;

  // Hourly data (stored as JSON)
  String? hourlyDataJson;

  // Precipitation
  double? precipitationChance;
  double? precipitationMm;

  WeatherForecast({
    String? id,
    required this.locationId,
    required this.forecastDate,
    required this.fetchedAt,
    required this.minTemperature,
    required this.maxTemperature,
    required this.condition,
    required this.description,
    this.iconCode,
    this.hourlyDataJson,
    this.precipitationChance,
    this.precipitationMm,
  }) : id = id ?? DateTime.now().millisecondsSinceEpoch.toString();
}