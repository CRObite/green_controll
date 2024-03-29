// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'greenhouse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GreenHouse _$GreenHouseFromJson(Map<String, dynamic> json) => GreenHouse(
      json['id'] as int,
      json['name'] as String?,
      json['owner'] == null
          ? null
          : User.fromJson(json['owner'] as Map<String, dynamic>),
      json['arduino'] == null
          ? null
          : Arduino.fromJson(json['arduino'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GreenHouseToJson(GreenHouse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'owner': instance.owner,
      'arduino': instance.arduino,
    };
