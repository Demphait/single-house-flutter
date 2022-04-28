import 'package:flutter/material.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/styles/app_text_styles.dart';
import 'package:single_house/widgets/app_textfield.dart';

class RegisterWidget extends StatelessWidget {
  const RegisterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            const SizedBox(height: 93),
            Text(
              'Register',
              style: AppTextStyles.title.white,
            ),
            Expanded(
              child: Container(),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Register'),
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
        Padding(
          // 66 - offset for move center, cause of invite
          padding: EdgeInsets.fromLTRB(AppSpace.md, 66, AppSpace.md, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              AppTextField(name: 'Phone', textInputType: TextInputType.phone),
              Opacity(
                opacity: 0,
                child: AppTextField(name: '1'),
              ),
              Opacity(
                opacity: 0,
                child: AppTextField(name: '1'),
              ),
              AppTextField(name: 'Confirm Password', obscureText: true),
              AppTextField(
                  name: 'Invite',
                  obscureText: false,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.number),
            ],
          ),
        )
      ],
    );
  }
}
