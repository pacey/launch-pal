import 'package:json_annotation/json_annotation.dart';

import 'launch.dart';
import 'page.dart';

part 'launch_page.g.dart';

@JsonSerializable()
class LaunchPage extends Page {
  final List<Launch> launches;

  LaunchPage(int offset, int count, int total, this.launches) : super(offset, count, total);

  factory LaunchPage.fromJson(Map<String, dynamic> json) => _$LaunchPageFromJson(json);
}