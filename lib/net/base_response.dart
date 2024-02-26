import 'package:flutter/foundation.dart';
import 'package:wan/generated/json/base/json_convert_content.dart';
import 'package:wan/ui/home/data/entity/banner_entity.dart';

class BaseResponse<T> {
  final T? data;
  final int errorCode;
  final String? errorMsg;

  BaseResponse(
      { required this.data, required this.errorCode, required this.errorMsg});

  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson<T>(json);

  // factory BaseResponse.fromJson(
  //         Map<String, dynamic> json, T Function(dynamic json) fromJsonT) =>
  //     _$BaseResponseFromJson<T>(json, fromJsonT);

  Map<String, dynamic> toJson(dynamic Function(dynamic value) toJsonT) =>
      _$BaseResponseToJson<T>(this, toJsonT);
}

BaseResponse<T> _$BaseResponseFromJson<T>(
    Map<String, dynamic> json,
    ) {
  return BaseResponse(
    data: JsonConvert.fromJsonAsT<T?>(json['data']),
    errorCode: json['errorCode'] ??=-1,
    errorMsg: json['errorMsg'] ??='',
  );
}

// BaseResponse<T> _$BaseResponseFromJson<T>(
//   Map<String, dynamic> json,
//   T Function(dynamic json) fromJsonT,
// ) {
//   return BaseResponse<T>(
//     data: _fromJson<T>(json['data'], fromJsonT),
//     errorCode: json['errorCode'] as int,
//     errorMsg: json['errorMsg'] as String,
//   );
// }

Map<String, dynamic> _$BaseResponseToJson<T>(
  BaseResponse<T> response,
  dynamic Function(dynamic value) toJsonT,
) =>
    <String, dynamic>{
      'data': _toJson(response.data, toJsonT),
      'errorCode': response.errorCode,
      'errorMsg': response.errorMsg,
    };

dynamic _fromJson<T>(
  dynamic json,
  T Function(dynamic json) fromJson,
) {
  if (json == null) {
    return null;
  }
  if (json is List) {
    debugPrint('json=${json.runtimeType}');
    List d = json.map((e) => fromJson(e)).toList();
    var c=  json.map((i) {
      var a = (fromJson(i) as List)[0];
      debugPrint('a=${a}');
      a;
      i;
    });
    debugPrint('result=${d}');
    return d;
  } else {
    return fromJson(json);
  }
}

dynamic _toJson(
  dynamic json,
  dynamic Function(dynamic value) toJson,
) {
  if (json == null) {
    return null;
  }

  if (json is List) {
    return json.map(toJson).toList();
  } else {
    return toJson(json);
  }
}
