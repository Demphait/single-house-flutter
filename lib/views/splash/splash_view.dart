import 'package:flutter/material.dart';
import 'package:single_house/api/api_core.dart';
import 'package:single_house/app/global_context.dart';
import 'package:single_house/app/router/router_core.dart';
import 'package:single_house/utils/e_core.dart';
import 'package:single_house/utils/sp_core.dart';
import 'package:single_house/views/auth/auth_view.dart';
import 'package:single_house/views/dialog/dialog_view.dart';
import 'package:single_house/widgets/app_loader.dart';

class SplashView extends StatefulWidget {
  static const String name = 'SplashView';
  static PageRoute route() => RouterCore.createRoute(
        const SplashView._(),
      );

  const SplashView._();

  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  void init() async {
    await ECore.init(
      handler: (code, message) {
        GlobalContext.showSnackText(message);
      },
    );
    await ApiCore.init('https://signal-house.herokuapp.com/api');
    await SpCore.init();

    String accessToken = SpCore.getAccessToken();
    if (accessToken.isEmpty) {
      return RouterCore.push(AuthView.name);
    }
    ApiCore.setTokens(accessToken, null);
    RouterCore.push(DialogView.name);
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppLoader(),
    );
  }
}
