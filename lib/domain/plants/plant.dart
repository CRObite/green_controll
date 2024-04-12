

import 'package:json_annotation/json_annotation.dart';

part 'plant.g.dart';

@JsonSerializable()
class Plant{
  int id;
  String? name;
  String? description;
  String? imageUrl;
  double? minimumTemperature;
  double? maximumTemperature;
  double? minimumHumidityAir;
  double? maximumHumidityAir;
  double? minimumHumidityGround;
  double? maximumHumidityGround;
  double? minimumLight;
  double? maximumLight;
  double? minimumCarbonDioxide;
  double? maximumCarbonDioxide;


  Plant(
      this.id,
      this.name,
      this.description,
      this.imageUrl,
      this.minimumTemperature,
      this.maximumTemperature,
      this.minimumHumidityAir,
      this.maximumHumidityAir,
      this.minimumHumidityGround,
      this.maximumHumidityGround,
      this.minimumLight,
      this.maximumLight,
      this.minimumCarbonDioxide,
      this.maximumCarbonDioxide);

  factory Plant.fromJson(Map<String, dynamic> json) => _$PlantFromJson(json);
  Map<String, dynamic> toJson() => _$PlantToJson(this);
}