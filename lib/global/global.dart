import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttery_timber/fluttery_timber.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wan/global/provider/model/auth.dart';
import 'package:wan/log/tree.dart';
import 'package:wan/net/client_options.dart';
import 'package:wan/net/response_decoder.dart';
import 'package:wan/storage/pref.dart';

class Global {
  static final Global _instance = Global._();

  Global._();

  factory Global.get() => _instance;

  late AuthProvider authState;

  late bool _authed;

  bool get isDebug => kDebugMode;

  bool get authed => _authed;

  Future<void> init() async {
    initLogger();
    final pref = Pref.get();
    await pref.init();
    final token = pref.getToken();
    // _authed = token.isNotEmpty;
    _authed = false;
    authState = AuthProvider(authed: false);

    final cookiePath = await getTemporaryDirectory();

    ClientOptions.builder()
        .baseUrl('https://www.wanandroid.com')
        .decoder(BaseResponseDecoder.getInstance())
        .addInterceptor(CookieManager(
            PersistCookieJar(storage: FileStorage(cookiePath.path))))
        .build()
        .apply();
  }

  void initLogger() {
    final tree = isDebug? DebugLoggerTree(): ReleaseTree();
    Timber.plantTree(tree);
  }
}
