import 'package:flutter/material.dart';
import 'package:single_house/app/router/transparent_page_route.dart';

abstract class RouterCore {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static PageRoute createRoute(Widget view) => PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => view,
      );

  static PageRoute createTransparentRoute(Widget view) => TransparentRoute(
        builder: (BuildContext context) => view,
      );

  static Future<dynamic> push(
    String route, {
    BuildContext? context,
    bool replace = false,
    dynamic argument,
  }) async {
    if (replace) {
      return _navState(context).pushReplacementNamed(
        route,
        arguments: argument,
      );
    }
    return _navState(context).pushNamed(
      route,
      arguments: argument,
    );
  }

  static Future<dynamic> pop({
    BuildContext? context,
    dynamic data,
  }) async =>
      _navState(context).pop(data);

  static NavigatorState _navState(BuildContext? context) =>
      Navigator.of(context ?? navigatorKey.currentContext!);
}
