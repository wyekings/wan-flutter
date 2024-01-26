import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:wan/net/response_exception.dart';

import 'base_response.dart';

typedef FromJson = dynamic Function(Map<String, dynamic>);

abstract class Decoder {
  T? decode<T, M>(Response<dynamic> response, M Function(dynamic) fromJson);
}

class BaseResponseDecoder extends Decoder {
  static final BaseResponseDecoder _instance = BaseResponseDecoder._();

  BaseResponseDecoder._();

  factory BaseResponseDecoder.getInstance() => _instance;

  @override
  T? decode<T, M>(Response<dynamic> response, M Function(dynamic) fromJson) {
    final data = response.data.toString();

    final baseResponse = BaseResponse<T?, M>.fromJson(json.decode(data),fromJson);

    debugPrint('ddddd=${baseResponse}');

    if (baseResponse.errorCode == 0) {
      return baseResponse.data;
    }
    throw ServiceException(baseResponse.errorCode, baseResponse.errorMsg ?? '');
  }
}
