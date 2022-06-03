import 'package:flutter/material.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/styles/app_text_styles.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    Key? key,
    required this.avatar,
    required this.name,
  }) : super(key: key);
  final String avatar;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            const Image(image: AssetImage('assets/images/code.png')),
            CircleAvatar(
              foregroundImage: AssetImage(avatar),
              radius: 57.5,
            ),
          ],
        ),
        SizedBox(height: AppSpace.xlg),
        Text(
          name,
          style: AppTextStyles.secondTitle,
        ),
      ],
    );
  }
}
