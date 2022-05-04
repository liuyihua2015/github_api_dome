import 'package:json_annotation/json_annotation.dart';
import 'package:github_api_dome/Model/Repository.dart';
import 'package:github_api_dome/Model/User.dart';

part 'Activity.g.dart';

@JsonSerializable()
class Event {
  String? id;
  String? type;
  Repository? repo;
  User? actor;
  Map<String, dynamic> payload;

  Event(
    this.id,
    this.type,
    this.repo,
    this.actor,
    this.payload,
  );
  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
  Map<String,dynamic> toJson() => _$EventToJson(this);
}
