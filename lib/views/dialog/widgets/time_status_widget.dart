import 'package:flutter/material.dart';
import 'package:single_house/models/dialog_model.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/styles/app_text_styles.dart';

class TimeStatusWidget extends StatelessWidget {
  const TimeStatusWidget({
    Key? key,
    required this.time,
    required this.status,
  }) : super(key: key);
  final String time;
  final MessageStatus status;
  

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          time,
          style: AppTextStyles.smallTextStyle.grey,
        ),
        SizedBox(width: AppSpace.xsm),
        Icon(
          status == MessageStatus.notSent
              ? Icons.cancel
              : status == MessageStatus.viewed
                  ? Icons.done_all
                  : Icons.check,
          size: 13,
          color: AppColors.grey,
        ),
      ],
    );
  }
}
