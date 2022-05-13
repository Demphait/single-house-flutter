import 'package:flutter/material.dart';
import 'package:single_house/styles/app_button_styles.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/styles/app_text_styles.dart';
import 'package:single_house/utils/validation/validate.dart';
import 'package:single_house/utils/validation/validate_confirm_pass.dart';
import 'package:single_house/utils/validation/validate_email.dart';
import 'package:single_house/widgets/app_textfield.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({
    Key? key,
    required this.formKey,
    required this.passController,
  }) : super(key: key);
  final TextEditingController passController;
  final GlobalKey<FormState> formKey;

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String cofirmPassword = '';
  String invite = '';
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cofirmPasswordController = TextEditingController();
  final TextEditingController _inviteController = TextEditingController();

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
              onPressed: () {
                formKey.currentState?.validate();
                widget.formKey.currentState?.validate();
              },
              child: const Text('Register'),
              style: AppButtonStyles.primaryButton,
            ),
          ],
        ),
        Padding(
          // 66 - offset for move center, cause of invite
          padding: EdgeInsets.fromLTRB(AppSpace.md, 76, AppSpace.md, 0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppTextField(
                  name: 'Email',
                  textInputType: TextInputType.emailAddress,
                  controller: _emailController,
                  validator: ValidateEmail(isRequired: true).validation,
                  onChanged: (value) => setState(() {
                    email = value;
                  }),
                ),
                AppSpaceBox.md,
                const Opacity(
                  opacity: 0,
                  child: AppTextField(name: '1'),
                ),
                AppSpaceBox.md,
                const Opacity(
                  opacity: 0,
                  child: AppTextField(name: '1'),
                ),
                AppSpaceBox.md,
                AppTextField(
                  name: 'Confirm Password',
                  obscureText: true,
                  controller: _cofirmPasswordController,
                  validator: ValidateConfirmPass(isRequired: true, passwordController: widget.passController).validation,
                ),
                AppSpaceBox.md,
                AppTextField(
                  name: 'Invite',
                  obscureText: false,
                  textInputAction: TextInputAction.done,
                  controller: _inviteController,
                  validator: Validate(isRequired: true).validation,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
