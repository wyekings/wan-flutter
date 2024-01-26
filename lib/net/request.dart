import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:wan/net/decoder.dart';
import 'package:wan/net/exception_handler.dart';
import 'package:wan/net/http_manager.dart';
import 'package:wan/net/result.dart';

Future<Result<T?>> get<T, M>(
  String url,
  M Function(dynamic) fromJson, {
  Object? data,
  Map<String, dynamic>? queryParameters,
  CancelToken? cancelToken,
  Options? options,
  ProgressCallback? onSendProgress,
  ProgressCallback? onReceiveProgress,
  Decoder? decoder,
  ExceptionHandler? exceptionHandler,
}) async =>
    await _request<T, M>(url, 'GET', fromJson,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: options,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);

Future<Result<T?>> post<T, M>(
  String url,
  M Function(dynamic) fromJson, {
  Object? data,
  Map<String, dynamic>? queryParameters,
  CancelToken? cancelToken,
  Options? options,
  ProgressCallback? onSendProgress,
  ProgressCallback? onReceiveProgress,
  Decoder? decoder,
  ExceptionHandler? exceptionHandler,
}) async =>
    await _request(url, 'POST', fromJson,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: options,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);

Future<Result<T?>> _request<T, M>(
  String url,
  String method,
  M Function(dynamic) fromJson, {
  Object? data,
  Map<String, dynamic>? queryParameters,
  CancelToken? cancelToken,
  Options? options,
  ProgressCallback? onSendProgress,
  ProgressCallback? onReceiveProgress,
  Decoder? decoder,
  ExceptionHandler? exceptionHandler,
}) async {
  Dio dio = HttpManager.getInstance().dio;
  exceptionHandler ??= DefaultExceptionHandler.getInstance();
  try {
    Response<dynamic> response = await dio.request(url,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: _checkOptions(method, options),
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);

    Message<M> message = createMessage<M>(response, fromJson, decoder);
    T? result = await compute<Message<M>, T?>(
        (message) =>
            message.decoder.decode<T?, M>(message.response, message.fromJson),
        message);

    return Result.success(result);
  } on Exception catch (e) {
    return Result.failure(exceptionHandler.handle(e));
  } on Error catch (e) {
    debugPrint('error=$e');
    return Result.failure(exceptionHandler.handle(e));
  }
}

Options _checkOptions(String method, Options? options) {
  options ??= Options();
  options.responseType = ResponseType.plain;
  options.method = method;
  return options;
}

Message<M> createMessage<M>(Response<dynamic> response,
        M Function(dynamic) fromJson, Decoder? decoder) =>
    Message(
      response,
      fromJson,
      decoder ?? HttpManager.getInstance().decoder,
    );

class Message<M> {
  final Response<dynamic> response;
  final M Function(dynamic) fromJson;
  final Decoder decoder;

  Message(this.response, this.fromJson, this.decoder);
}
