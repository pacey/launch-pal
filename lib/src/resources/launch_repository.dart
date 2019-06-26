import 'package:launch_pal/src/models/launch.dart';
import 'package:launch_pal/src/models/launch_page.dart';

import 'launch_library_api_provider.dart';

class LaunchRepository {
  final LaunchLibraryApiProvider _launchLibraryApiProvider =
      LaunchLibraryApiProvider.instance();

  Future<LaunchPage> getNextLaunches() async {
    var response = await _launchLibraryApiProvider.nextLaunches();
    return LaunchPage.fromJson(response.data);
  }

  Future<Launch> getLaunch(int launchId) async {
    var response = await _launchLibraryApiProvider.launch(launchId);
    final launchPage = LaunchPage.fromJson(response.data);
    return launchPage.launches.first;
  }
}
