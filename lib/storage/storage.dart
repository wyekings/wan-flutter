
import 'package:get_storage/get_storage.dart';

// class Storage {
//
//   Storage._();
//
//   static final Storage _instance = Storage._();
//
//   factory Storage.getInstance() => _instance;
//
//   final _box = GetStorage();
//
//   GetStorage get box => _box;
// }

abstract class Storage {

  T read<T>(String key, T defaultValue);

  void write(String key, dynamic value);

  void remove(String key);

  void clear();
}
