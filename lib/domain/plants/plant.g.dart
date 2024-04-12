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
      (json['minimumTemperature'] as num?)?.toDouble(),
      (json['maximumTemperature'] as num?)?.toDouble(),
      (json['minimumHumidityAir'] as num?)?.toDouble(),
      (json['maximumHumidityAir'] as num?)?.toDouble(),
      (json['minimumHumidityGround'] as num?)?.toDouble(),
      (json['maximumHumidityGround'] as num?)?.toDouble(),
      (json['minimumLight'] as num?)?.toDouble(),
      (json['maximumLight'] as num?)?.toDouble(),
      (json['minimumCarbonDioxide'] as num?)?.toDouble(),
      (json['maximumCarbonDioxide'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PlantToJson(Plant instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'minimumTemperature': instance.minimumTemperature,
      'maximumTemperature': instance.maximumTemperature,
      'minimumHumidityAir': instance.minimumHumidityAir,
      'maximumHumidityAir': instance.maximumHumidityAir,
      'minimumHumidityGround': instance.minimumHumidityGround,
      'maximumHumidityGround': instance.maximumHumidityGround,
      'minimumLight': instance.minimumLight,
      'maximumLight': instance.maximumLight,
      'minimumCarbonDioxide': instance.minimumCarbonDioxide,
      'maximumCarbonDioxide': instance.maximumCarbonDioxide,
    };
