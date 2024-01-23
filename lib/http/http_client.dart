import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:wan/http/response/base_response.dart';
import 'package:wan/ui/home/data/entity/banner_entity.dart';

class HttpClient {
  HttpClient._internal();

  static final HttpClient _instance = HttpClient._internal();

  static HttpClient getInstance() => _instance;

  final Dio _dio = Dio();

  Dio get dio => _dio;

  void get() async {
    var response = await dio.get("path");
    var res = response.data.toString();

    var a = BaseResponse<List<BannerEntity>>.fromJson(json.decode(res), (json) => BannerEntity.fromJson(json));
    var b = BaseResponse<BannerEntity>.fromJson(json.decode(res), (json) => BannerEntity.fromJson(json));

    BaseResponse<List<BannerEntity>>.fromJson(json.decode(res), (json) {
      (json as List<dynamic>).map((a) {
            BannerEntity.fromJson(a);
          }).toList() ?? [];
    });
  }
}
