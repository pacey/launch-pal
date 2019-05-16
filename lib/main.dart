import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

import 'api/launch.dart';
import 'api/launch_library.dart';
import 'api/launch_page.dart';
import 'api/launch_summary_page.dart';
import 'home/home_screen.dart';
import 'launch/launch_detail_arguments.dart';
import 'launch/launch_detail_screen.dart';

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
      initialRoute: "/",
      routes: {
        HomeScreen.routeName: (context) =>
            HomeScreen(launchSummaryFuture: _getLaunchSummaries()),
        LaunchDetailScreen.routeName: (context) {
          final LaunchDetailArguments args =
              ModalRoute.of(context).settings.arguments;
          return LaunchDetailScreen(
              title: args.title, launchFuture: _getLaunch(args.launchId));
        },
      },
    );
  }

  Future<LaunchSummaryPage> _getLaunchSummaries() {
    return _launchLibrary.launchSummary(next: 20).then((response) {
      return LaunchSummaryPage.fromJson(response.data);
    });
  }

  Future<Launch> _getLaunch(int id) {
    return _launchLibrary.launch(id).then((response) {
      final launchPage = LaunchPage.fromJson(response.data);
      return launchPage.launches.first;
    });
  }
}
