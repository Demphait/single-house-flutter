import 'package:flutter/material.dart';
import 'package:single_house/models/dialog_model.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/styles/app_text_styles.dart';

class FileMessange extends StatelessWidget {
  const FileMessange({
    Key? key,
    required this.message,
  }) : super(key: key);
  // final DialogModel message;
   final FileMessageModel message;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
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
    );
  }
}
