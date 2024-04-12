// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'averages.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Averages _$AveragesFromJson(Map<String, dynamic> json) => Averages(
      (json['avgTemperature'] as num?)?.toDouble(),
      (json['avgCO2'] as num?)?.toDouble(),
      (json['avgHumidityAir'] as num?)?.toDouble(),
      (json['avgHumidityGround'] as num?)?.toDouble(),
      (json['avgLight'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AveragesToJson(Averages instance) => <String, dynamic>{
      'avgTemperature': instance.avgTemperature,
      'avgCO2': instance.avgCO2,
      'avgHumidityAir': instance.avgHumidityAir,
      'avgHumidityGround': instance.avgHumidityGround,
      'avgLight': instance.avgLight,
    };
