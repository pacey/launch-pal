import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:launch_pal/api/launch.dart';
import 'package:launch_pal/api/launch_library.dart';
import 'package:launch_pal/api/launch_page.dart';
import 'package:launch_pal/common/launch_date_time.dart';
import 'package:launch_pal/common/launch_status.dart';
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
  Future<LaunchPage> _launchPageFuture;

  @override
  void initState() {
    super.initState();
    _launchPageFuture = _getNextLaunches();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Launch Pal"),
      ),
      body: Center(
        child: FutureBuilder<LaunchPage>(
          future: _launchPageFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var launches = snapshot.data.launches;
              return RefreshIndicator(
                onRefresh: () {
                  var future = _getNextLaunches();
                  setState(() {
                    _launchPageFuture = future;
                  });
                  return future;
                },
                child: ListView.builder(
                  itemCount: launches.length,
                  itemBuilder: (context, index) {
                    return _LaunchCard(launch: launches[index]);
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

  Future<LaunchPage> _getNextLaunches() async {
    var response = await _launchLibrary.nextLaunches(next: 20);
    return LaunchPage.fromJson(response.data);
  }
}

class _LaunchCard extends StatelessWidget {
  final Launch launch;

  const _LaunchCard({Key key, @required this.launch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        child: Column(
          children: <Widget>[
            Stack(children: <Widget>[
              Center(
                child: CachedNetworkImage(
                  height: 200,
                  imageUrl: launch.rocket.imageURL,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: LaunchStatus(launch: launch),
                ),
              ),
            ]),
            ListTile(
                title: Text(launch.name),
                subtitle: LaunchDateTime(launch: launch))
          ],
        ),
        onTap: () {
          Navigator.pushNamed(context, LaunchDetailScreen.routeName,
              arguments: LaunchDetailArguments(launch.name, launch.id));
        },
      ),
    );
  }
}
