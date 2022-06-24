import 'package:flutter/material.dart';
import 'package:single_house/models/dialol/text_message_model.dart';
import 'package:single_house/styles/app_space.dart';

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
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        SizedBox(width: AppSpace.smd),
      ],
    );
  }
}
