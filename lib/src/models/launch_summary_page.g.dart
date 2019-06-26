// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch_summary_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LaunchSummaryPage _$LaunchSummaryPageFromJson(Map<String, dynamic> json) {
  return LaunchSummaryPage(
      json['offset'] as int,
      json['count'] as int,
      json['total'] as int,
      (json['launches'] as List)
          ?.map((e) => e == null
              ? null
              : LaunchSummary.fromJson(e as Map<String, dynamic>))
          ?.toList());
}
