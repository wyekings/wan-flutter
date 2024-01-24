import 'package:dio/dio.dart';

class HttpClient {
  HttpClient._internal();

  static final HttpClient _instance = HttpClient._internal();

  static HttpClient getInstance() => _instance;

  final Dio _dio = Dio();

  Dio get dio => _dio;
}
