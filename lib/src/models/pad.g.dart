// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pad.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pad _$PadFromJson(Map<String, dynamic> json) {
  return Pad(
      json['id'] as int,
      json['name'] as String,
      json['infoURL'] as String,
      json['wikiURL'] as String,
      json['mapURL'] as String,
      (json['latitude'] as num)?.toDouble(),
      (json['longitude'] as num)?.toDouble(),
      (json['agencies'] as List)
          ?.map((e) =>
              e == null ? null : Agency.fromJson(e as Map<String, dynamic>))
          ?.toList());
}
