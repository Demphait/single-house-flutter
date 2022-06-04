import 'package:flutter/material.dart';

import 'package:single_house/styles/app_text_styles.dart';

class SizeFile extends StatelessWidget {
  const SizeFile({
    Key? key,
    required this.fileSize,
  }) : super(key: key);

  final double fileSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      fileSize.toStringAsFixed(2) + ' MB',
      style: AppTextStyles.mediumTextStyle.grey,
    );
  }
}
