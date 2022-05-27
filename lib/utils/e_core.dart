import 'dart:developer';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/widgets.dart';
import 'package:single_house/utils/translate.dart';

typedef ECoreHandler = void Function(int code, String message);

abstract class ECore {
  static ECoreHandler? _handler;
  static bool _debug = false;

  static Future<void> init({ECoreHandler? handler, bool debug = true}) async {
    _debug = debug;
    _handler = handler;
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  }

  static void handle({
    required int code,
    required String message,
    bool reporting = false,
  }) {
    String? codeMessage = _errorKeys[code];
    if (codeMessage != null) {
      message = codeMessage.t;
    }
    if (_debug) log(message);
    _handler?.call(code, message);
    if (reporting) report(exception: code, reason: message);
  }

  static Future<void> report({
    required dynamic exception,
    StackTrace? stackTrace,
    bool fatal = false,
    dynamic reason,
  }) async {
    await FirebaseCrashlytics.instance.recordError(
      exception,
      stackTrace,
      fatal: fatal,
      reason: reason,
    );
  }

  static Map<int, String> get _errorKeys => {
        1: 'error_invalid_invite',
        2: 'error_login_exist',
        3: 'error_email_exist',
        4: 'error_invalid_login',
      };
}
