import 'dart:ffi';

import 'package:wan/storage/get_storage_impl.dart';
import 'package:wan/storage/storage.dart';

enum PrefKeys { token }

class Pref {
  late Storage _storage;

  Pref._();

  static final Pref _instance = Pref._();

  factory Pref.get() => _instance;

  /// init Pref first.
  Future<Storage> init() async {
    return _storage = await GetStorageImpl.init();
  }

  void saveToken(String token) async {
    _storage.write(PrefKeys.token.name, token);
  }

  String getToken() => _storage.read(PrefKeys.token.name, "");

  bool authed() => getToken().isNotEmpty;
}
