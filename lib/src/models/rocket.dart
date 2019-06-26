import 'package:json_annotation/json_annotation.dart';

import 'agency.dart';

part 'rocket.g.dart';

@JsonSerializable()
class Rocket {
  final int id;
  final String name;
  final String configuration;
  @JsonKey(name: "familyname")
  final String familyName;
  final String wikiURL;
  final List<String> infoURLs;
  final String infoURL;
  final List<int> imageSizes;
  final String imageURL;
  final List<Agency> agencies;

  Rocket(
      this.id,
      this.name,
      this.configuration,
      this.familyName,
      this.wikiURL,
      this.infoURLs,
      this.infoURL,
      this.imageSizes,
      this.imageURL,
      this.agencies);

  factory Rocket.fromJson(Map<String, dynamic> json) => _$RocketFromJson(json);
}
