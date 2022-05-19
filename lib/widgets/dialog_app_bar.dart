import 'package:flutter/material.dart';
import 'package:single_house/app/router/router_core.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/styles/app_text_styles.dart';

class DialogAppBar extends StatelessWidget {
  const DialogAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.background,
      centerTitle: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 20,
            ),
            onPressed: () => RouterCore.pop(),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Ricardo Millos',
                style: AppTextStyles.secondTitle.white,
              ),
            ),
          ),
        ],
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 16),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/avatar.png'),
          ),
          // child: Image(
          //   image: AssetImage('assets/images/avatar.png'),
          //   width: 40,
          //   height: 40,
          // ),
        ),
      ],
    );
  }
}
