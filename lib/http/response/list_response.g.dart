// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListResponse<T> _$ListResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ListResponse<T>(
      data: (json['data'] as List<dynamic>).map(fromJsonT).toList(),
      errorCode: json['errorCode'] as int,
      errorMsg: json['errorMsg'] as String,
    );

Map<String, dynamic> _$ListResponseToJson<T>(
  ListResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': instance.data.map(toJsonT).toList(),
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };
