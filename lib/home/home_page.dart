import 'package:flutter/material.dart';
import "package:intl/intl.dart";
import 'package:launch_pal/api/launch_page.dart';

class HomePage extends StatelessWidget {
  final Future<LaunchPage> launchPage;

  const HomePage({Key key, this.launchPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Launch Pal"),
      ),
      body: Center(
        child: FutureBuilder<LaunchPage>(
          future: launchPage,
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
