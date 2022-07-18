import 'package:flutter/material.dart';

import 'package:single_house/models/dialol/image_message_model.dart';
import 'package:single_house/styles/app_space.dart';

import 'package:single_house/views/dialog/widgets/size_file_widget.dart';

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
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(message.fileName),
              SizeFile(fileSize: message.sizeFile),
            ],
          ),
        ),
      ],
    );
  }
}
