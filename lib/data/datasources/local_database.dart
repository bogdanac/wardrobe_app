import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/clothing_item_model.dart';

class LocalDatabase {
  static Isar? _isar;

  static Future<Isar> get isar async {
    if (_isar != null) return _isar!;

    final dir = await getApplicationDocumentsDirectory();

    _isar = await Isar.open(
      [ClothingItemModelSchema],
      directory: dir.path,
    );

    return _isar!;
  }

  static Future<void> close() async {
    if (_isar != null) {
      await _isar!.close();
      _isar = null;
    }
  }
}