import 'package:flutter/material.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/styles/app_text_styles.dart';
import 'package:single_house/utils/translate.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../app/router/router_core.dart';
import '../../widgets/app_textfield.dart';

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
  final PageController _pageController = PageController();
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
                  children: const <Widget>[
                    LoginWidget(),
                    RegisterWidget(),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSpace.md),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      AppTextField(name: 'Username'),
                      AppTextField(name: 'Password', obscureText: true, textInputAction: TextInputAction.done),
                    ],
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

//TODO РАЗБИТЬ НА ФАЙЛЫ

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
        Padding( // 66 - offset for move center, cause of invite
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
            onPressed: () {},
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
