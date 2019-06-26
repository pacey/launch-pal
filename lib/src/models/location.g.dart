// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) {
  return Location(
      json['id'] as int,
      json['name'] as String,
      json['infoURL'] as String,
      json['wikiURL'] as String,
      json['countryCode'] as String,
      (json['pads'] as List)
          ?.map(
              (e) => e == null ? null : Pad.fromJson(e as Map<String, dynamic>))
          ?.toList());
}
