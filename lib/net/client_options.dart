import 'dart:io';

import 'package:wan/net/http_manager.dart';

class ClientOptions {
  final String baseUrl;

  ClientOptions._(this.baseUrl);

  ClientOptions._build(ClientOptionsBuilder builder)
      : baseUrl = builder._baseUrl;

  static ClientOptionsBuilder builder() => ClientOptionsBuilder();

  void apply() {
    HttpManager.init(this);
  }
}

class ClientOptionsBuilder {
  late String _baseUrl;

  ClientOptionsBuilder baseUrl(String baseUrl) {
    _baseUrl = baseUrl;
    return this;
  }

  ClientOptions build() => ClientOptions._build(this);
}