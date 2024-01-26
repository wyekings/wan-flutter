import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
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
    _dio.interceptors.add(
      PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
          maxWidth: 90),
    );

    _dio.options = BaseOptions(
      baseUrl: _clientOptions.baseUrl,
      responseType: ResponseType.plain,
    );
  }

  static void init(ClientOptions clientOptions) {
    HttpManager.getInstance().options(clientOptions).apply();
  }
}
