// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'averages_per_day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AveragesPerDay _$AveragesPerDayFromJson(Map<String, dynamic> json) =>
    AveragesPerDay(
      json['date'] as String?,
      json['averages'] == null
          ? null
          : Averages.fromJson(json['averages'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AveragesPerDayToJson(AveragesPerDay instance) =>
    <String, dynamic>{
      'date': instance.date,
      'averages': instance.averages,
    };
