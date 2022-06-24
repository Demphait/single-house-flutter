import 'package:flutter/material.dart';
import 'package:single_house/widgets/app_textfield.dart';

class AppPassfield extends StatefulWidget {
  const AppPassfield({
    Key? key,
    this.isHide = true,
    this.validator,
    this.textInputAction = TextInputAction.next,
    required this.controller,
    required this.name,
    required this.icon,
  }) : super(key: key);
  final bool isHide;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String name;
  final String icon;
  final TextInputAction textInputAction;

  @override
  State<AppPassfield> createState() => _AppPassfieldState();
}

class _AppPassfieldState extends State<AppPassfield> {
  bool _isHide = true;
  @override
  void initState() {
    _isHide = widget.isHide;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppTextField(
          name: widget.name.toUpperCase(),
          icon: widget.icon,
          obscureText: _isHide,
          controller: widget.controller,
          validator: widget.validator,
          textInputAction: widget.textInputAction,
        ),
        Positioned(
          right: 10,
          top: 30,
          child: IconButton(
            onPressed: () {
              setState(() {
                _isHide = !_isHide;
              });
            },
            icon: _isHide
                ? Icon(Icons.remove_red_eye_outlined, color: Theme.of(context).iconTheme.color)
                : Icon(Icons.visibility_off_outlined, color: Theme.of(context).iconTheme.color),
          ),
        ),
      ],
    );
  }
}
