part of 'adding_greenhouse_bloc.dart';

@immutable
abstract class AddingGreenhouseState {}

class AddingGreenhouseInitial extends AddingGreenhouseState {}

class AddingGreenhouseLoading extends AddingGreenhouseState {}

class AddingGreenhouseSuccess extends AddingGreenhouseState {

  final List<Plant> plants;
  final List<Arduino> arduino;

  AddingGreenhouseSuccess(this.plants, this.arduino);
}

class AddingGreenhouseCrated extends AddingGreenhouseState {}
class AddingGreenhouseEdited extends AddingGreenhouseState {}


class AddingGreenhouseError extends AddingGreenhouseState {
  final String errorMessage;

  AddingGreenhouseError({required this.errorMessage});
}

