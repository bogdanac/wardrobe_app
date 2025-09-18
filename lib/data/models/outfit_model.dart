import 'package:isar/isar.dart';
import '../../domain/entities/outfit.dart';
import '../../domain/entities/clothing_item.dart';

part 'outfit_model.g.dart';

@Collection()
class OutfitModel {
  Id? isarId;
  
  @Index(unique: true)
  String id;
  
  String name;
  List<String> clothingItemIds;
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
  bool isFavorite;
  bool isArchived;
  DateTime? dateArchived;
  String? imagePreviewPath;

  OutfitModel({
    this.isarId,
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
    this.isArchived = false,
    this.dateArchived,
    this.imagePreviewPath,
  });

  Outfit toEntity() {
    return Outfit(
      id: id,
      name: name,
      clothingItemIds: clothingItemIds,
      categories: categories,
      season: season,
      weatherRanges: weatherRanges,
      wearCount: wearCount,
      lastWornDate: lastWornDate,
      createdAt: createdAt,
      updatedAt: updatedAt,
      notes: notes,
      tags: tags,
      isFavorite: isFavorite,
      isArchived: isArchived,
      dateArchived: dateArchived,
      imagePreviewPath: imagePreviewPath,
    );
  }

  static OutfitModel fromEntity(Outfit entity) {
    return OutfitModel(
      id: entity.id,
      name: entity.name,
      clothingItemIds: entity.clothingItemIds,
      categories: entity.categories,
      season: entity.season,
      weatherRanges: entity.weatherRanges,
      wearCount: entity.wearCount,
      lastWornDate: entity.lastWornDate,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      notes: entity.notes,
      tags: entity.tags,
      isFavorite: entity.isFavorite,
      isArchived: entity.isArchived,
      dateArchived: entity.dateArchived,
      imagePreviewPath: entity.imagePreviewPath,
    );
  }
}