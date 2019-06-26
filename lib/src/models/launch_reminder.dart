import 'package:json_annotation/json_annotation.dart';

part 'launch_reminder.g.dart';

@JsonSerializable(createToJson: true)
class LaunchReminder {
  final int launchId;
  final DateTime net;

  LaunchReminder({this.launchId, this.net});

  factory LaunchReminder.fromJson(Map<String, dynamic> json) =>
      _$LaunchReminderFromJson(json);

  Map<String, dynamic> toJson() => _$LaunchReminderToJson(this);
}
