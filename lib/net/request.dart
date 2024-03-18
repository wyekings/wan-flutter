import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:wan/net/exception_handler.dart';
import 'package:wan/net/http_manager.dart';
import 'package:wan/net/response_decoder.dart';
import 'package:wan/net/result.dart';

Future<Result<T>> get<T>(
  String path, {
  Object? data,
  Map<String, dynamic>? queryParameters,
  CancelToken? cancelToken,
  Options? options,
  ProgressCallback? onSendProgress,
  ProgressCallback? onReceiveProgress,
  Decoder? decoder,
  ExceptionHandler? exceptionHandler,
}) async =>
    await _result(
        (dio) => dio.get(path,
            data: data,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress),
        decoder,
        exceptionHandler);

Future<Result<T>> post<T>(
  String path, {
  Object? data,
  Map<String, dynamic>? queryParameters,
  CancelToken? cancelToken,
  Options? options,
  ProgressCallback? onSendProgress,
  ProgressCallback? onReceiveProgress,
  Decoder? decoder,
  ExceptionHandler? exceptionHandler,
}) async =>
    await _result(
        (dio) => dio.post(path,
            data: data,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress),
        decoder,
        exceptionHandler);

Future<Result<T>> _result<T>(
  Future<Response<dynamic>> Function(Dio) request,
  Decoder? decoder,
  ExceptionHandler? exceptionHandler,
) async {
  decoder ??= HttpManager.getInstance().decoder;
  exceptionHandler ??= HttpManager.getInstance().exceptionHandler;
  try {
    Dio dio = HttpManager.getInstance().dio;
    Response<dynamic> response = await request(dio);
    _Message message = _Message.create(response, decoder);
    T result = await compute<_Message, T>(
        (callback) => callback.decoder.decode<T>(callback.response), message);
    return Result.success(result);
  } on Exception catch (e) {
    return Result.failure(exceptionHandler.handle(e));
  } on Error catch (e) {
    return Result.failure(exceptionHandler.handle(e));
  }
}

class _Message {
  final Response<dynamic> response;
  final Decoder decoder;

  _Message._(this.response, this.decoder);

  factory _Message.create(Response<dynamic> response, Decoder? decoder) =>
      _Message._(response, decoder ?? HttpManager.getInstance().decoder);
}
