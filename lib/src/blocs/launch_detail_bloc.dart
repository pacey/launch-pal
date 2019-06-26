import 'dart:async';

import 'package:launch_pal/src/models/launch.dart';
import 'package:launch_pal/src/resources/launch_repository.dart';

class LaunchDetailBloc {
  final _launchRepository = LaunchRepository();
  final _launchFetcher = StreamController<Launch>();

  Stream<Launch> get launch => _launchFetcher.stream;

  getLaunch(int id) async {
    var launch = await _launchRepository.getLaunch(id);
    _launchFetcher.add(launch);
  }

  dispose() {
    _launchFetcher.close();
  }
}
