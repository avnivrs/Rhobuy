import 'package:hive/hive.dart';

class HiveService {
  static const _boxName = 'walkthrough';

  static Future<Box<bool>> openBox() async {
    await Hive.openBox<bool>(_boxName);
    return Hive.box<bool>(_boxName);
  }
}
