import 'package:json_annotation/json_annotation.dart';

import 'launch_summary.dart';
import 'page.dart';

part 'launch_summary_page.g.dart';

@JsonSerializable()
class LaunchSummaryPage extends Page {
  final List<LaunchSummary> launches;

  LaunchSummaryPage(int offset, int count, int total, this.launches)
      : super(offset, count, total);

  factory LaunchSummaryPage.fromJson(Map<String, dynamic> json) =>
      _$LaunchSummaryPageFromJson(json);
}
