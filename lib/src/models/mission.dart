import 'package:json_annotation/json_annotation.dart';

import 'agency.dart';

part 'mission.g.dart';

@JsonSerializable()
class Mission {
  final int id;
  final String name;
  final String description;
  final int type;
  final String typeName;
  final String wikiURL;
  final List<Agency> agencies;

  Mission(this.id, this.name, this.description, this.type, this.typeName,
      this.wikiURL, this.agencies);

  factory Mission.fromJson(Map<String, dynamic> json) =>
      _$MissionFromJson(json);
}
