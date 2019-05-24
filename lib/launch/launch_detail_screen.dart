import 'package:flutter/material.dart';
import 'package:launch_pal/api/launch.dart';
import 'package:launch_pal/api/launch_library.dart';
import 'package:launch_pal/api/launch_page.dart';

class LaunchDetailScreen extends StatefulWidget {
  static const routeName = "/launch";
  final String title;
  final int launchId;

  LaunchDetailScreen({Key key, @required this.title, @required this.launchId})
      : super(key: key);

  @override
  _LaunchDetailScreenState createState() => _LaunchDetailScreenState();
}

class _LaunchDetailScreenState extends State<LaunchDetailScreen> {
  final LaunchLibrary _launchLibrary = LaunchLibrary.instance();
  Future<Launch> _launchFuture;

  @override
  void initState() {
    super.initState();
    _launchFuture = _getLaunch(widget.launchId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder<Launch>(
          future: _launchFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final launch = snapshot.data;
              return Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(children: <Widget>[
                  Image.network(launch.rocket.imageURL,
                      fit: BoxFit.contain, height: 200.0),
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

  Future<Launch> _getLaunch(int id) async {
    var response = await _launchLibrary.launch(id);
    final launchPage = LaunchPage.fromJson(response.data);
    return launchPage.launches.first;
  }
}
