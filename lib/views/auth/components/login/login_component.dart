import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:single_house/app/router/router_core.dart';
import 'package:single_house/styles/app_button_styles.dart';
import 'package:single_house/styles/app_text_styles.dart';
import 'package:single_house/views/auth/components/login/cubit/login_cubit.dart';
import 'package:single_house/views/chats/chats_view.dart';
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
                  if (widget.formKey.currentState?.validate() == true) {
                    _cubit.submit(widget.loginController, widget.passController);
                    _cubit.loading();
                    RouterCore.push(ChatsView.name);
                  }
                },
                child: const Text('Login'),
                style: AppButtonStyles.primaryButton,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
