import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:wan/net/response_exception.dart';

import 'base_response.dart';

abstract class Decoder {
  T decode<T>(Response<dynamic> response);
}

class BaseResponseDecoder extends Decoder {
  static final BaseResponseDecoder _instance = BaseResponseDecoder._();

  BaseResponseDecoder._();

  factory BaseResponseDecoder.getInstance() => _instance;

  @override
  T decode<T>(Response<dynamic> response) {
    final data = response.data.toString();
    final baseResponse = BaseResponse<T>.fromJson(json.decode(data));
    debugPrint('${baseResponse.data}');
    if (baseResponse.errorCode == 0) {
      return baseResponse.data as T;
    }
    throw ServiceException(baseResponse.errorCode, baseResponse.errorMsg ?? '');
  }
}
