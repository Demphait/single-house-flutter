import 'package:flutter/material.dart';
import 'package:single_house/app/router/router_core.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/styles/app_space.dart';
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




