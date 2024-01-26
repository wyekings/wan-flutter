

class BaseResponse<T,M> {
  final T? data;
  final int errorCode;
  final String? errorMsg;

  BaseResponse(
      {required this.data,
      required this.errorCode,
      required this.errorMsg});

  factory BaseResponse.fromJson(
          Map<String, dynamic> json, M Function(dynamic json) fromJsonT) =>
      _$BaseResponseFromJson<T,M>(json, fromJsonT);

  Map<String, dynamic> toJson(dynamic Function(dynamic value) toJsonT) =>
      _$BaseResponseToJson<T,M>(this, toJsonT);
}

BaseResponse<T,M> _$BaseResponseFromJson<T,M>(
  Map<String, dynamic> json,
  M Function(dynamic json) fromJsonT,
) =>
    BaseResponse<T,M>(
      data: _fromJson<T,M>(json['data'], fromJsonT),
      errorCode: json['errorCode'] as int,
      errorMsg: json['errorMsg'] as String,
    );

Map<String, dynamic> _$BaseResponseToJson<T,M>(
  BaseResponse<T,M> response,
  dynamic Function(dynamic value) toJsonT,
) =>
    <String, dynamic>{
      'data': _toJson(response.data, toJsonT),
      'errorCode': response.errorCode,
      'errorMsg': response.errorMsg,
    };

dynamic _fromJson<T,M>(
  dynamic json,
  M Function(dynamic json) fromJson,
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
