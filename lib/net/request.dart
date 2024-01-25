import 'dart:convert';

import 'package:wan/net/base_response.dart';
import 'package:wan/net/http_manager.dart';
import 'package:wan/net/result.dart';
import 'package:wan/ui/home/data/entity/banner_entity.dart';

typedef FromJson = dynamic Function(Map<String, dynamic>);

Future<Result<T?>> get<T>(String path, FromJson fromJson) async {
  final response = await HttpManager.getInstance().dio.get(path);
  final data = response.data.toString();

  BaseResponse<T> baseResponse = decode<T>(data, fromJson);

  // wrap the result
  if(baseResponse.errorCode == 0) {
    return Result.success(baseResponse.data);
  } else {
    return Result.failure(Exception(''));
  }

}

BaseResponse<T> decode<T>(String data, FromJson fromJson) {
  final baseResponse = BaseResponse<T>.fromJson(
      json.decode(data), (data) => {fromJson(json.decode(data))});
  return baseResponse;
}

void test() async {
  var a = await get<BannerEntity>("", (a) {
    BannerEntity.fromJson(a);
  });

  var b = await get<List<BannerEntity>>("", (a) {
    BannerEntity.fromJson(a);
  });

  var c = Result.success("value");
  var d= c.getOrThrow();
}
