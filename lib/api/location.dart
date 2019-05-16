import 'package:json_annotation/json_annotation.dart';

import 'pad.dart';

part 'location.g.dart';

@JsonSerializable()
class Location {
  final int id;
  final String name;
  final String infoURL;
  final String wikiURL;
  final String countryCode;
  final List<Pad> pads;

  Location(this.id, this.name, this.infoURL, this.wikiURL, this.countryCode, this.pads);

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
}