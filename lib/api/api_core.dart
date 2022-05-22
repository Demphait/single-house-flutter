import 'package:dio/dio.dart';
import 'package:single_house/api/api_response.dart';

import 'request.dart';

enum ApiMethod { get, post, put, delete }

abstract class ApiCore {
  static late Dio _dio;

  static Future<void> init(String domain) async {
    _dio = Dio(BaseOptions(baseUrl: domain, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    }));
  }

  static void setTokens(String? accessToken, String? refreshToken) {
    _dio.options.headers.addAll({
      'accessToken': 'Beerer $accessToken',
    });
  }

  static Future<ApiResponse> get(
    String path, {
    Map<String, dynamic>? query,
    bool jsonResponse = true,
  }) async =>
      Request(
        dio: _dio,
        method: ApiMethod.get,
        path: path,
        query: query,
        jsonResp: jsonResponse,
      ).work();

  static Future<ApiResponse> post(
    String path, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    bool jsonResponse = true,
  }) async =>
      Request(
        dio: _dio,
        method: ApiMethod.post,
        path: path,
        query: query,
        data: data,
        jsonResp: jsonResponse,
      ).work();
}

