part of 'greenhouse_bloc.dart';

@immutable
abstract class GreenhouseState {}

class GreenhouseInitial extends GreenhouseState {}

class GreenhouseLoading extends GreenhouseState {}

class GreenhouseSuccess extends GreenhouseState {

  final List<GreenHouse> plants;

  GreenhouseSuccess(this.plants);
}

class GreenhouseError extends GreenhouseState {
  final String errorMessage;

  GreenhouseError({required this.errorMessage});
}
