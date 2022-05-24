import 'package:flutter/material.dart';
import 'package:single_house/models/dialog_model.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/styles/app_text_styles.dart';

class ImageMessange extends StatelessWidget {
  const ImageMessange({
    Key? key,
    required this.message,
  }) : super(key: key);
  // final ImageMessageModel message;
  final ImageMessageModel message;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image(
          image: AssetImage(message.sourceFile),
        ),
        SizedBox(width: AppSpace.smd),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(message.fileName),
            Text(
              message.sizeFile.toString() + ' MB', 
              style: AppTextStyles.mediumTextStyle.grey,
            ),
          ],
        ),
      ],
    );
  }
}
