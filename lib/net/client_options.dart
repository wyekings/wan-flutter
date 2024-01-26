import 'dart:io';

import 'package:wan/net/decoder.dart';
import 'package:wan/net/http_manager.dart';

class ClientOptions {
  final String baseUrl;

  Decoder decoder;

  ClientOptions._(this.baseUrl, this.decoder);

  ClientOptions._build(ClientOptionsBuilder builder)
      : baseUrl = builder._baseUrl,
        decoder = builder._decoder ??  BaseResponseDecoder.getInstance();

  static ClientOptionsBuilder builder() => ClientOptionsBuilder();

  void apply() {
    HttpManager.init(this);
  }
}

class ClientOptionsBuilder {
  late String _baseUrl;

  Decoder? _decoder;

  ClientOptionsBuilder baseUrl(String baseUrl) {
    _baseUrl = baseUrl;
    return this;
  }

  ClientOptionsBuilder decoder(Decoder decoder) {
    _decoder = decoder;
    return this;
  }

  ClientOptions build() => ClientOptions._build(this);
}
