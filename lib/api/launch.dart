import 'package:json_annotation/json_annotation.dart';

import 'agency.dart';
import 'location.dart';
import 'mission.dart';
import 'rocket.dart';

part 'launch.g.dart';

@JsonSerializable()
class Launch {
  final int id;
  final String name;
  final int status;
  @JsonKey(name: "isostart")
  final DateTime windowOpen;
  @JsonKey(name: "isoend")
  final DateTime windowClose;
  @JsonKey(name: "isonet")
  final DateTime net;
  final int tbddate;
  final int tbdtime;
  final int probability;
  final DateTime changed;
  final Agency lsp;
  final Rocket rocket;
  final List<Mission> missions;
  final Location location;

  Launch(this.id, this.name, this.status, this.windowOpen, this.windowClose,
      this.net, this.probability, this.changed, this.lsp, this.rocket, this.missions, this.location, this.tbddate, this.tbdtime);

  factory Launch.fromJson(Map<String, dynamic> json) => _$LaunchFromJson(json);
}