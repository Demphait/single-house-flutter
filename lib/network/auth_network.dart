import 'dart:developer';

import 'package:single_house/api/api_core.dart';
import 'package:single_house/api/api_response.dart';
import 'package:single_house/models/network/auth_response_model.dart';

class AuthNetwork {
  static Future<ApiResponse<AuthResponseModel?>> register({
    required String login,
    required String password,
    required String email,
    required String invite,
  }) async {
    ApiResponse resp = await ApiCore.post(
      '/register',
      data: {
        'login': login,
        'password': password,
        'email': email,
        'invite': invite,
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
