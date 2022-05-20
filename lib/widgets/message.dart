import 'package:flutter/material.dart';
import 'package:single_house/models/dialog_model.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/styles/app_text_styles.dart';
import 'package:single_house/widgets/audio_message.dart';
import 'package:single_house/widgets/file_message.dart';
import 'package:single_house/widgets/image_message.dart';
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
        case ChatMessageType.image:
          return ImageMessange(message: message);
        case ChatMessageType.file:
          return FileMessange(message: message);
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
