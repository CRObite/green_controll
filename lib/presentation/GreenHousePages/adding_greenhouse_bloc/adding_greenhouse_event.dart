part of 'adding_greenhouse_bloc.dart';

@immutable
abstract class AddingGreenhouseEvent {}

class loadPlantAndArduinoData extends AddingGreenhouseEvent{}

class crateButtonPressed extends AddingGreenhouseEvent{

  final int arduinoId;
  final int plantId;
  final String name;

  crateButtonPressed(this.arduinoId, this.plantId, this.name);

}
