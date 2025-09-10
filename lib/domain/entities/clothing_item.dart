import 'package:equatable/equatable.dart';

enum ClothingType {
  top,
  bottom,
  shoes,
  accessory,
  outerwear,
  undergarment,
  jewelry,
  bag,
  hat,
  scarf,
  belt,
  gloves,
  swimwear,
  sleepwear,
  activewear,
  dress,
  jumpsuit,
  suit
}

enum Season {
  spring,
  summer,
  autumn,
  winter,
  allSeason
}

enum WeatherRange {
  veryHot, // 28°C+
  hot,     // 22°C+
  warm,    // 14°C+
  cool,    // 4°C+
  cold,    // -4°C+
  veryCold // -15°C+
}

class ClothingItem extends Equatable {
  final String id;
  final String name;
  final ClothingType type;
  final String? imagePath;
  final List<String> colors;
  final List<String> categories;
  final Season? season;
  final List<WeatherRange> weatherRanges;
  final int wearCount;
  final DateTime? lastWornDate;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? notes;
  final List<String> tags;

  const ClothingItem({
    required this.id,
    required this.name,
    required this.type,
    this.imagePath,
    this.colors = const [],
    this.categories = const [],
    this.season,
    this.weatherRanges = const [],
    this.wearCount = 0,
    this.lastWornDate,
    required this.createdAt,
    required this.updatedAt,
    this.notes,
    this.tags = const [],
  });

  ClothingItem copyWith({
    String? id,
    String? name,
    ClothingType? type,
    String? imagePath,
    List<String>? colors,
    List<String>? categories,
    Season? season,
    List<WeatherRange>? weatherRanges,
    int? wearCount,
    DateTime? lastWornDate,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? notes,
    List<String>? tags,
  }) {
    return ClothingItem(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      imagePath: imagePath ?? this.imagePath,
      colors: colors ?? this.colors,
      categories: categories ?? this.categories,
      season: season ?? this.season,
      weatherRanges: weatherRanges ?? this.weatherRanges,
      wearCount: wearCount ?? this.wearCount,
      lastWornDate: lastWornDate ?? this.lastWornDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      notes: notes ?? this.notes,
      tags: tags ?? this.tags,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        type,
        imagePath,
        colors,
        categories,
        season,
        weatherRanges,
        wearCount,
        lastWornDate,
        createdAt,
        updatedAt,
        notes,
        tags,
      ];
}