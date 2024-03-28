part of 'plant_bloc.dart';

@immutable
abstract class PlantEvent {}

class loadPlantData extends PlantEvent{
  final int plantId;

  loadPlantData(this.plantId);
}