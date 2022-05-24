import 'package:flutter/material.dart';
import 'package:single_house/models/dialog_model.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/styles/app_text_styles.dart';
import 'package:single_house/views/dialog/widgets/audio_message.dart';
import 'package:single_house/views/dialog/widgets/file_message.dart';
import 'package:single_house/views/dialog/widgets/image_message.dart';
import 'package:single_house/views/dialog/widgets/text_message.dart';
import 'package:single_house/views/dialog/widgets/time_status_widget.dart';

class Message extends StatelessWidget {
  const Message({
    Key? key,
    required this.message,
  }) : super(key: key);
  final DialogModel message; // даункаст

  Widget typeMessage(DialogModel message) {
    switch (message.runtimeType) {
      case TextMessageModel:
        return TextMessage(message: message as TextMessageModel);
      case VoiceMessageModel:
        return AudioMessage(message: message as VoiceMessageModel);
      case ImageMessageModel:
        return ImageMessange(message: message as ImageMessageModel);
      case FileMessageModel:
        return FileMessange(message: message as FileMessageModel);
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: AppSpace.sm, vertical: AppSpace.sm),
        margin: EdgeInsets.only(top: AppSpace.xsm),
        decoration: BoxDecoration(
          color: message.isSender ? AppColors.mediumGrey : AppColors.darkGrey,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          //mainAxisAlignment: message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Flexible(child: typeMessage(message)),
            SizedBox(width: AppSpace.sm),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (message is VoiceMessageModel)
                  Padding(
                    padding: EdgeInsets.only(bottom: AppSpace.sm),
                    child: Text(
                      '00:05',
                      style: AppTextStyles.smallTextStyle.grey,
                    ),
                  ),
                TimeStatusWidget(time: message.time, status: message.messageStatus),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
