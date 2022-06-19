import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:single_house/styles/app_button_styles.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/utils/validation/validate.dart';
import 'package:single_house/utils/validation/validate_confirm_pass.dart';
import 'package:single_house/utils/validation/validate_email.dart';
import 'package:single_house/views/auth/components/register/cubit/register_cubit.dart';
import 'package:single_house/widgets/app_loader.dart';
import 'package:single_house/widgets/app_textfield.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({
    Key? key,
    required this.formKey,
    required this.passController,
    required this.loginController,
  }) : super(key: key);
  final TextEditingController loginController;
  final TextEditingController passController;
  final GlobalKey<FormState> formKey;

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  bool isHidePassword = true;
  final RegisterCubit _registerCubit = RegisterCubit();
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cofirmPasswordController = TextEditingController();
  final TextEditingController _inviteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _registerCubit,
      child: Stack(
        children: [
          BlocBuilder<RegisterCubit, RegisterState>(
            builder: (context, state) {
              switch (state) {
                case RegisterState.init:
                  return const SizedBox(height: 0);
                case RegisterState.loading:
                  return AppLoader();
              }
            },
          ),
          Column(
            children: [
              const SizedBox(height: 93),
              Text(
                'Register',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Expanded(
                child: Container(),
              ),
              ElevatedButton(
                onPressed: () {
                  widget.formKey.currentState?.validate();
                  formKey.currentState?.validate();
                  if (widget.formKey.currentState?.validate() == true && formKey.currentState?.validate() == true) {
                    _registerCubit.submit(
                      widget.loginController.text,
                      widget.passController.text,
                      _emailController.text,
                      _cofirmPasswordController.text,
                      _inviteController.text,
                    );
                    // _registerCubit.loading();
                  }
                },
                child: const Text('Register'),
                style: AppButtonStyles.primaryButton,
              ),
            ],
          ),
          Padding(
            // 66 - offset for move center, cause of invite
            padding: EdgeInsets.fromLTRB(AppSpace.md, 100, AppSpace.md, 0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppTextField(
                    name: 'Email',
                    icon: 'assets/icons/mail_new.svg',
                    textInputType: TextInputType.emailAddress,
                    controller: _emailController,
                    validator: ValidateEmail(isRequired: true).validation,
                  ),
                  AppSpaceBox.def,
                  const Opacity(
                    opacity: 0,
                    child: AppTextField(name: '1', icon: 'assets/icons/pass.svg'),
                  ),
                  const Opacity(
                    opacity: 0,
                    child: AppTextField(name: '1', icon: 'assets/icons/pass.svg'),
                  ),
                  Stack(
                    children: [
                      AppTextField(
                        name: 'Confirm Password',
                        icon: 'assets/icons/lock_new.svg',
                        obscureText: isHidePassword,
                        controller: _cofirmPasswordController,
                        validator:
                            ValidateConfirmPass(isRequired: true, passwordController: widget.passController).validation,
                      ),
                      Positioned(
                        right: 10,
                        top: 33,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              isHidePassword = !isHidePassword;
                            });
                          },
                          icon: isHidePassword
                              ? Icon(Icons.remove_red_eye_outlined, color: Theme.of(context).iconTheme.color)
                              : Icon(Icons.visibility_off_outlined, color: Theme.of(context).iconTheme.color),
                        ),
                      ),
                    ],
                  ),
                  AppTextField(
                    name: 'Invite',
                    icon: 'assets/icons/mobile_phone_new.svg',
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
      ),
    );
  }
}
