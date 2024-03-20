// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Plant _$PlantFromJson(Map<String, dynamic> json) => Plant(
      json['id'] as int,
      json['name'] as String?,
      json['description'] as String?,
      json['imageUrl'] as String?,
      (json['temperature'] as num?)?.toDouble(),
      (json['humidity'] as num?)?.toDouble(),
      (json['carbonDioxide'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PlantToJson(Plant instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'temperature': instance.temperature,
      'humidity': instance.humidity,
      'carbonDioxide': instance.carbonDioxide,
    };
