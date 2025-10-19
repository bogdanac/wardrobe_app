import 'package:equatable/equatable.dart';

enum ClothingType {
  top,
  bottom,
  dress,
  shoes,
  bag,
  accessory,
  outerwear,
  activewear,
  swimwear
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

enum MetallicElements {
  none,
  gold,
  silver
}

enum SizeFit {
  perfect,
  tooSmall,
  tooLarge,
  cropped,
  oversized
}

class ClothingItem extends Equatable {
  final String id;
  final String name;
  final String? brand;
  final ClothingType type;
  final String? imagePath; // Main image with background removal
  final List<String> additionalImages; // Additional images without processing
  final List<String> colors;
  final List<String> categories;
  final List<Season> seasons;
  final List<WeatherRange> weatherRanges;
  final int wearCount;
  final DateTime? lastWornDate;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? notes;
  final List<String> tags;
  final MetallicElements metallicElements;
  final SizeFit sizeFit;
  final bool isArchived;

  const ClothingItem({
    required this.id,
    required this.name,
    this.brand,
    required this.type,
    this.imagePath,
    this.additionalImages = const [],
    this.colors = const [],
    this.categories = const [],
    this.seasons = const [Season.allSeason],
    this.weatherRanges = const [],
    this.wearCount = 0,
    this.lastWornDate,
    required this.createdAt,
    required this.updatedAt,
    this.notes,
    this.tags = const [],
    this.metallicElements = MetallicElements.none,
    this.sizeFit = SizeFit.perfect,
    this.isArchived = false,
  });

  ClothingItem copyWith({
    String? id,
    String? name,
    String? brand,
    ClothingType? type,
    String? imagePath,
    List<String>? additionalImages,
    List<String>? colors,
    List<String>? categories,
    List<Season>? seasons,
    List<WeatherRange>? weatherRanges,
    int? wearCount,
    DateTime? lastWornDate,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? notes,
    List<String>? tags,
    MetallicElements? metallicElements,
    SizeFit? sizeFit,
    bool? isArchived,
  }) {
    return ClothingItem(
      id: id ?? this.id,
      name: name ?? this.name,
      brand: brand ?? this.brand,
      type: type ?? this.type,
      imagePath: imagePath ?? this.imagePath,
      additionalImages: additionalImages ?? this.additionalImages,
      colors: colors ?? this.colors,
      categories: categories ?? this.categories,
      seasons: seasons ?? this.seasons,
      weatherRanges: weatherRanges ?? this.weatherRanges,
      wearCount: wearCount ?? this.wearCount,
      lastWornDate: lastWornDate ?? this.lastWornDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      notes: notes ?? this.notes,
      tags: tags ?? this.tags,
      metallicElements: metallicElements ?? this.metallicElements,
      sizeFit: sizeFit ?? this.sizeFit,
      isArchived: isArchived ?? this.isArchived,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        brand,
        type,
        imagePath,
        additionalImages,
        colors,
        categories,
        seasons,
        weatherRanges,
        wearCount,
        lastWornDate,
        createdAt,
        updatedAt,
        notes,
        tags,
        metallicElements,
        sizeFit,
        isArchived,
      ];
}