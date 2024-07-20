import 'package:get_storage/get_storage.dart';

class LocalStorageServices {
  static final GetStorage box = GetStorage();
  // GetStorage box = GetStorage();
  Future<void> setString(String responseString, String key) async {
    box.write(key, responseString);
  }

  Future<String?> getString(String key) async {
    String? getValue = box.read(key);
    return getValue;
  }

  Future<void> setBool(bool data, String key) async {
    box.write(key, data);
  }

  Future<bool> getBool(String key) async {
    bool updated = box.read(key) ?? false;
    return updated;
  }

  Future<void> setInt(int data, String key) async {
    box.write(key, data);
  }

  Future<int?> getInt(String key) async {
    int? updated = box.read(key);
    return updated;
  }

  Future<void> remove(removeKey) async {
    box.remove(removeKey);
  }

  Future<void> clear() async {
    box.erase();
  }
}
