import 'package:flutter/material.dart';
import 'package:single_house/app/router/index.dart';

abstract class GlobalContext {
  static BuildContext get context => RouterCore.navigatorKey.currentContext!;
  
  static void showSnackWidget(Widget child) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: child),
    );
  }

  static void showSnackText(String text) {
    showSnackWidget(Text(text));
  }
}
