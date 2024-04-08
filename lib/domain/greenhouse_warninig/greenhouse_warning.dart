
import 'package:json_annotation/json_annotation.dart';

import '../greenhouse/greenhouse.dart';
import '../warning/warninig.dart';

part 'greenhouse_warning.g.dart';

@JsonSerializable()
class GreenhouseWarning{

  GreenHouse greenhouse;
  Warning warning;

  GreenhouseWarning(this.greenhouse, this.warning);

  factory GreenhouseWarning.fromJson(Map<String, dynamic> json) => _$GreenhouseWarningFromJson(json);
  Map<String, dynamic> toJson() => _$GreenhouseWarningToJson(this);
}
