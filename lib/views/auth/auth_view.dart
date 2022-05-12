import 'package:flutter/material.dart';
import 'package:single_house/app/router/router_core.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/utils/validation/validate_login.dart';
import 'package:single_house/utils/validation/validate_password.dart';
import 'package:single_house/widgets/app_textfield.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'components/login/login_component.dart';
import 'components/register/register_component.dart';

class AuthView extends StatefulWidget {
  //const AuthWidget({ Key? key }) : super(key: key);
  static const String name = 'AuthView';
  static PageRoute route() => RouterCore.createRoute(
        const AuthView._(),
      );

  const AuthView._();

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  final formKey = GlobalKey<FormState>();
  String login = '';
  String password = '';
  final PageController _pageController = PageController();
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                PageView(
                  controller: _pageController,
                  children: <Widget>[
                    LoginWidget(
                      formKey: formKey,
                      loginController: _loginController,
                      passController: _passwordController,
                    ),
                    RegisterWidget(
                      formKey: formKey,
                      loginController: _loginController,
                      passController: _passwordController,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSpace.md),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppTextField(
                          name: 'Username',
                          controller: _loginController,
                          validator: ValidateLogin(isRequired: true).validation,
                          onChanged: (value) => setState(() {
                            login = value;
                          }),
                        ),
                        AppSpaceBox.md,
                        AppTextField(
                          name: 'Password',
                          obscureText: true,
                          textInputAction: TextInputAction.done,
                          controller: _passwordController,
                          validator: ValidatePassword(isRequired: true).validation,
                          onChanged: (value) => setState(
                            () {
                              password = value;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: SmoothPageIndicator(controller: _pageController, count: 2),
            padding: EdgeInsets.symmetric(vertical: AppSpace.sm),
            margin: const EdgeInsets.only(bottom: 78),
          ),
        ],
      ),
    );
  }
}
