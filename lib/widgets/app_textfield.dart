import 'package:flutter/material.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/styles/app_text_styles.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    required this.name,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.controller,
    this.textInputType = TextInputType.text,
  }) : super(key: key);

  final String name;
  final bool obscureText;
  final TextInputAction textInputAction;
  final TextEditingController? controller;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSpace.sm),
      child: TextField(
        style: AppTextStyles.styleTextField.white,
        keyboardType: textInputType,
        textInputAction: textInputAction,
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          labelText: name,
          labelStyle: AppTextStyles.styleTextField.white,
          //isCollapsed: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary, width: 2),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary, width: 2),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 13),
        ),
      ),
    );
  }
}
