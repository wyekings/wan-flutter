
import 'package:wan/storage/get_storage_impl.dart';
import 'package:wan/storage/storage.dart';

enum PrefKeys { token,userName,admin }

class Pref {
  late Storage _storage;

  Pref._();

  static final Pref _instance = Pref._();

  factory Pref.get() => _instance;

  /// init Pref first.
  Future<Storage> init() async {
    return _storage = await GetStorageImpl.init();
  }

  void saveUserName(String userName) {
    _storage.write(PrefKeys.userName.name, userName);
  }

  void saveAdmin(bool admin) {
    _storage.write(PrefKeys.admin.name, admin);
  }

  void clear(){
    _storage.clear();
  }

  String getUserName() => _storage.read(PrefKeys.userName.name, "");

  bool authed() => getUserName().isNotEmpty;
}
