part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class loadUsersGreenhouseData extends UserEvent{}

class setUserAvatar extends UserEvent{}

class loadAnalytic extends UserEvent{
  final int arduinoId;

  loadAnalytic({required this.arduinoId});
}