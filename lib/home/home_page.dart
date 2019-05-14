import 'package:flutter/material.dart';
import "package:intl/intl.dart";
import 'package:launch_pal/api/launch_page.dart';
import 'package:launch_pal/api/launch_rest_client.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final LaunchRestClient launchRestClient;

  _HomePageState() : launchRestClient = LaunchRestClient.instance();

  Future<LaunchPage> _loadApiData() async {
    var response = await this.launchRestClient.next(next: 20);
    return LaunchPage.fromJson(response.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Launch Pal"),
      ),
      body: Center(
        child: FutureBuilder<LaunchPage>(
          future: this._loadApiData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var launches = snapshot.data.launches;
              return ListView.builder(
                itemCount: launches.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(launches[index].name),
                    subtitle: Text(DateFormat.yMd()
                        .add_Hms()
                        .format(launches[index].windowOpen)),
                  );
                },
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
