import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/widgets.dart';

abstract class ECore {
  static Future<void> init() async {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  }

  static Future<void> report({
    required dynamic exception,
    required StackTrace stackTrace,
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
}
