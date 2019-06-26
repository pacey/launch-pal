// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch_reminder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LaunchReminder _$LaunchReminderFromJson(Map<String, dynamic> json) {
  return LaunchReminder(
      launchId: json['launchId'] as int,
      net: json['net'] == null ? null : DateTime.parse(json['net'] as String));
}

Map<String, dynamic> _$LaunchReminderToJson(LaunchReminder instance) =>
    <String, dynamic>{
      'launchId': instance.launchId,
      'net': instance.net?.toIso8601String()
    };
