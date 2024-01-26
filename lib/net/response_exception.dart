
sealed class ResponseException implements Exception{

  final int code;

  final String message;

  ResponseException(this.code, this.message);
}

class ServiceException extends ResponseException {

  ServiceException(super.code, super.message);

}

class UnexpectedException extends ResponseException {

  UnexpectedException(String message):super(-1,message);

}
