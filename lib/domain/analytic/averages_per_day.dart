import 'package:json_annotation/json_annotation.dart';

import 'averages.dart';

part 'averages_per_day.g.dart';

@JsonSerializable()
class AveragesPerDay{
  String? date;
  Averages? averages;

  AveragesPerDay(this.date, this.averages);

  factory AveragesPerDay.fromJson(Map<String, dynamic> json) => _$AveragesPerDayFromJson(json);
  Map<String, dynamic> toJson() => _$AveragesPerDayToJson(this);

}
