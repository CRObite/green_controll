

import 'package:json_annotation/json_annotation.dart';

part 'plant.g.dart';

@JsonSerializable()
class Plant{
  int id;
  String? name;
  String? description;
  String? imageUrl;
  double? temperature;
  double? humidity;
  double? carbonDioxide;

  Plant(this.id, this.name, this.description, this.imageUrl, this.temperature,
      this.humidity, this.carbonDioxide);

  factory Plant.fromJson(Map<String, dynamic> json) => _$PlantFromJson(json);
  Map<String, dynamic> toJson() => _$PlantToJson(this);
}