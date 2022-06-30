import 'package:single_house/api/api_core.dart';
import 'package:single_house/api/api_response.dart';

class UserNetwork {
  static Future<bool> logout() async {
    ApiResponse resp = await ApiCore.get(
      '/user/logout',
    );
    return resp.success;
  }

  static Future<bool> userCheck() async {
    ApiResponse resp = await ApiCore.get(
      '/user/user-check',
    );
    return resp.success;
  }
}
