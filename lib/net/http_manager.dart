import 'package:dio/dio.dart';

import 'client_options.dart';

class HttpManager {
  final Dio _dio = Dio();

  Dio get dio => _dio;

  ClientOptions _clientOptions = ClientOptions.builder().build();

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
