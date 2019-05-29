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
      json['isoend'] == null ? null : DateTime.parse(json['isoend'] as String),
      json['isonet'] == null ? null : DateTime.parse(json['isonet'] as String),
      json['probability'] as int,
      json['changed'] == null
          ? null
          : DateTime.parse(json['changed'] as String),
      json['lsp'] == null
          ? null
          : Agency.fromJson(json['lsp'] as Map<String, dynamic>),
      json['rocket'] == null
          ? null
          : Rocket.fromJson(json['rocket'] as Map<String, dynamic>),
      (json['missions'] as List)
          ?.map((e) =>
              e == null ? null : Mission.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      json['tbddate'] as int,
      json['tbdtime'] as int);
}
