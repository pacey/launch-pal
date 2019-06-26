// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rocket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rocket _$RocketFromJson(Map<String, dynamic> json) {
  return Rocket(
      json['id'] as int,
      json['name'] as String,
      json['configuration'] as String,
      json['familyname'] as String,
      json['wikiURL'] as String,
      (json['infoURLs'] as List)?.map((e) => e as String)?.toList(),
      json['infoURL'] as String,
      (json['imageSizes'] as List)?.map((e) => e as int)?.toList(),
      json['imageURL'] as String,
      (json['agencies'] as List)
          ?.map((e) =>
              e == null ? null : Agency.fromJson(e as Map<String, dynamic>))
          ?.toList());
}
