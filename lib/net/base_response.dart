import 'dart:convert';

class BaseResponse<T> {
  final T? data;
  final int errorCode;
  final String errorMessage;

  BaseResponse(
      {required this.data,
      required this.errorCode,
      required this.errorMessage});

  factory BaseResponse.fromJson(
          Map<String, dynamic> json, dynamic Function(dynamic json) fromJsonT) =>
      _$BaseResponseFromJson<T>(json, fromJsonT);

  Map<String, dynamic> toJson(dynamic Function(dynamic value) toJsonT) =>
      _$BaseResponseToJson<T>(this, toJsonT);
}

BaseResponse<T> _$BaseResponseFromJson<T>(
  Map<String, dynamic> json,
  dynamic Function(dynamic json) fromJsonT,
) =>
    BaseResponse<T>(
      data: _fromJson(json['data'], fromJsonT),
      errorCode: json['errorCode'] as int,
      errorMessage: json['errorMessage'] as String,
    );

Map<String, dynamic> _$BaseResponseToJson<T>(
  BaseResponse<T> response,
  dynamic Function(dynamic value) toJsonT,
) =>
    <String, dynamic>{
      'data': _toJson(response.data, toJsonT),
      'errorCode': response.errorCode,
      'errorMessage': response.errorMessage,
    };

dynamic _fromJson(
  dynamic json,
  dynamic Function(dynamic json) fromJson,
) {
  if (json == null) {
    return null;
  }
  if (json is List) {
    return json.map(fromJson).toList();
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
