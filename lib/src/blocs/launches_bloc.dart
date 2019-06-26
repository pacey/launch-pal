import 'dart:async';

import 'package:launch_pal/src/models/launch_page.dart';
import 'package:launch_pal/src/resources/launch_repository.dart';

class LaunchesBloc {
  final _launchRepository = LaunchRepository();
  final _launchPageFetcher = StreamController<LaunchPage>();

  Stream<LaunchPage> get launches => _launchPageFetcher.stream;

  getNextLaunches() async {
    var launchPage = await _launchRepository.getNextLaunches();
    _launchPageFetcher.add(launchPage);
  }

  dispose() {
    _launchPageFetcher.close();
  }
}

final bloc = LaunchesBloc();
