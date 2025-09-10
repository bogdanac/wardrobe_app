import 'dart:convert';
import 'package:isar/isar.dart';
import '../../domain/entities/user_feedback.dart';

part 'user_preferences_model.g.dart';

@Collection()
class UserPreferencesModel {
  Id id = Isar.autoIncrement;
  
  @Index(unique: true)
  late String userId;
  
  @ignore
  Map<String, double> get colorPreferences {
    if (_colorPreferences == null || _colorPreferences!.isEmpty) return {};
    try {
      final decoded = jsonDecode(_colorPreferences!);
      return Map<String, double>.from(decoded);
    } catch (e) {
      return {};
    }
  }
  set colorPreferences(Map<String, double> value) {
    _colorPreferences = jsonEncode(value);
  }
  String? _colorPreferences;

  @ignore
  Map<String, double> get categoryPreferences {
    if (_categoryPreferences == null || _categoryPreferences!.isEmpty) return {};
    try {
      final decoded = jsonDecode(_categoryPreferences!);
      return Map<String, double>.from(decoded);
    } catch (e) {
      return {};
    }
  }
  set categoryPreferences(Map<String, double> value) {
    _categoryPreferences = jsonEncode(value);
  }
  String? _categoryPreferences;

  @ignore
  Map<String, double> get combinationPreferences {
    if (_combinationPreferences == null || _combinationPreferences!.isEmpty) return {};
    try {
      final decoded = jsonDecode(_combinationPreferences!);
      return Map<String, double>.from(decoded);
    } catch (e) {
      return {};
    }
  }
  set combinationPreferences(Map<String, double> value) {
    _combinationPreferences = jsonEncode(value);
  }
  String? _combinationPreferences;

  @ignore
  Map<String, double> get weatherPreferences {
    if (_weatherPreferences == null || _weatherPreferences!.isEmpty) return {};
    try {
      final decoded = jsonDecode(_weatherPreferences!);
      return Map<String, double>.from(decoded);
    } catch (e) {
      return {};
    }
  }
  set weatherPreferences(Map<String, double> value) {
    _weatherPreferences = jsonEncode(value);
  }
  String? _weatherPreferences;

  @ignore
  Map<String, double> get seasonPreferences {
    if (_seasonPreferences == null || _seasonPreferences!.isEmpty) return {};
    try {
      final decoded = jsonDecode(_seasonPreferences!);
      return Map<String, double>.from(decoded);
    } catch (e) {
      return {};
    }
  }
  set seasonPreferences(Map<String, double> value) {
    _seasonPreferences = jsonEncode(value);
  }
  String? _seasonPreferences;

  late DateTime lastUpdated;
  late int totalFeedbacks;

  UserPreferencesModel({
    required this.userId,
    Map<String, double> colorPreferences = const {},
    Map<String, double> categoryPreferences = const {},
    Map<String, double> combinationPreferences = const {},
    Map<String, double> weatherPreferences = const {},
    Map<String, double> seasonPreferences = const {},
    required this.lastUpdated,
    this.totalFeedbacks = 0,
  }) {
    this.colorPreferences = colorPreferences;
    this.categoryPreferences = categoryPreferences;
    this.combinationPreferences = combinationPreferences;
    this.weatherPreferences = weatherPreferences;
    this.seasonPreferences = seasonPreferences;
  }

  UserPreferencesModel.empty() {
    userId = '';
    lastUpdated = DateTime.now();
    totalFeedbacks = 0;
    _colorPreferences = jsonEncode({});
    _categoryPreferences = jsonEncode({});
    _combinationPreferences = jsonEncode({});
    _weatherPreferences = jsonEncode({});
    _seasonPreferences = jsonEncode({});
  }

  UserPreferences toEntity() {
    return UserPreferences(
      userId: userId,
      colorPreferences: colorPreferences,
      categoryPreferences: categoryPreferences,
      combinationPreferences: combinationPreferences,
      weatherPreferences: weatherPreferences,
      seasonPreferences: seasonPreferences,
      lastUpdated: lastUpdated,
      totalFeedbacks: totalFeedbacks,
    );
  }

  UserPreferencesModel copyWith({
    String? userId,
    Map<String, double>? colorPreferences,
    Map<String, double>? categoryPreferences,
    Map<String, double>? combinationPreferences,
    Map<String, double>? weatherPreferences,
    Map<String, double>? seasonPreferences,
    DateTime? lastUpdated,
    int? totalFeedbacks,
  }) {
    return UserPreferencesModel(
      userId: userId ?? this.userId,
      colorPreferences: colorPreferences ?? this.colorPreferences,
      categoryPreferences: categoryPreferences ?? this.categoryPreferences,
      combinationPreferences: combinationPreferences ?? this.combinationPreferences,
      weatherPreferences: weatherPreferences ?? this.weatherPreferences,
      seasonPreferences: seasonPreferences ?? this.seasonPreferences,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      totalFeedbacks: totalFeedbacks ?? this.totalFeedbacks,
    );
  }
}