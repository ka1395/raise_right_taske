import 'package:dio/dio.dart';

import '../constantd.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> get({
    required String url,
    Map<String, dynamic>? query,
 
    String? token,
  }) async {
    dio.options.headers = {
      "Content-Type": "application/json",
      "Authorization": token,
    };
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> post({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      "Content-Type": "application/json",
      "Authorization": token,
    };
    return await dio.post(url, data: data, queryParameters: query);
  }
  
  static Future<Response> put({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      "Content-Type": "application/json",
      "Authorization": token,
    };
    return await dio.put(url, data: data, queryParameters: query);
  }
}