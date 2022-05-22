import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:single_house/utils/e_core.dart';

import 'api_core.dart';
import 'api_response.dart';

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
    } on DioError catch (e) {
      return _handleDioError(e);
    } catch (e) {
      ECore.handle(code: 0, message: e.toString());
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
    } catch (e) {
      ECore.handle(code: 0, message: e.toString());
      log(e.toString());
    }
    return ApiResponse.fail(-1);
  }

  ApiResponse _handleDioError(DioError error) {
    final resp = error.response;
    if (resp == null) {
      ECore.handle(code: -1, message: error.error.toString());
      return ApiResponse.fail(-1);
    }

    if (resp.statusCode == 499) {
      List<dynamic> errorList = jsonDecode(resp.data);
      ECore.handle(code: -2, message: errorList.join('\n'));
      return ApiResponse.fail(-2);
    }
    if (resp.statusCode == 498) {
      Map<String, dynamic> map = jsonDecode(resp.data);
      ECore.handle(code: map['code'], message: '');
      return ApiResponse.fail(-3);
    }
    return ApiResponse.fail(-1);
  }
}
