import 'package:flutter/material.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/styles/app_text_styles.dart';
import 'package:single_house/utils/sp_core.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode get themeMode => SpCore.getDarkModeSetting() ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme(bool isDarkMode) async {
    await SpCore.setDarkModeSetting(isDarkMode);
    //AppColors.getTheme = isDarkMode ? AppColorsDark() : AppColorsLight();
    notifyListeners();
  }
}

class AppThemes {
  static ThemeData get darkTheme => ThemeData(
    scaffoldBackgroundColor: AppColors.background,
    textTheme: TextTheme(bodyLarge: AppTextStyles.smallTextStyle.primary),
    primaryColor: AppColors.grey,
    colorScheme: const ColorScheme.dark(),
    iconTheme: IconThemeData(color: AppColors.primary),
    dividerColor: AppColors.dividingLine,
  );

  static ThemeData get lightTheme => ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    textTheme: TextTheme(bodyLarge: AppTextStyles.smallTextStyle.grey),
    primaryColor: Colors.grey[500],
    colorScheme: const ColorScheme.light(),
    iconTheme: IconThemeData(color: AppColors.primary),
    dividerColor: Colors.grey[300],
  );
}
