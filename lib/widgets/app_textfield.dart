import 'package:flutter/material.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/styles/app_text_styles.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    Key? key,
    required this.name,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.controller,
    this.textInputType = TextInputType.text,
    this.validator,
    this.onChanged,
  }) : super(key: key);

  final String name;
  final bool obscureText;
  final TextInputAction textInputAction;
  final TextEditingController? controller;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  @override
  State<AppTextField> createState() => _AppTextFieldState();

  static bool isPresed = false;
}

class _AppTextFieldState extends State<AppTextField> {
  String? _errorText;
  bool _isValidating = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: AppSpace.sm),
          child: TextFormField(
            style: AppTextStyles.styleTextField.white,
            keyboardType: widget.textInputType,
            textInputAction: widget.textInputAction,
            obscureText: widget.obscureText,
            controller: widget.controller,
            // validator: widget.validator,
            validator: (value) {
              _errorText = widget.validator?.call(value);
              if (_errorText != null) _isValidating = true;
              setState(() {});
              return _errorText;
            },
            // onChanged: widget.onChanged,
            onChanged: (value) {
              widget.onChanged?.call(value);
              if (_isValidating == true) {
                _errorText = widget.validator?.call(value);
                setState(() {});
              }
            },
            decoration: InputDecoration(
              errorStyle: const TextStyle(height: 0, fontSize: 0),
              labelText: widget.name,
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
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primary, width: 2),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primary, width: 2),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 13),
            ),
          ),
        ),
        Positioned(
          bottom: -9,
          left: 16,
          child: SizedBox(
            width: MediaQuery.of(context).size.width*0.85,
            child: Text(
              _errorText ?? '',
              style: AppTextStyles.styleTextError.red,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}

// делаем ветку валидатион
// AppTextField комитим
