import 'package:flutter/material.dart';
import 'package:single_house/views/auth/auth_view.dart';
import 'package:single_house/views/chats/chats_view.dart';
import 'package:single_house/views/dialog/dialog_view.dart';
import 'package:single_house/views/example/example_view.dart';
import 'package:single_house/views/settings/settings_view.dart';
import 'package:single_house/views/splash/splash_view.dart';

abstract class RouterList {
  static String get defaultRoute => SplashView.name;

  static Route<dynamic>? onGenerateRoute(RouteSettings args) {
    if (args.name != null && _list[args.name] != null) {
      return _list[args.name]!(args.arguments);
    }
    return _list[defaultRoute]!(args.arguments);
  }

  static Map<String, PageRoute Function(Object?)?> get _list => {
        ExampleView.name: (arg) => ExampleView.route(),
        AuthView.name: (arg) => AuthView.route(),
        ChatsView.name: (arg) => ChatsView.route(),
        DialogView.name: (arg) => DialogView.route(),
        SettingsView.name: (arg) => SettingsView.route(),
        SplashView.name: (arg) => SplashView.route(),
      };
}
