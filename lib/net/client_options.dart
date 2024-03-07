import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wan/net/exception_handler.dart';
import 'package:wan/net/response_decoder.dart';
import 'package:wan/net/http_manager.dart';

class ClientOptions {
  final String baseUrl;

  Decoder decoder;

  ExceptionHandler exceptionHandler;

  Map<String, dynamic>? headers;

  List<Interceptor>? interceptors;

  Duration? connectTimeout;

  Duration? sendTimeOut;

  Duration? receiveTimeOut;

  ClientOptions._(
    this.baseUrl,
    this.decoder,
    this.exceptionHandler,
    this.headers,
    this.interceptors,
    this.connectTimeout,
    this.sendTimeOut,
    this.receiveTimeOut,
  );

  ClientOptions._build(ClientOptionsBuilder builder)
      : baseUrl = builder._baseUrl,
        decoder = builder._decoder ?? BaseResponseDecoder.getInstance(),
        exceptionHandler =
            builder._exceptionHandler ?? DefaultExceptionHandler.getInstance(),
        headers = builder._headers,
        interceptors = builder._interceptors,
        connectTimeout = builder._connectTimeout,
        sendTimeOut = builder._sendTimeOut,
        receiveTimeOut = builder._receiveTimeOut;

  static ClientOptionsBuilder builder() => ClientOptionsBuilder();

  void apply() {
    HttpManager.init(this);
  }
}

class ClientOptionsBuilder {
  late String _baseUrl;

  Decoder? _decoder;

  ExceptionHandler? _exceptionHandler;

  Map<String, dynamic>? _headers;

  List<Interceptor>? _interceptors;

  Duration? _connectTimeout;

  Duration? _sendTimeOut;

  Duration? _receiveTimeOut;

  ClientOptionsBuilder baseUrl(String baseUrl) {
    _baseUrl = baseUrl;
    return this;
  }

  ClientOptionsBuilder decoder(Decoder decoder) {
    _decoder = decoder;
    return this;
  }

  ClientOptionsBuilder headers(Map<String,dynamic> headers) {
    _headers = headers;
    return this;
  }

  ClientOptionsBuilder connectTimeout(Duration duration) {
    _connectTimeout = duration;
    return this;
  }

  ClientOptionsBuilder receiveTimeout(Duration duration) {
    _receiveTimeOut = duration;
    return this;
  }

  ClientOptionsBuilder sendTimeout(Duration duration) {
    _sendTimeOut = duration;
    return this;
  }

  ClientOptionsBuilder addInterceptor(Interceptor interceptor) {
    _interceptors ??= [];
    _interceptors?.add(interceptor);
    return this;
  }

  ClientOptionsBuilder exceptionHandler(ExceptionHandler exceptionHandler) {
    _exceptionHandler = exceptionHandler;
    return this;
  }

  ClientOptions build() => ClientOptions._build(this);
}
