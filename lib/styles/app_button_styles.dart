import 'package:flutter/material.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/styles/app_text_styles.dart';

extension AppButtonStyles on ButtonStyle {
  static ButtonStyle get primaryButton => ButtonStyle(
        textStyle: MaterialStateProperty.all<TextStyle>(AppTextStyles.styleTextField.white),
        minimumSize: MaterialStateProperty.all<Size>(const Size(360, 45)),
        backgroundColor: MaterialStateProperty.all<Color>(AppColors.primary),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      );
}
