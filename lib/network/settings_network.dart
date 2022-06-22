import 'dart:developer';

import 'package:single_house/api/api_core.dart';
import 'package:single_house/api/api_response.dart';
import 'package:single_house/models/network/auth_response_model.dart';

class SettingsNetwork {
  static Future<ApiResponse<AuthResponseModel?>> changeLogin({
    required String login,
  }) async {
    ApiResponse resp = await ApiCore.post(
      '/user/change/login',
      data: {
        'login': login,
      },
    );
    if (resp.success) {
      try {
        return resp.setData<AuthResponseModel>(AuthResponseModel.fromMap(resp.data));
      } catch (e) {
        log(e.toString());
      }
    }
    return resp.setData<AuthResponseModel?>(null);
  }

  static Future<ApiResponse<AuthResponseModel?>> changePassword({
    required String prevPassword,
    required String password,
  }) async {
    ApiResponse resp = await ApiCore.post(
      '/user/change/password',
      data: {
        'prevPassword': prevPassword,
        'password': password,
      },
    );
    if (resp.success) {
      try {
        return resp.setData<AuthResponseModel>(AuthResponseModel.fromMap(resp.data));
      } catch (e) {
        log(e.toString());
      }
    }
    return resp.setData<AuthResponseModel?>(null);
  }

  static Future<ApiResponse<AuthResponseModel?>> changeEmail({
    required String email,
  }) async {
    ApiResponse resp = await ApiCore.post(
      '/user/change/email',
      data: {
        'email': email,
      },
    );
    if (resp.success) {
      try {
        return resp.setData<AuthResponseModel>(AuthResponseModel.fromMap(resp.data));
      } catch (e) {
        log(e.toString());
      }
    }
    return resp.setData<AuthResponseModel?>(null);
  }
}
