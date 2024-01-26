import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:wan/net/response_exception.dart';

import 'base_response.dart';

typedef FromJson = dynamic Function(Map<String, dynamic>);

abstract class Decoder {
  T? decode<T>(Response<dynamic> response, FromJson fromJson);
}

class BaseResponseDecoder extends Decoder {
  static final BaseResponseDecoder _instance = BaseResponseDecoder._();

  BaseResponseDecoder._();

  factory BaseResponseDecoder.getInstance() => _instance;

  @override
  T? decode<T>(Response<dynamic> response, FromJson fromJson) {
    final data = response.data.toString();
    final baseResponse = BaseResponse<T?>.fromJson(
        json.decode(data), (data) => {fromJson(json.decode(data))});

    if (baseResponse.errorCode == 0) {
      return baseResponse.data;
    }
    throw ServiceException(
        baseResponse.errorCode, baseResponse.errorMessage ?? '');
  }
}
