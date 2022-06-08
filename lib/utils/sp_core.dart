import 'package:shared_preferences/shared_preferences.dart';

abstract class SpCore {
  static late final SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setAccessToken(String? accessToken) async {
    await _prefs.setString('osafkj', accessToken ?? '');
  }

  static void getAccessToken(String? accessToken) {
    _prefs.getString('osafkj');
  }

  static Future<void> setRefreshToken(String? refreshToken) async {
    await _prefs.setString('osafkj', refreshToken ?? '');
  }

  static void getRefreshToken(String? refreshToken) {
    _prefs.getString('osafkj');
  }
}
