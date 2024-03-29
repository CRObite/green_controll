import 'package:green_control/domain/user/user.dart';
import 'package:json_annotation/json_annotation.dart';

import '../arduino/arduino.dart';

part 'greenhouse.g.dart';

@JsonSerializable()
class GreenHouse{
  int id;
  String? name;
  User? owner;
  Arduino? arduino;

  GreenHouse(this.id, this.name, this.owner, this.arduino);

  factory GreenHouse.fromJson(Map<String, dynamic> json) => _$GreenHouseFromJson(json);
  Map<String, dynamic> toJson() => _$GreenHouseToJson(this);
}