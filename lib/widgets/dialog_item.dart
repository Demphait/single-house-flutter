import 'package:flutter/material.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/styles/app_text_styles.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: AppSpace.smd),
              child: const Image(image: AssetImage('assets/images/avatar.png'), height: 50, width: 50),
            ),
            AppSpaceBox.smd,
            Expanded(
              child: Container(
                height: AppSpace.smd * 2 + 50,
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(width: 1, color: AppColors.dividingLine)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(child: Text('Ricardo Milos', style: AppTextStyles.styleTextField.white)),
                        Text('11:47', style: AppTextStyles.styleTextTime.search),
                      ],
                    ),
                    SizedBox(height: AppSpace.xsm),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Do you wanna play with me?',
                            style: AppTextStyles.styleTextField.search,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 0.5, horizontal: 4),
                          child: const Text('1'),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: AppColors.primary,
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(onTap: () {}),
          ),
        ),
      ],
    );
  }
}
