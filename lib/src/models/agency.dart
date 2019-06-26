import 'package:json_annotation/json_annotation.dart';

part 'agency.g.dart';

@JsonSerializable()
class Agency {
  final int id;
  final String name;
  final String abbrev;
  final String countryCode;
  final int type;
  final String infoURL;
  final String wikiURL;
  final DateTime changed;
  final List<String> infoURLs;

  Agency(this.id, this.name, this.abbrev, this.countryCode, this.type,
      this.infoURL, this.wikiURL, this.changed, this.infoURLs);

  factory Agency.fromJson(Map<String, dynamic> json) => _$AgencyFromJson(json);
}
