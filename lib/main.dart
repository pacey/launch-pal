import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

import 'database/database_manager.dart';
import 'home/home_screen.dart';
import 'launch/launch_detail_arguments.dart';
import 'launch/launch_detail_screen.dart';

void main() async {
  Crashlytics.instance.enableInDevMode = true;
  FlutterError.onError = (FlutterErrorDetails details) {
    Crashlytics.instance.onError(details);
  };
  await DatabaseManager.instance.database;
  runApp(LaunchPalApp());
}

class LaunchPalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Launch Pal',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      initialRoute: "/",
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        LaunchDetailScreen.routeName: (context) {
          final LaunchDetailArguments args =
              ModalRoute.of(context).settings.arguments;
          return LaunchDetailScreen(title: args.title, launchId: args.launchId);
        },
      },
    );
  }
}
