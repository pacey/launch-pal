import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:launch_pal/src/blocs/launch_detail_bloc.dart';
import 'package:launch_pal/src/blocs/launch_detail_bloc_provider.dart';
import 'package:launch_pal/src/models/launch.dart';
import 'package:launch_pal/src/ui/common/launch_date_time.dart';
import 'package:launch_pal/src/ui/common/launch_status.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class LaunchDetail extends StatefulWidget {
  final String title;
  final int launchId;

  LaunchDetail({Key key, @required this.title, @required this.launchId})
      : super(key: key);

  @override
  _LaunchDetailState createState() => _LaunchDetailState();
}

class _LaunchDetailState extends State<LaunchDetail> {
  LaunchDetailBloc bloc;

  @override
  void didChangeDependencies() {
    bloc = LaunchDetailBlocProvider.of(context);
    bloc.getLaunch(widget.launchId);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder(
          stream: bloc.launch,
          builder: (context, AsyncSnapshot<Launch> snapshot) {
            if (snapshot.hasData) {
              final launch = snapshot.data;
              final mainContainerChildren = <Widget>[
                ListTile(
                  title: Text("Launch time"),
                  subtitle: LaunchDateTime(
                    launch: launch,
                    showFullWindow: true,
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
                          height: 300,
                          fit: BoxFit.fitHeight,
                          imageUrl: launch.rocket.imageURL,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: LaunchStatus(launch: launch),
                        ),
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
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
