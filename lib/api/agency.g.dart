// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Agency _$AgencyFromJson(Map<String, dynamic> json) {
  return Agency(
      json['id'] as int,
      json['name'] as String,
      json['abbrev'] as String,
      json['countryCode'] as String,
      json['type'] as int,
      json['infoURL'] as String,
      json['wikiURL'] as String,
      json['changed'] == null
          ? null
          : DateTime.parse(json['changed'] as String),
      (json['infoURLs'] as List)?.map((e) => e as String)?.toList());
}
