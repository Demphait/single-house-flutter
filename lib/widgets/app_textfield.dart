import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/styles/app_text_styles.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    Key? key,
    required this.name,
    required this.icon,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.controller,
    this.textInputType = TextInputType.text,
    this.validator,
    this.onChanged,
  }) : super(key: key);

  final String name;
  final String icon;
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name.toUpperCase(),
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 8),
              TextFormField(
                style: Theme.of(context).textTheme.headlineMedium,
                keyboardType: widget.textInputType,
                textInputAction: widget.textInputAction,
                obscureText: widget.obscureText,
                controller: widget.controller,
                validator: (value) {
                  _errorText = widget.validator?.call(value);
                  if (_errorText != null) _isValidating = true;
                  setState(() {});
                  return _errorText;
                },
                onChanged: (value) {
                  widget.onChanged?.call(value);
                  if (_isValidating == true) {
                    _errorText = widget.validator?.call(value);
                    setState(() {});
                  }
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Theme.of(context).canvasColor,
                  isCollapsed: true,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  label: SvgPicture.asset(widget.icon, color: Theme.of(context).iconTheme.color),
                  errorStyle: const TextStyle(height: 0, fontSize: 0),
                  labelStyle: Theme.of(context).textTheme.headlineMedium,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.grey, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.grey, width: 1),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.grey, width: 1),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.grey, width: 1),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: -5,
          left: 5,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            child: Text(
              _errorText ?? '',
              style: AppTextStyles.mediumTextStyle.red,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
