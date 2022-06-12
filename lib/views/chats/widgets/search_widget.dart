import 'package:flutter/material.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/styles/app_text_styles.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
    required FocusNode focusNode,
    required TextEditingController controller,
  })  : _focusNode = focusNode,
        _controller = controller,
        super(key: key);

  final FocusNode _focusNode;
  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppTextStyles.largeTextStyle.grey,
      textAlign: TextAlign.left,
      focusNode: _focusNode,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      obscureText: false,
      controller: _controller,
      decoration: InputDecoration(
        prefixIcon: !_focusNode.hasFocus && _controller.text.isEmpty
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search, color: AppColors.grey),
                  const SizedBox(width: 5),
                  Text(
                    'Search for messages or users',
                    style: AppTextStyles.largeTextStyle.grey,
                  ),
                ],
              )
            : Icon(Icons.search, color: AppColors.grey),
        hintText: 'Search for messages or users',
        hintStyle: AppTextStyles.largeTextStyle.grey,
        filled: true,
        fillColor: Colors.black.withAlpha(45),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      ),
    );
  }
}
