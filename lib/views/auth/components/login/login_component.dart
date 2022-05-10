import 'package:flutter/material.dart';
import 'package:single_house/app/router/index.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/styles/app_text_styles.dart';
import 'package:single_house/utils/translate.dart';
import 'package:single_house/views/chats/chats_view.dart';





void _login() {
  RouterCore.push(ChatsView.name);
}
class LoginWidget extends StatelessWidget {
  const LoginWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpace.md),
      child: Column(
        children: [
          const SizedBox(height: 93),
          Text(
            'Login'.t,
            style: AppTextStyles.title.white,
          ),
          Expanded(child: Container()),
          ElevatedButton(
            onPressed: _login,
            child: const Text('Login'),
            style: ButtonStyle(
              textStyle: MaterialStateProperty.all<TextStyle>(AppTextStyles.styleTextField.white),
              minimumSize: MaterialStateProperty.all<Size>(const Size(360, 45)),
              backgroundColor: MaterialStateProperty.all<Color>(AppColors.primary),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}