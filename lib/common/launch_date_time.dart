import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:launch_pal/api/launch.dart';

final dateFormat = new DateFormat.yMMMd();
final dateTimeFormat = new DateFormat.yMMMd().add_Hms();

class LaunchDateTime extends StatelessWidget {
  final Launch launch;

  const LaunchDateTime({Key key, this.launch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dateFormatter = dateFormat;

    if (launch.tbddate == 1) {
      return Text("NET ${dateFormatter.format(launch.net.toLocal())}");
    }

    if (launch.tbdtime != 1) {
      dateFormatter = dateTimeFormat;
    }

    if (launch.windowOpen == launch.windowClose) {
      return Text("${dateFormatter.format(launch.windowOpen.toLocal())}");
    } else {
      return Text(
          "${dateFormatter.format(launch.windowOpen.toLocal())} - ${dateFormatter.format(launch.windowClose.toLocal())}");
    }
  }
}
