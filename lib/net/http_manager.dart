import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:wan/net/exception_handler.dart';
import 'package:wan/net/response_decoder.dart';

import 'client_options.dart';

class HttpManager {

  late ClientOptions _clientOptions;

  final Dio _dio = Dio();

  Dio get dio => _dio;

  Decoder get decoder => _clientOptions.decoder;

  ExceptionHandler get exceptionHandler => _clientOptions.exceptionHandler;

  HttpManager._();

  static final HttpManager _instance = HttpManager._();

  factory HttpManager.getInstance() => _instance;

  HttpManager options(ClientOptions clientOptions) {
    _clientOptions = clientOptions;
    return this;
  }

  void apply() {
    if (_clientOptions.interceptors?.isNotEmpty ?? false) {
      _dio.interceptors.addAll(_clientOptions.interceptors!);
    }

    if (kDebugMode) {
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
    }

    _dio.options = BaseOptions(
      baseUrl: _clientOptions.baseUrl,
      responseType: ResponseType.plain,
      connectTimeout: _clientOptions.connectTimeout,
      receiveTimeout: _clientOptions.receiveTimeOut,
      sendTimeout: _clientOptions.sendTimeOut,
      // headers:  _clientOptions.headers,
    );
  }

  static void init(ClientOptions clientOptions) {
    HttpManager.getInstance().options(clientOptions).apply();
  }
}
