import 'package:flutter/material.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'api/launch_page.dart';
import 'api/launch_library.dart';
import 'home/home_page.dart';

void main() {
  Crashlytics.instance.enableInDevMode = true;
  FlutterError.onError = (FlutterErrorDetails details) {
    Crashlytics.instance.onError(details);
  };
  runApp(LaunchPalApp());
}

class LaunchPalApp extends StatelessWidget {
  final LaunchLibrary _launchLibrary;

  LaunchPalApp() : _launchLibrary = LaunchLibrary.instance();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Launch Pal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(
        launchPage: _launchLibrary.launch(next: 20).then((response) {
          return LaunchPage.fromJson(response.data);
        }),
      ),
    );
  }
}
