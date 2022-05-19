import 'package:flutter/material.dart';
import 'package:single_house/app/router/router_core.dart';
import 'package:single_house/models/chat_model.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/styles/app_text_styles.dart';
import 'package:single_house/views/dialog/dialog_view.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({Key? key, required this.chat}) : super(key: key);

  final ChatModel chat;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpace.smd),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: AppSpace.smd),
                child: Image(
                  width: 50,
                  height: 50,
                  image: AssetImage(chat.img),
                ),
              ),
              AppSpaceBox.smd,
              Expanded(
                child: Container(
                  height: AppSpace.smd * 2 + 50,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: AppColors.dividingLine,
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              chat.name,
                              style: AppTextStyles.primaryTextStyle.white,
                            ),
                          ),
                          Text(
                            chat.time,
                            style: AppTextStyles.smallTextStyle.grey,
                          ),
                        ],
                      ),
                      SizedBox(height: AppSpace.xsm),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              chat.dialog,
                              style: AppTextStyles.primaryTextStyle.grey,
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
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => RouterCore.push(DialogView.name),
            ),
          ),
        ),
      ],
    );
  }
}
