// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'arduino.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Arduino _$ArduinoFromJson(Map<String, dynamic> json) => Arduino(
      json['id'] as int,
      (json['temperature'] as num?)?.toDouble(),
      (json['humidityAir'] as num?)?.toDouble(),
      (json['humidityGround'] as num?)?.toDouble(),
      (json['light'] as num?)?.toDouble(),
      (json['carbonDioxide'] as num?)?.toDouble(),
      json['plant'] == null
          ? null
          : Plant.fromJson(json['plant'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ArduinoToJson(Arduino instance) => <String, dynamic>{
      'id': instance.id,
      'temperature': instance.temperature,
      'humidityAir': instance.humidityAir,
      'humidityGround': instance.humidityGround,
      'light': instance.light,
      'carbonDioxide': instance.carbonDioxide,
      'plant': instance.plant,
    };
