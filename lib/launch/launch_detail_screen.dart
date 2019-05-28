import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:launch_pal/api/launch.dart';
import 'package:launch_pal/api/launch_library.dart';
import 'package:launch_pal/api/launch_page.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

import 'launch_probability.dart';

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
              final dateFormat = new DateFormat().add_yMMMd().add_Hms();
              final mainContainerChildren = <Widget>[
                ListTile(
                  title: Text("Launch time"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("NET ${dateFormat.format(launch.net)}"),
                      Text(
                          "${dateFormat.format(launch.windowOpen)} - ${dateFormat.format(launch.windowClose)}")
                    ],
                  ),
                ),
              ];

              if (launch.rocket != null) {
                mainContainerChildren.add(
                  ListTile(
                    title: Text("Rocket details"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Agency: ${launch.lsp.name}"),
                        Text("Family: ${launch.rocket.familyName}"),
                        Text("Configuration: ${launch.rocket.configuration}")
                      ],
                    ),
                  ),
                );
              }

              if (launch.location?.pads?.isNotEmpty ?? false) {
                mainContainerChildren.add(
                  ListTile(
                    title: Text("Launch location"),
                    subtitle: Text("${launch.location.pads.first.name}"),
                    trailing: Icon(Icons.map),
                    onTap: () async {
                      if (await launcher
                          .canLaunch(launch.location.pads.first.mapURL)) {
                        launcher.launch(launch.location.pads.first.mapURL);
                      }
                    },
                  ),
                );
              }

              if (launch.missions?.isNotEmpty ?? false) {
                mainContainerChildren.add(
                  ListTile(
                    title: Text("Mission details"),
                    subtitle: Text(launch.missions.first.description),
                  ),
                );
              }

              return SingleChildScrollView(
                child: Column(children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Center(
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: launch.rocket.imageURL,
                          height: 300,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child:
                            LaunchProbability(probability: launch.probability),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: mainContainerChildren,
                    ),
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
