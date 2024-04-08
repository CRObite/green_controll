import 'package:green_control/domain/user/user.dart';
import 'package:json_annotation/json_annotation.dart';

import '../arduino/arduino.dart';

part 'greenhouse.g.dart';

@JsonSerializable()
class GreenHouse{
  int id;
  String? name;
  Arduino? arduino;

  GreenHouse(this.id, this.name, this.arduino);

  factory GreenHouse.fromJson(Map<String, dynamic> json) => _$GreenHouseFromJson(json);
  Map<String, dynamic> toJson() => _$GreenHouseToJson(this);
}