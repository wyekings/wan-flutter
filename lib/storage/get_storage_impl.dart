import 'package:get_storage/get_storage.dart';
import 'package:wan/storage/storage.dart';

class GetStorageImpl implements Storage {
  final _box = GetStorage();

  GetStorageImpl._();

  static Future<GetStorageImpl> init() async {
    await GetStorage.init();
    return GetStorageImpl._();
  }

  @override
  void clear() => _box.erase();

  @override
  T read<T>(String key, T defaultValue) => _box.read(key) ?? defaultValue;

  @override
  void remove(String key) => _box.remove(key);

  @override
  void write(String key, value) => _box.write(key, value);
}
