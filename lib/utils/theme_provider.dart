import 'package:flutter/material.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/utils/sp_core.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark; //TODO ДОДЕЛАТЬ
  // ThemeMode themeMode = SpCore.getDarkModeSetting() ? ThemeMode.dark : ThemeMode.light;

  // bool get isDarkMode => themeMode == ThemeMode.dark;
  // bool getTheme = SpCore.getDarkModeSetting();
  // ThemeMode themeMode = getTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class AppThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.background,
    primaryColor: AppColors.grey,
    colorScheme: const ColorScheme.dark(),
    iconTheme: IconThemeData(color: AppColors.primary),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    primaryColor: Colors.grey[500],
    colorScheme: const ColorScheme.light(),
    iconTheme: IconThemeData(color: AppColors.primary),
  );
}
