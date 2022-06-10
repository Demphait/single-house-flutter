import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:single_house/app/router/index.dart';
import 'package:single_house/utils/theme_provider.dart';
import 'package:single_house/utils/translate.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          title: 'Flutter Demo'.t,
          themeMode: themeProvider.themeMode,
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          navigatorKey: RouterCore.navigatorKey,
          onGenerateRoute: RouterList.onGenerateRoute,
          initialRoute: RouterList.defaultRoute,
        );
      });
}
