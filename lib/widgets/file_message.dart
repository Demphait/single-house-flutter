import 'package:flutter/material.dart';
import 'package:single_house/models/dialog_model.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/styles/app_text_styles.dart';

class FileMessange extends StatelessWidget {
  const FileMessange({
    Key? key,
    required this.message,
  }) : super(key: key);
  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 230,
          padding: EdgeInsets.symmetric(horizontal: AppSpace.sm, vertical: AppSpace.sm),
          margin: EdgeInsets.only(top: AppSpace.xsm),
          decoration: BoxDecoration(
            color: message.isSender ? AppColors.mediumGrey : AppColors.darkGrey,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              const Icon(Icons.file_open_sharp),
              SizedBox(width: AppSpace.smd),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(message.fileName),
                  Text(
                    message.sizeFile.toString()+ ' MB',
                    style: AppTextStyles.mediumTextStyle.grey,
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          left: 170,
          bottom: 10,
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
    );
  }
}
