import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:single_house/app/app.dart';
import 'package:single_house/utils/e_core.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      await ECore.init();

      runApp(const App());
    },
    (error, stack) => ECore.report(
      exception: error,
      stackTrace: stack,
    ),
  );
}
