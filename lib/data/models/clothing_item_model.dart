import 'package:isar/isar.dart';
import '../../domain/entities/clothing_item.dart';

part 'clothing_item_model.g.dart';

@Collection()
class ClothingItemModel {
  Id? isarId;
  
  @Index(unique: true)
  String id;
  
  String name;
  
  @Enumerated(EnumType.name)
  ClothingType type;
  
  String? imagePath;
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

  ClothingItemModel({
    this.isarId,
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

  ClothingItem toEntity() {
    return ClothingItem(
      id: id,
      name: name,
      type: type,
      imagePath: imagePath,
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
    );
  }

  static ClothingItemModel fromEntity(ClothingItem entity) {
    return ClothingItemModel(
      id: entity.id,
      name: entity.name,
      type: entity.type,
      imagePath: entity.imagePath,
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
    );
  }
}