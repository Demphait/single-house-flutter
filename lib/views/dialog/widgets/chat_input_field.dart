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
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSpace.md, vertical: 15),
      decoration: BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
      child: Row(
        children: [
          ImageIcon(
            const AssetImage('assets/images/attach_icon.png'),
            size: 24,
            color: AppColors.primary,
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: AppSpace.smd),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).backgroundColor,
                ),
                color: Theme.of(context).hintColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: AppSpace.sm),
                child: Scrollbar(
                  child: TextField(
                    controller: _textEditingController,
                    minLines: 1,
                    maxLines: 5,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    style: Theme.of(context).textTheme.headlineMedium,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0),
                      isDense: true,
                      hintText: 'Message',
                      hintStyle: AppTextStyles.primaryTextStyle.grey,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          ImageIcon(
            const AssetImage('assets/images/mic.png'),
            size: 24,
            color: AppColors.primary,
          ),
        ],
      ),
    );
  }
}
