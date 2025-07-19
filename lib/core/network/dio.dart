import 'package:dio/dio.dart';
import 'package:raise_right_taske/core/network/check_network.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../constantd.dart';

class DioHelper {
  static late Dio dio;
  static late NetworkInfo networkInfo;
  static init() async {
    dio = Dio(
      BaseOptions(
        baseUrl: Constant.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 10),
        sendTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );
    networkInfo = NetworkInfoImpl(Connectivity());
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
