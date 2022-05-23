import 'package:flutter/material.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/styles/app_text_styles.dart';

class ChatInputField extends StatefulWidget {
  const ChatInputField({
    Key? key,
  }) : super(key: key);

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  bool _isVisible = true;

  final TextEditingController _textEditingController = TextEditingController();

  String? _textControllerMethod(String text) {
    text = _textEditingController.text;
    if (text.isNotEmpty) {
      setState(() {
        _isVisible = false;
      });
      return text;
    }
    if (text.isEmpty) {
      setState(() {
        _isVisible = true;
      });
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSpace.md, vertical: 15),
      decoration: BoxDecoration(color: AppColors.background),
      child: Row(
        children: [
          ImageIcon(
            const AssetImage('assets/icons/attach_icon.png'),
            size: 24,
            color: AppColors.primary,
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: AppSpace.smd),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.lightGrey,
                ),
                color: AppColors.darkBlack,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: AppSpace.sm),
                      child: Scrollbar(
                        child: TextField(
                          controller: _textEditingController,
                          onChanged: _textControllerMethod,
                          minLines: 1,
                          maxLines: 5,
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.newline,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(bottom: AppSpace.sm),
                            isDense: true,
                            hintText: 'Message',
                            hintStyle: AppTextStyles.primaryTextStyle.grey,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: _isVisible,
                    child: ImageIcon(
                      const AssetImage('assets/icons/sticker.png'),
                      size: 24,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          ImageIcon(
            const AssetImage('assets/icons/mic.png'),
            size: 24,
            color: AppColors.primary,
          ),
        ],
      ),
    );
  }
}
