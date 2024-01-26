import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:wan/net/decoder.dart';
import 'package:wan/net/exception_handler.dart';
import 'package:wan/net/http_manager.dart';
import 'package:wan/net/result.dart';
import 'package:wan/ui/home/data/entity/banner_entity.dart';

Future<Result<T?>> get<T>(
  String url,
  FromJson fromJson, {
  Object? data,
  Map<String, dynamic>? queryParameters,
  CancelToken? cancelToken,
  Options? options,
  ProgressCallback? onSendProgress,
  ProgressCallback? onReceiveProgress,
  Decoder? decoder,
  ExceptionHandler? exceptionHandler,
}) async =>
    _request(url, 'GET', fromJson,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: options,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);

Future<Result<T?>> post<T>(
  String url,
  FromJson fromJson, {
  Object? data,
  Map<String, dynamic>? queryParameters,
  CancelToken? cancelToken,
  Options? options,
  ProgressCallback? onSendProgress,
  ProgressCallback? onReceiveProgress,
  Decoder? decoder,
  ExceptionHandler? exceptionHandler,
}) async =>
    _request(url, 'POST', fromJson,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: options,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);

Future<Result<T?>> _request<T>(
  String url,
  String method,
  FromJson fromJson, {
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

    Message message = createMessage(response, fromJson, decoder);

    T? result = await compute<Message, T?>(
        (message) =>
            message.decoder.decode<T?>(message.response, message.fromJson),
        message);
    return Result.success(result);
  } on Exception catch (e) {
    return Result.failure(exceptionHandler.handle(e));
  } on Error catch (e) {
    return Result.failure(exceptionHandler.handle(e));
  }
}

Options _checkOptions(String method, Options? options) {
  options ??= Options();
  options.method = method;
  return options;
}

Message createMessage(
        Response<dynamic> response, FromJson fromJson, Decoder? decoder) =>
    Message(
      response,
      fromJson,
      decoder ?? HttpManager.getInstance().decoder,
    );

class Message {
  final Response<dynamic> response;
  final FromJson fromJson;
  final Decoder decoder;

  Message(this.response, this.fromJson, this.decoder);
}

void test() async {
  var result =
      await get<BannerEntity>("", (json) => BannerEntity.fromJson(json));
  result.when(
    onSuccess: (it) {},
    onFailure: (e) {},
  );
}
