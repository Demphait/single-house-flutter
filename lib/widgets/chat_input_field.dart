import 'package:flutter/material.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/styles/app_text_styles.dart';

class ChatInputField extends StatelessWidget {
  const ChatInputField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSpace.md, vertical: 15),
      decoration: BoxDecoration(color: AppColors.background),
      child: SafeArea(
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
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        maxLines: 1,
                        textInputAction: TextInputAction.newline,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: AppSpace.sm),
                          isDense: true,
                          hintText: 'Message',
                          hintStyle: AppTextStyles.primaryTextStyle.grey,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    ImageIcon(
                      const AssetImage('assets/icons/sticker.png'),
                      size: 24,
                      color: AppColors.primary,
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
      ),
    );
  }
}
