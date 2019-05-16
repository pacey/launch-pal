import 'package:flutter/material.dart';
import 'package:launch_pal/api/launch.dart';

class LaunchDetailScreen extends StatelessWidget {
  static const routeName = "/launch";
  final String title;
  final Future<Launch> launchFuture;

  LaunchDetailScreen({Key key, this.title, this.launchFuture})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: FutureBuilder<Launch>(
          future: launchFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final launch = snapshot.data;
              return Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(children: <Widget>[
                  Image.network(launch.rocket.imageURL, fit: BoxFit.contain, height: 200.0),
                  Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
                  Row(
                    children: <Widget>[
                      Flexible(child: Text("More information here"))
                    ],
                  ),
                ]),
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
