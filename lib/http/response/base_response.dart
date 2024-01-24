class BaseResponse<T> {
  final T? data;
  final int errorCode;
  final String errorMessage;

  BaseResponse(
      {required this.data,
      required this.errorCode,
      required this.errorMessage});

  factory BaseResponse.fromJson(Map<String, dynamic> json,
          dynamic Function(dynamic json) fromJsonT) =>
      _$BaseResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(dynamic Function(dynamic value) toJsonT) =>
      _$BaseResponseToJson(this, toJsonT);
}

BaseResponse<T> _$BaseResponseFromJson<T>(
  Map<String, dynamic> json,
  dynamic Function(Object? json) fromJsonT,
) =>
    BaseResponse<T>(
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      errorCode: json['errorCode'] as int,
      errorMessage: json['errorMessage'] as String,
    );

Map<String, dynamic> _$BaseResponseToJson(
  BaseResponse<dynamic> instance,
  dynamic Function(dynamic value) toJsonT,
) =>
    <String, dynamic>{
      'data': _$nullableGenericToJson(instance.data, toJsonT),
      'errorCode': instance.errorCode,
      'errorMessage': instance.errorMessage,
    };

dynamic _$nullableGenericFromJson<T>(
  Object? input,
  dynamic Function(Object? json) fromJson,
) {
  if (input == null) {
    return null;
  }
  if (input is List) {
    return input.map(fromJson).toList();
  } else {
    return fromJson(input);
  }
}

dynamic _$nullableGenericToJson(
  dynamic input,
  dynamic Function(dynamic value) toJson,
) {
  if (input == null) {
    return null;
  }

  if (input is List) {
    return input.map(toJson).toList();
  } else {
    return toJson(input);
  }
}
