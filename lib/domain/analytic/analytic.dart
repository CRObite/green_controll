import 'package:json_annotation/json_annotation.dart';

import 'averages_per_day.dart';

part 'analytic.g.dart';

@JsonSerializable()
class Analytic{
  List<AveragesPerDay> averagesPerDay;

  Analytic(this.averagesPerDay);

  factory Analytic.fromJson(Map<String, dynamic> json) => _$AnalyticFromJson(json);
  Map<String, dynamic> toJson() => _$AnalyticToJson(this);

}



