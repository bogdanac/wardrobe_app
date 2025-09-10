import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../../data/models/clothing_item_model.dart';
import '../../data/models/outfit_model.dart';
import '../../data/models/category_model.dart';
import '../../data/models/color_palette_model.dart';
import '../../data/models/user_feedback_model.dart';
import '../../data/models/user_preferences_model.dart';

class DatabaseService {
  static DatabaseService? _instance;
  static Isar? _isar;

  DatabaseService._internal();

  static DatabaseService get instance {
    _instance ??= DatabaseService._internal();
    return _instance!;
  }

  Future<Isar> get isar async {
    if (_isar == null) {
      await _initDatabase();
    }
    return _isar!;
  }

  Future<void> _initDatabase() async {
    final dir = await getApplicationDocumentsDirectory();
    
    _isar = await Isar.open(
      [
        ClothingItemModelSchema,
        OutfitModelSchema,
        CategoryModelSchema,
        ColorPaletteModelSchema,
        UserFeedbackModelSchema,
        UserPreferencesModelSchema,
      ],
      directory: dir.path,
    );
  }

  Future<void> close() async {
    if (_isar != null) {
      await _isar!.close();
      _isar = null;
    }
  }

  Future<void> clear() async {
    final db = await isar;
    await db.writeTxn(() async {
      await db.clear();
    });
  }
}