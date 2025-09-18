import 'package:equatable/equatable.dart';
import 'clothing_item.dart';

class Outfit extends Equatable {
  final String id;
  final String name;
  final List<String> clothingItemIds;
  final List<String> categories;
  final Season? season;
  final List<WeatherRange> weatherRanges;
  final int wearCount;
  final DateTime? lastWornDate;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? notes;
  final List<String> tags;
  final bool isFavorite;
  final String? imagePreviewPath;
  final bool isArchived;
  final DateTime? dateArchived;

  const Outfit({
    required this.id,
    required this.name,
    this.clothingItemIds = const [],
    this.categories = const [],
    this.season,
    this.weatherRanges = const [],
    this.wearCount = 0,
    this.lastWornDate,
    required this.createdAt,
    required this.updatedAt,
    this.notes,
    this.tags = const [],
    this.isFavorite = false,
    this.imagePreviewPath,
    this.isArchived = false,
    this.dateArchived,
  });

  Outfit copyWith({
    String? id,
    String? name,
    List<String>? clothingItemIds,
    List<String>? categories,
    Season? season,
    List<WeatherRange>? weatherRanges,
    int? wearCount,
    DateTime? lastWornDate,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? notes,
    List<String>? tags,
    bool? isFavorite,
    String? imagePreviewPath,
    bool? isArchived,
    DateTime? dateArchived,
  }) {
    return Outfit(
      id: id ?? this.id,
      name: name ?? this.name,
      clothingItemIds: clothingItemIds ?? this.clothingItemIds,
      categories: categories ?? this.categories,
      season: season ?? this.season,
      weatherRanges: weatherRanges ?? this.weatherRanges,
      wearCount: wearCount ?? this.wearCount,
      lastWornDate: lastWornDate ?? this.lastWornDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      notes: notes ?? this.notes,
      tags: tags ?? this.tags,
      isFavorite: isFavorite ?? this.isFavorite,
      imagePreviewPath: imagePreviewPath ?? this.imagePreviewPath,
      isArchived: isArchived ?? this.isArchived,
      dateArchived: dateArchived ?? this.dateArchived,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        clothingItemIds,
        categories,
        season,
        weatherRanges,
        wearCount,
        lastWornDate,
        createdAt,
        updatedAt,
        notes,
        tags,
        isFavorite,
        imagePreviewPath,
        isArchived,
        dateArchived,
      ];
}