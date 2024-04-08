// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'greenhouse_warning.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GreenhouseWarning _$GreenhouseWarningFromJson(Map<String, dynamic> json) =>
    GreenhouseWarning(
      GreenHouse.fromJson(json['greenhouse'] as Map<String, dynamic>),
      Warning.fromJson(json['warning'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GreenhouseWarningToJson(GreenhouseWarning instance) =>
    <String, dynamic>{
      'greenhouse': instance.greenhouse,
      'warning': instance.warning,
    };
