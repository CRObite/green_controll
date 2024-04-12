// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Analytic _$AnalyticFromJson(Map<String, dynamic> json) => Analytic(
      (json['averagesPerDay'] as List<dynamic>)
          .map((e) => AveragesPerDay.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AnalyticToJson(Analytic instance) => <String, dynamic>{
      'averagesPerDay': instance.averagesPerDay,
    };
