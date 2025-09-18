import 'package:isar/isar.dart';
import '../../domain/entities/clothing_item.dart';

part 'clothing_item_model.g.dart';

@Collection()
class ClothingItemModel {
  Id? isarId;
  
  @Index(unique: true)
  String id;

  String name;
  String? brand;

  @Enumerated(EnumType.name)
  ClothingType type;
  
  String? imagePath;
  List<String> additionalImages;
  List<String> colors;
  List<String> categories;
  
  @Enumerated(EnumType.name)
  Season? season;
  
  @Enumerated(EnumType.name)
  List<WeatherRange> weatherRanges;
  
  int wearCount;
  DateTime? lastWornDate;
  DateTime createdAt;
  DateTime updatedAt;
  String? notes;
  List<String> tags;
  
  @Enumerated(EnumType.name)
  MetallicElements metallicElements;

  @Enumerated(EnumType.name)
  SizeFit sizeFit;

  bool isArchived;

  ClothingItemModel({
    this.isarId,
    required this.id,
    required this.name,
    this.brand,
    required this.type,
    this.imagePath,
    this.additionalImages = const [],
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
    this.metallicElements = MetallicElements.none,
    this.sizeFit = SizeFit.perfect,
    this.isArchived = false,
  });

  ClothingItem toEntity() {
    return ClothingItem(
      id: id,
      name: name,
      brand: brand,
      type: type,
      imagePath: imagePath,
      additionalImages: additionalImages,
      colors: colors,
      categories: categories,
      season: season,
      weatherRanges: weatherRanges,
      wearCount: wearCount,
      lastWornDate: lastWornDate,
      createdAt: createdAt,
      updatedAt: updatedAt,
      notes: notes,
      tags: tags,
      metallicElements: metallicElements,
      sizeFit: sizeFit,
      isArchived: isArchived,
    );
  }

  static ClothingItemModel fromEntity(ClothingItem entity) {
    return ClothingItemModel(
      id: entity.id,
      name: entity.name,
      brand: entity.brand,
      type: entity.type,
      imagePath: entity.imagePath,
      additionalImages: entity.additionalImages,
      colors: entity.colors,
      categories: entity.categories,
      season: entity.season,
      weatherRanges: entity.weatherRanges,
      wearCount: entity.wearCount,
      lastWornDate: entity.lastWornDate,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      notes: entity.notes,
      tags: entity.tags,
      metallicElements: entity.metallicElements,
      sizeFit: entity.sizeFit,
      isArchived: entity.isArchived,
    );
  }
}