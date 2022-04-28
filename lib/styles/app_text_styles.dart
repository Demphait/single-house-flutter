import 'package:flutter/material.dart';
import 'package:single_house/styles/app_colors.dart';

extension AppTextStyles on TextStyle {
  static TextStyle get title => const TextStyle(
    fontSize: 44,
    fontWeight: FontWeight.w400,
    fontFamily: '',
  );

  static TextStyle get styleTextField => const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    fontFamily: '',
  );

  static TextStyle get styleTextTime => const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: '',
  );

  static TextStyle get styleSearchField => const TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w400,
    fontFamily: '',
  );

  TextStyle get black => copyWith(color: AppColors.black);
  TextStyle get white => copyWith(color: AppColors.white);
  TextStyle get primary => copyWith(color: AppColors.primary);
  TextStyle get search => copyWith(color: AppColors.search);
}