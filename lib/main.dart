import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:launch_pal/src/app.dart';

void main() async {
  Crashlytics.instance.enableInDevMode = true;
  FlutterError.onError = (FlutterErrorDetails details) {
    Crashlytics.instance.recordFlutterError(details);
  };
  runApp(LaunchPalApp());
}
