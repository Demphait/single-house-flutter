import 'dart:async';

import 'package:flutter/material.dart';
import 'package:single_house/api/api_core.dart';
import 'package:single_house/app/app.dart';

void main() {
  runZoned(() async {
    await ApiCore.init('http://localhost:5000/api');
    runApp(const App());
  });
}
