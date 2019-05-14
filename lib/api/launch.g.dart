// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Launch _$LaunchFromJson(Map<String, dynamic> json) {
  return Launch(
      json['id'] as int,
      json['name'] as String,
      json['status'] as int,
      json['isostart'] == null
          ? null
          : DateTime.parse(json['isostart'] as String),
      json['isoend'] == null ? null : DateTime.parse(json['isoend'] as String));
}

Map<String, dynamic> _$LaunchToJson(Launch instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'isostart': instance.windowOpen?.toIso8601String(),
      'isoend': instance.windowClose?.toIso8601String()
    };
