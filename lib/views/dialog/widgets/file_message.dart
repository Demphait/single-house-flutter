import 'package:flutter/material.dart';
import 'package:single_house/models/file_message_model.dart';
import 'package:single_house/styles/app_space.dart';

import 'package:single_house/views/dialog/widgets/size_file_widget.dart';

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
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message.fileName,
              ),
              SizeFile(fileSize: message.sizeFile),
            ],
          ),
        ),
      ],
    );
  }
}
