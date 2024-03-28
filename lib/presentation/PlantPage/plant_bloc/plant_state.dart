part of 'plant_bloc.dart';

@immutable
abstract class PlantState {}

class PlantInitial extends PlantState {}

class PlantLoading extends PlantState {}

class PlantSuccess extends PlantState {

  final Plant plant;
  final Uint8List? bytes;

  PlantSuccess(this.plant, this.bytes);
}


class PlantError extends PlantState {
  final String errorMessage;

  PlantError({required this.errorMessage});
}
