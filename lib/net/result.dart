import 'package:wan/net/response_exception.dart';

class Result<T> {
  final dynamic _value;

  Result._(this._value);

  factory Result.success(T value) => Result._(value);

  factory Result.failure(ResponseException exception) =>
      Result._(Failure(exception));

  bool get isSuccess => _value is! Failure;

  bool get isFailure => _value is Failure;

  T? getOrNull() {
    if (isSuccess) {
      return _value as T;
    } else {
      return null;
    }
  }

  Exception? exceptionOrNull() {
    if (isFailure) {
      return (_value as Failure).exception;
    } else {
      return null;
    }
  }
}

extension ResultExtension<T> on Result<T> {
  void when({
    void Function(T)? onSuccess,
    void Function(ResponseException)? onFailure,
  }) {
    if (isSuccess) {
      if (onSuccess != null) {
        onSuccess(_value);
      }
    } else if (onFailure != null) {
      onFailure((_value as Failure).exception);
    }
  }

  T getOrThrow() {
    if (isFailure) {
      throw (_value as Failure).exception;
    }
    return _value as T;
  }

  T getOrDefault(T defaultValue) {
    if (isFailure) {
      return defaultValue;
    }
    return _value as T;
  }
}

class Failure {
  final ResponseException exception;

  Failure(this.exception);
}
