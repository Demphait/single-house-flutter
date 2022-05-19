import 'package:flutter/material.dart';
import 'package:single_house/models/dialog_model.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/styles/app_text_styles.dart';

class TextMessage extends StatelessWidget {
  const TextMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSpace.smd, vertical: AppSpace.sm),
      margin: EdgeInsets.only(top: AppSpace.xsm),
      decoration: BoxDecoration(
        color: message.isSender ? AppColors.mediumGrey : AppColors.darkGrey,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Text(message.text),
          const SizedBox(width: 10),
          Padding(
            padding: EdgeInsets.only(top: AppSpace.sm),
            child: Row(
              children: [
                Text(
                  '11:40',
                  style: AppTextStyles.smallTextStyle.grey,
                ),
                SizedBox(width: AppSpace.xsm),
                Icon(
                  Icons.check,
                  size: 13,
                  color: AppColors.grey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
