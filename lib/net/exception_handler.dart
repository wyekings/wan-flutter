
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
    if(e is ResponseException) {
      return e;
    } if(e is DioException){
      String message = e.type.toString();
      return UnexpectedException(message);
    }
    else if (e is Exception) {
      return UnexpectedException(e.toString());
    } else if (e is Error){
      return UnexpectedException('unexpected error');
    } else {
      return UnexpectedException('unexpected exception');
    }
  }
}