
import 'package:json_annotation/json_annotation.dart';

part 'warninig.g.dart';

@JsonSerializable()
class Warning{
  bool? optimalTemperature;
  bool? optimalHumidityAir;
  bool? optimalHumidityGround;
  bool? optimalLight;
  bool? optimalCarbonDioxide;


  Warning(this.optimalTemperature, this.optimalHumidityAir,
      this.optimalHumidityGround, this.optimalLight, this.optimalCarbonDioxide);

  factory Warning.fromJson(Map<String, dynamic> json) => _$WarningFromJson(json);
  Map<String, dynamic> toJson() => _$WarningToJson(this);
}
