import 'package:flutter/material.dart';
import "package:intl/intl.dart";
import 'package:launch_pal/api/launch_library.dart';
import 'package:launch_pal/api/launch_summary_page.dart';
import 'package:launch_pal/launch/launch_detail_arguments.dart';
import 'package:launch_pal/launch/launch_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/";

  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final LaunchLibrary _launchLibrary = LaunchLibrary.instance();
  Future<LaunchSummaryPage> _launchSummaryPageFuture;

  @override
  void initState() {
    super.initState();
    _launchSummaryPageFuture = _getLaunchSummaries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Launch Pal"),
      ),
      body: Center(
        child: FutureBuilder<LaunchSummaryPage>(
          future: _launchSummaryPageFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var launches = snapshot.data.launches;
              return RefreshIndicator(
                onRefresh: () {
                  var future = _getLaunchSummaries();
                  setState(() {
                    _launchSummaryPageFuture = future;
                  });
                  return future;
                },
                child: ListView.builder(
                  itemCount: launches.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(launches[index].name),
                      subtitle: Text(DateFormat.yMMMMd()
                          .add_Hms()
                          .format(launches[index].windowOpen)),
                      trailing: Icon(Icons.chevron_right),
                      onTap: () {
                        Navigator.pushNamed(
                            context, LaunchDetailScreen.routeName,
                            arguments: LaunchDetailArguments(
                                launches[index].name, launches[index].id));
                      },
                    );
                  },
                ),
              );
            } else if (snapshot.hasError) {
              return Text(
                "Failed to load data: ${snapshot.error}",
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

  Future<LaunchSummaryPage> _getLaunchSummaries() async {
    var response = await _launchLibrary.launchSummary(next: 20);
    return LaunchSummaryPage.fromJson(response.data);
  }
}
