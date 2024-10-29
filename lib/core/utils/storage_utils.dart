import 'package:get_storage/get_storage.dart';

class BoxUtils {
  static final _box = GetStorage();

  static Future<void> init() async {
    await _box.initStorage;
  }

  static Future<void> write(String key, dynamic value) async {
    await _box.write(key, value);
  }

  static T? read<T>(String key) {
    return _box.read<T>(key);
  }

  static Future<void> remove(String key) async {
    await _box.remove(key);
  }

  static Future<void> clear() async {
    await _box.erase();
  }

  static bool? get isLoggedIn => _box.read('isLoggedIn');
}
