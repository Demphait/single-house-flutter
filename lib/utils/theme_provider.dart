import 'package:flutter/material.dart';
import 'package:single_house/styles/app_colors.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;
  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme (bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class AppThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.background,
    primaryColor: AppColors.black,
    colorScheme: const ColorScheme.dark(),
    iconTheme: IconThemeData(color: AppColors.primary),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    primaryColor: AppColors.white,
    colorScheme: const ColorScheme.light(),
    iconTheme: IconThemeData(color: AppColors.red),
  );
}