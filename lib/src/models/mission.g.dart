// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mission _$MissionFromJson(Map<String, dynamic> json) {
  return Mission(
      json['id'] as int,
      json['name'] as String,
      json['description'] as String,
      json['type'] as int,
      json['typeName'] as String,
      json['wikiURL'] as String,
      (json['agencies'] as List)
          ?.map((e) =>
              e == null ? null : Agency.fromJson(e as Map<String, dynamic>))
          ?.toList());
}
