import 'package:flutter/material.dart';
import 'package:single_house/models/dialog_model.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/styles/app_text_styles.dart';
import 'package:single_house/widgets/text_message.dart';

class Message extends StatelessWidget {
  const Message({
    Key? key,
    required this.message,
  }) : super(key: key);
  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    Widget typeMessage(ChatMessage message) {
      switch (message.messageType) {
        case ChatMessageType.text:
          return TextMessage(message: message);
        case ChatMessageType.audio:
          return AudioMessage(message: message);
        // case ChatMessageType.image:

        // case ChatMessageType.file:
        default:
          return const SizedBox();
      }
    }

    return Row(
      mainAxisAlignment: message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        typeMessage(message),
      ],
    );
  }
}

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
                  '11:40',
                  style: AppTextStyles.smallTextStyle.grey,
                ),
                SizedBox(width: AppSpace.xsm),
                Icon(
                  Icons.done_all,
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
