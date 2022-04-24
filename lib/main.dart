import 'dart:async';

import 'package:flutter/material.dart';
import 'package:single_house/app/app.dart';

void main() {
  runZoned(() async {
    // await SocketIO.init(
    //   domain: 'signal-house.herokuapp.com',
    // );

    runApp(const App());
  });
}
