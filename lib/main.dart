import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:launch_pal/src/app.dart';
import 'package:launch_pal/src/resources/database_manager.dart';

void main() async {
  Crashlytics.instance.enableInDevMode = true;
  FlutterError.onError = (FlutterErrorDetails details) {
    Crashlytics.instance.onError(details);
  };
  await DatabaseManager.instance.database;
  runApp(LaunchPalApp());
}
