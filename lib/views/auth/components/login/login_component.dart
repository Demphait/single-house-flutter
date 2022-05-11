import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/styles/app_text_styles.dart';
import 'package:single_house/views/auth/components/login/cubit/login_cubit.dart';
import 'package:single_house/widgets/app_loader.dart';


class LoginWidget extends StatefulWidget {
  const LoginWidget({
    Key? key,
    required this.formKey,
    required this.loginController,
    required this.passController,
  }) : super(key: key);
  final GlobalKey<FormState> formKey;
  final TextEditingController loginController;
  final TextEditingController passController;

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final LoginCubit _cubit = LoginCubit();

  bool isPressed = false;
  // void _login() {
  //   RouterCore.push(ChatsView.name);
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: Stack(
        children: [
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              switch (state) {
                case LoginState.init:
                  return const SizedBox(height: 0);
                case LoginState.loading:
                  return AppLoader();
              }
            },
          ),
          Column(
            children: [
              const SizedBox(height: 93),
              Text(
                'Login',
                style: AppTextStyles.title.white,
              ),
              Expanded(
                child: Container(),
              ),
              ElevatedButton(
                onPressed: () {
                  widget.formKey.currentState?.validate();
                  _cubit.loading();
                },
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
        ],
      ),
    );
  }
}
