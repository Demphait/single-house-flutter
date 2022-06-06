import 'package:flutter/material.dart';
import 'package:single_house/models/text_message_model.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/styles/app_text_styles.dart';

class TextMessage extends StatelessWidget {
  const TextMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  // final TextMessageModel message;
  final TextMessageModel message;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text(
            message.text,
            style: AppTextStyles.primaryTextStyle.white,
          ),
        ),
        SizedBox(width: AppSpace.smd),
      ],
    );
  }
}
