import 'package:flutter/material.dart';
import 'package:single_house/styles/app_colors.dart';

extension AppTextStyles on TextStyle {
  static TextStyle get title => const TextStyle(
    fontSize: 44,
    fontWeight: FontWeight.w400,
    fontFamily: '',
  );

  static TextStyle get secondTitle => const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    fontFamily: '',
  );

  static TextStyle get primaryTextStyle => const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: '',
  );

  static TextStyle get smallTextStyle => const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: '',
  );


  static TextStyle get mediumTextStyle => const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: '',
  );

  TextStyle get black => copyWith(color: AppColors.black);
  TextStyle get white => copyWith(color: AppColors.white);
  TextStyle get primary => copyWith(color: AppColors.primary);
  TextStyle get grey => copyWith(color: AppColors.grey);
  TextStyle get red => copyWith(color: AppColors.red);
}