import 'package:json_annotation/json_annotation.dart';

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

  Launch(this.id, this.name, this.status, this.windowOpen, this.windowClose);

  factory Launch.fromJson(Map<String, dynamic> json) => _$LaunchFromJson(json);
}