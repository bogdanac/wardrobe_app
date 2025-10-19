import 'package:equatable/equatable.dart';
import 'clothing_item.dart';

class Outfit extends Equatable {
  final String id;
  final String name;
  final List<String> clothingItemIds;
  final List<String> categories; // Deprecated: use outfitStyles instead
  final List<String> outfitStyles;
  final List<Season> seasons;
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
  final String? parentOutfitId; // Links to base outfit if this is a variant
  final int variantCount; // Number of variants for this base outfit

  const Outfit({
    required this.id,
    required this.name,
    this.clothingItemIds = const [],
    this.categories = const [], // Deprecated: use outfitStyles instead
    this.outfitStyles = const [],
    this.seasons = const [Season.allSeason],
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
    this.parentOutfitId,
    this.variantCount = 0,
  });

  Outfit copyWith({
    String? id,
    String? name,
    List<String>? clothingItemIds,
    List<String>? categories,
    List<String>? outfitStyles,
    List<Season>? seasons,
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
    String? parentOutfitId,
    int? variantCount,
  }) {
    return Outfit(
      id: id ?? this.id,
      name: name ?? this.name,
      clothingItemIds: clothingItemIds ?? this.clothingItemIds,
      categories: categories ?? this.categories,
      outfitStyles: outfitStyles ?? this.outfitStyles,
      seasons: seasons ?? this.seasons,
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
      parentOutfitId: parentOutfitId ?? this.parentOutfitId,
      variantCount: variantCount ?? this.variantCount,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        clothingItemIds,
        categories,
        outfitStyles,
        seasons,
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
        parentOutfitId,
        variantCount,
      ];
}