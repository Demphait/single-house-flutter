import 'package:shared_preferences/shared_preferences.dart';

abstract class SpCore {
  static late final SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setAccessToken(String? accessToken) async {
    await _prefs.setString('accessTokenKey', accessToken ?? '');
  }

  static String getAccessToken() {
    return _prefs.getString('accessTokenKey') ?? '';
  }

  static Future<void> setRefreshToken(String? refreshToken) async {
    await _prefs.setString('refreshTokenKey', refreshToken ?? '');
  }

  static String getRefreshToken() {
    return _prefs.getString('refreshTokenKey') ?? '';
  }
}
