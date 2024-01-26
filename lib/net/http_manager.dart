import 'package:dio/dio.dart';
import 'package:wan/net/decoder.dart';

import 'client_options.dart';

class HttpManager {
  late ClientOptions _clientOptions;

  final Dio _dio = Dio();

  Dio get dio => _dio;

  Decoder get decoder => _clientOptions.decoder;

  HttpManager._();

  static final HttpManager _instance = HttpManager._();

  factory HttpManager.getInstance() => _instance;

  HttpManager options(ClientOptions clientOptions) {
    _clientOptions = clientOptions;
    return this;
  }

  void apply() {
    _dio.options = BaseOptions(
      baseUrl: _clientOptions.baseUrl,
      contentType: 'application/json',
    );
  }

  static void init(ClientOptions clientOptions) {
    HttpManager.getInstance().options(clientOptions).apply();
  }
}
