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

class editButtonPressed extends AddingGreenhouseEvent{

  final int greenhouseId;
  final Arduino? arduino;
  final Plant? plant;
  final String name;

  editButtonPressed({required this.greenhouseId, required this.arduino, required this.plant, required this.name});


}



