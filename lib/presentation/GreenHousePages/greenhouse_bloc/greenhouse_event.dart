part of 'greenhouse_bloc.dart';

@immutable
abstract class GreenhouseEvent {}

class loadAllGreenhouseData extends GreenhouseEvent{}

class deleteGreenhouseData extends GreenhouseEvent{
  final int ghId;

  deleteGreenhouseData({required this.ghId});
}

class searchGreenHouses extends GreenhouseEvent{
  final String ghName;

  searchGreenHouses(this.ghName);
}
