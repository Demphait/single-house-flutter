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

  static Future<void> modalBottomSheet(Widget widget, {BuildContext? ctx}) {
    return showModalBottomSheet<void>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(48),
          topRight: Radius.circular(48),
        ),
      ),
      isScrollControlled: true,
      backgroundColor: Theme.of(ctx ?? context).backgroundColor,
      context: ctx ?? context,
      builder: (BuildContext context) {
        return widget;
      },
    );
  }
}
