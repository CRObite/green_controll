part of 'adding_greenhouse_bloc.dart';

@immutable
abstract class AddingGreenhouseEvent {}

class loadPlantAndArduinoData extends AddingGreenhouseEvent{}

class crateButtonPressed extends AddingGreenhouseEvent{

  final Arduino? arduino;
  final Plant? plant;
  final String name;

  crateButtonPressed({required this.arduino, required this.plant, required this.name});



}
