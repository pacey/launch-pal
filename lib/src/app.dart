import 'package:flutter/material.dart';
import 'package:launch_pal/src/ui/launch_list.dart';

class LaunchPalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Launch Pal',
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        home: LaunchList());
  }
}
