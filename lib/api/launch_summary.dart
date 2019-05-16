import 'package:json_annotation/json_annotation.dart';

part 'launch_summary.g.dart';

@JsonSerializable()
class LaunchSummary {
  final int id;
  final String name;
  final int status;
  @JsonKey(name: "windowstart")
  final DateTime windowOpen;
  @JsonKey(name: "windowend")
  final DateTime windowClose;
  final String net;
  final int probability;
  final DateTime changed;
  final String lsp;

  LaunchSummary(this.id, this.name, this.status, this.windowOpen, this.windowClose, this.net, this.probability, this.changed, this.lsp);

  factory LaunchSummary.fromJson(Map<String, dynamic> json) => _$LaunchSummaryFromJson(json);
}