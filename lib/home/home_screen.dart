import 'package:flutter/material.dart';
import "package:intl/intl.dart";
import 'package:launch_pal/api/launch_summary_page.dart';
import 'package:launch_pal/launch/launch_detail_arguments.dart';
import 'package:launch_pal/launch/launch_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/";
  final Future<LaunchSummaryPage> launchSummaryFuture;

  HomeScreen({Key key, this.launchSummaryFuture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Launch Pal"),
      ),
      body: Center(
        child: FutureBuilder<LaunchSummaryPage>(
          future: launchSummaryFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var launches = snapshot.data.launches;
              return ListView.builder(
                itemCount: launches.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(launches[index].name),
                    subtitle: Text(DateFormat.yMMMMd()
                        .add_Hms()
                        .format(launches[index].windowOpen)),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.pushNamed(context, LaunchDetailScreen.routeName,
                          arguments: LaunchDetailArguments(
                              launches[index].name, launches[index].id));
                    },
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text(
                "Failed to load data",
                style: TextStyle(color: Colors.red),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
