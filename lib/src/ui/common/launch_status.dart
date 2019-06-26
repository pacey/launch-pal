import 'package:flutter/material.dart';
import 'package:launch_pal/src/models/launch.dart';

class LaunchStatus extends StatelessWidget {
  final Launch launch;

  const LaunchStatus({Key key, this.launch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var text;
    var background;
    switch (launch.status) {
      case 1:
        {
          text = "Go";
          background = Colors.green;
          break;
        }
      case 2:
        {
          text = "Hold";
          background = Colors.orange;
          break;
        }
      case 3:
        {
          text = "Success";
          background = Colors.green;
          break;
        }
      case 4:
        {
          text = "Failure";
          background = Colors.red;
          break;
        }
    }

    return Chip(
      label: Text(text),
      backgroundColor: background,
    );
  }
}
