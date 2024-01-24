import 'package:wan/net/http_manager.dart';

Future<T> get<T>() async {
  final response = await HttpManager.getInstance().dio.get('');
  final data = response.data.toString();

  return data as T;
}
