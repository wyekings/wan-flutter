import 'package:dio/dio.dart';
import 'package:wan/net/response_exception.dart';

abstract interface class ExceptionHandler {
  ResponseException handle(dynamic e);
}

class DefaultExceptionHandler implements ExceptionHandler {
  static final DefaultExceptionHandler _instance = DefaultExceptionHandler._();

  DefaultExceptionHandler._();

  factory DefaultExceptionHandler.getInstance() => _instance;

  @override
  ResponseException handle(dynamic e) {
    if (e is ResponseException) {
      return e;
    }
    if (e is DioException) {
      String message = 'dio:${e.type.toString()}';
      return UnexpectedException(message);
    }
    if (e is Exception) {
      return UnexpectedException(e.toString());
    }
    if (e is Error) {
      return UnexpectedException('unexpected error');
    }
    return UnexpectedException('unexpected exception');
  }
}
