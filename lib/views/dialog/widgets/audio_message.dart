import 'dart:math';

import 'package:flutter/material.dart';
import 'package:single_house/models/dialog_model.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/styles/app_space.dart';

class AudioMessage extends StatelessWidget {
  AudioMessage({
    //TODO Когда файлі будут вернуть const
    Key? key,
    required this.message,
  }) : super(key: key);
  final VoiceMessageModel message;

  final Random random = Random();
  List<int> get biteArray => List.generate(random.nextInt(50) + 10, (index) => random.nextInt(255));

  @override
  Widget build(BuildContext context) {
    final array = biteArray;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.play_circle,
          size: 36,
        ),
        SizedBox(width: AppSpace.sm),
        for (var i = 0; i < min(array.length, 30); i++) _buildPoint(array[i]),
      ],
    );
  }

  Widget _buildPoint(int i) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: AppColors.white),
      width: 2,
      height: max(2, i / 255 * 20),
      margin: const EdgeInsets.only(right: 2),
    );
  }
}
