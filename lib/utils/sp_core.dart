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

  static Future<void> setDarkModeSetting(bool? darkModeSetting) async {
    await _prefs.setBool('darkModeKey', darkModeSetting ?? true);
  }

  static bool getDarkModeSetting() {
    return _prefs.getBool('darkModeKey') ?? true;
  }

  static Future<void> setFolderSetting(bool? folderSetting) async {
    await _prefs.setBool('folderKey', folderSetting ?? true);
  }

  static bool getFolderSetting() {
    return _prefs.getBool('folderKey') ?? true;
  }
}
