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
        backgroundColor: AppColors.mediumGrey,
        selectedRowColor: AppColors.dividingLine,
        primaryColorLight: AppColors.darkGrey,
        canvasColor: AppColors.lightBlack,
        shadowColor: AppColors.lightBlack,
        textTheme: TextTheme(
          bodyLarge: AppTextStyles.smallTextStyle.grey,
          titleLarge: AppTextStyles.largeTextStyle.grey,
          displayLarge: AppTextStyles.largeTextStyle.white,
          headlineLarge: AppTextStyles.smallTextStyle.white,
          labelMedium: AppTextStyles.largeTextStyle.grey,
          headlineMedium: AppTextStyles.primaryTextStyle.white,
          labelLarge: AppTextStyles.mediumTextStyle.grey,
          titleMedium: AppTextStyles.title.white,
          titleSmall: AppTextStyles.secondTitle.white,
        ),
        primaryColor: AppColors.grey,
        colorScheme: const ColorScheme.dark(onPrimary: Colors.white),
        iconTheme: IconThemeData(color: AppColors.white),
        dividerColor: AppColors.dividingLine,
        primaryColorDark: AppColors.grey,
        hintColor: AppColors.darkBlack,
      );

  static ThemeData get lightTheme => ThemeData(
        scaffoldBackgroundColor: AppColors.white,
        backgroundColor: AppColors.dividerColorLight,
        selectedRowColor: AppColors.white,
        primaryColorLight: AppColors.secondGrey,
        canvasColor: AppColors.white,
        shadowColor: AppColors.grey,
        textTheme: TextTheme(
          bodyLarge: AppTextStyles.smallTextStyle.grey,
          titleLarge: AppTextStyles.largeTextStyle.mediumGrey,
          displayLarge: AppTextStyles.largeTextStyle.mediumGrey,
          headlineLarge: AppTextStyles.smallTextStyle.grey,
          labelMedium: AppTextStyles.largeTextStyle.grey,
          headlineMedium: AppTextStyles.primaryTextStyle.mediumGrey,
          labelLarge: AppTextStyles.mediumTextStyle.grey,
          titleMedium: AppTextStyles.title.mediumGrey,
          titleSmall: AppTextStyles.secondTitle.mediumGrey,
        ),
        primaryColor: AppColors.lightGrey,
        colorScheme: const ColorScheme.light(),
        iconTheme: IconThemeData(color: AppColors.mediumGrey),
        dividerColor: AppColors.dividerColorLight,
        primaryColorDark: AppColors.mediumGrey,
        hintColor: AppColors.white,
      );
}
