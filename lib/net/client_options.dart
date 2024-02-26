import 'dart:io';

import 'package:wan/net/exception_handler.dart';
import 'package:wan/net/response_decoder.dart';
import 'package:wan/net/http_manager.dart';

class ClientOptions {
  final String baseUrl;

  Decoder decoder;

  ExceptionHandler exceptionHandler;

  ClientOptions._(this.baseUrl, this.decoder, this.exceptionHandler);

  ClientOptions._build(ClientOptionsBuilder builder)
      : baseUrl = builder._baseUrl,
        decoder = builder._decoder ?? BaseResponseDecoder.getInstance(),
        exceptionHandler =
            builder._exceptionHandler ?? DefaultExceptionHandler.getInstance();

  static ClientOptionsBuilder builder() => ClientOptionsBuilder();

  void apply() {
    HttpManager.init(this);
  }
}

class ClientOptionsBuilder {
  late String _baseUrl;

  Decoder? _decoder;

  ExceptionHandler? _exceptionHandler;

  ClientOptionsBuilder baseUrl(String baseUrl) {
    _baseUrl = baseUrl;
    return this;
  }

  ClientOptionsBuilder decoder(Decoder decoder) {
    _decoder = decoder;
    return this;
  }

  ClientOptionsBuilder exceptionHandler(ExceptionHandler exceptionHandler) {
    _exceptionHandler = exceptionHandler;
    return this;
  }

  ClientOptions build() => ClientOptions._build(this);
}
