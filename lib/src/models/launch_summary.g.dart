// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LaunchSummary _$LaunchSummaryFromJson(Map<String, dynamic> json) {
  return LaunchSummary(
      json['id'] as int,
      json['name'] as String,
      json['status'] as int,
      json['windowstart'] == null
          ? null
          : DateTime.parse(json['windowstart'] as String),
      json['windowend'] == null
          ? null
          : DateTime.parse(json['windowend'] as String),
      json['net'] as String,
      json['probability'] as int,
      json['changed'] == null
          ? null
          : DateTime.parse(json['changed'] as String),
      json['lsp'] as String);
}
