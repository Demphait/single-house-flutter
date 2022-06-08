import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:single_house/api/api_core.dart';
import 'package:single_house/app/app.dart';
import 'package:single_house/app/global_context.dart';
import 'package:single_house/utils/e_core.dart';
import 'package:single_house/utils/sp_core.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      await ECore.init(handler: (code, message) {
        GlobalContext.showSnackText(message);
      },);
      await ApiCore.init('https://signal-house.herokuapp.com/api');
      await SpCore.init();

      // try {
      //   throw ('error');
      // } catch (e, stackTrace) {
      //   ECore.report(exception: e, stackTrace: stackTrace);
      // }
      // await SocketIO.init(
      //   domain: 'signal-house.herokuapp.com',
      // );

      runApp(const App());
    },
    (error, stack) => ECore.report(
      exception: error,
      stackTrace: stack,
    ),
  );
}
