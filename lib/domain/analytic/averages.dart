
import 'package:json_annotation/json_annotation.dart';

part 'averages.g.dart';

@JsonSerializable()
class Averages {
  double? avgTemperature;
  double? avgCO2;
  double? avgHumidityAir;
  double? avgHumidityGround;
  double? avgLight;

  Averages(this.avgTemperature, this.avgCO2, this.avgHumidityAir,
      this.avgHumidityGround, this.avgLight);

  factory Averages.fromJson(Map<String, dynamic> json) => _$AveragesFromJson(json);
  Map<String, dynamic> toJson() => _$AveragesToJson(this);

}