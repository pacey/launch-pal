import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:launch_pal/src/blocs/launch_detail_bloc_provider.dart';
import 'package:launch_pal/src/blocs/launches_bloc.dart';
import 'package:launch_pal/src/models/launch.dart';
import 'package:launch_pal/src/models/launch_page.dart';
import 'package:launch_pal/src/ui/common/launch_date_time.dart';
import 'package:launch_pal/src/ui/common/launch_reminder_bell.dart';
import 'package:launch_pal/src/ui/launch_detail.dart';

class LaunchList extends StatefulWidget {
  LaunchList({Key key}) : super(key: key);

  @override
  _LaunchListState createState() => _LaunchListState();
}

class _LaunchListState extends State<LaunchList> {
  @override
  void initState() {
    super.initState();
    bloc.getNextLaunches();
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
        title: Text("Launch Pal"),
      ),
      body: Center(
        child: StreamBuilder(
          stream: bloc.launches,
          builder: (context, AsyncSnapshot<LaunchPage> snapshot) {
            if (snapshot.hasData) {
              var launches = snapshot.data.launches;
              return RefreshIndicator(
                onRefresh: () async {
                  await bloc.getNextLaunches();
                  return null;
                },
                child: ListView.builder(
                  itemCount: launches.length,
                  itemBuilder: (context, index) {
                    return _launchCard(launches[index]);
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

  Widget _launchCard(Launch launch) {
    return Card(
      child: InkWell(
        child: ListTile(
          leading: CachedNetworkImage(
              imageUrl: launch.rocket.imageURL, width: 100, height: 100),
          title: Text(launch.name),
          subtitle: LaunchDateTime(launch: launch),
          trailing: LaunchReminderBell(launch),
        ),
        onTap: () {
          final page = LaunchDetailBlocProvider(
              child: LaunchDetail(title: launch.name, launchId: launch.id));
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return page;
          }));
        },
      ),
    );
  }
}
