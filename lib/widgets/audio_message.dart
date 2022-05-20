import 'package:flutter/material.dart';
import 'package:single_house/models/dialog_model.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/styles/app_text_styles.dart';

class AudioMessage extends StatelessWidget {
  const AudioMessage({
    Key? key,
    required this.message,
  }) : super(key: key);
  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: EdgeInsets.symmetric(horizontal: AppSpace.smd, vertical: AppSpace.sm),
      margin: EdgeInsets.only(top: AppSpace.xsm),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: message.isSender ? AppColors.mediumGrey : AppColors.darkGrey,
      ),
      child: Row(
        children: [
          const Icon(
            Icons.play_circle,
            size: 36,
          ),
          SizedBox(width: AppSpace.sm),
          Expanded(
            child: Container(
              width: double.infinity,
              height: 2,
              color: AppColors.white,
            ),
          ),
          SizedBox(width: AppSpace.sm),
          Padding(
            padding: EdgeInsets.only(top: AppSpace.md),
            child: Row(
              children: [
                Text(
                  message.time,
                  style: AppTextStyles.smallTextStyle.grey,
                ),
                SizedBox(width: AppSpace.xsm),
                Icon(
                  message.messageStatus == MessageStatus.notSent
                      ? Icons.cancel
                      : message.messageStatus == MessageStatus.viewed
                          ? Icons.done_all
                          : Icons.check,
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
