import 'package:green_control/domain/plants/plant.dart';
import 'package:json_annotation/json_annotation.dart';

part 'arduino.g.dart';

@JsonSerializable()
class Arduino{
  int id;
  double? temperature;
  double? humidity;
  double? carbonDioxide;
  Plant? plant;

  Arduino(this.id, this.temperature, this.humidity, this.carbonDioxide, this.plant);

  factory Arduino.fromJson(Map<String, dynamic> json) => _$ArduinoFromJson(json);
  Map<String, dynamic> toJson() => _$ArduinoToJson(this);

}