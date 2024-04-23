// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warninig.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Warning _$WarningFromJson(Map<String, dynamic> json) => Warning(
      json['optimalTemperature'] as bool?,
      json['optimalHumidityAir'] as bool?,
      json['optimalHumidityGround'] as bool?,
      json['optimalLight'] as bool?,
      json['optimalCarbonDioxide'] as bool?,
    );

Map<String, dynamic> _$WarningToJson(Warning instance) => <String, dynamic>{
      'optimalTemperature': instance.optimalTemperature,
      'optimalHumidityAir': instance.optimalHumidityAir,
      'optimalHumidityGround': instance.optimalHumidityGround,
      'optimalLight': instance.optimalLight,
      'optimalCarbonDioxide': instance.optimalCarbonDioxide,
    };
