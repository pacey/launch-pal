import 'package:json_annotation/json_annotation.dart';

import 'agency.dart';

part 'pad.g.dart';

@JsonSerializable()
class Pad {
  final int id;
  final String name;
  final String infoURL;
  final String wikiURL;
  final String mapURL;
  final double latitude;
  final double longitude;
  final List<Agency> agencies;

  Pad(this.id, this.name, this.infoURL, this.wikiURL, this.mapURL,
      this.latitude, this.longitude, this.agencies);

  factory Pad.fromJson(Map<String, dynamic> json) => _$PadFromJson(json);
}