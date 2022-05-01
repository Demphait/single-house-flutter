import 'package:flutter/material.dart';
import 'package:single_house/models/chat_model.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/styles/app_text_styles.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({
    Key? key,
    required this.chat
  }) : super(key: key);

    final ChatModel chat;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: AppSpace.smd),
              child: Image(image: AssetImage(chat.img), height: 50, width: 50),
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
                        Expanded(child: Text(chat.name, style: AppTextStyles.styleTextField.white)),
                        Text(chat.time, style: AppTextStyles.styleTextTime.search),
                      ],
                    ),
                    SizedBox(height: AppSpace.xsm),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            chat.dialog,
                            style: AppTextStyles.styleTextField.search,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 0.5, horizontal: 4),
                          child: Text(chat.counterMessage),
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
