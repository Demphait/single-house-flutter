import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:single_house/api/api_response.dart';

enum ApiMethod { get, post, put, delete }

abstract class ApiCore {
  static late Dio _dio;

  static Future<void> init(String domain) async {
    _dio = Dio(BaseOptions(baseUrl: domain, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    }));
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
}

class Request {
  final Dio dio;
  final ApiMethod method;
  final String path;
  final Map<String, dynamic>? query;
  final Map<String, dynamic>? data;
  final bool jsonResp;

  Request({
    required this.dio,
    required this.method,
    required this.path,
    this.query,
    this.data,
    this.jsonResp = true,
  });

  Future<ApiResponse> work() async {
    late final Response resp;
    try {
      switch (method) {
        case ApiMethod.get:
          resp = await dio.get(path, queryParameters: query);
          break;
        case ApiMethod.post:
          resp = await dio.post(path, queryParameters: query, data: data);
          break;
        case ApiMethod.put:
          resp = await dio.put(path, queryParameters: query, data: data);
          break;
        case ApiMethod.delete:
          resp = await dio.delete(path, queryParameters: query, data: data);
          break;
      }
    } catch (e) {
      return ApiResponse.fail(-1);
    }
    try {
      if (resp.statusCode == 200) {
        if (jsonResp) {
          return ApiResponse.success(0, jsonDecode(resp.data));
        } else {
          return ApiResponse.success(0, resp.data);
        }
      } else if (resp.statusCode == 499) {
        return ApiResponse.fail(1, jsonDecode(resp.data));
      } else if (resp.statusCode == 498) {
        return ApiResponse.fail(1, jsonDecode(resp.data));
      }
      return ApiResponse.fail(resp.statusCode!, jsonDecode(resp.data));
    } catch (e) {}
    return ApiResponse.fail(-1);
  }
}
