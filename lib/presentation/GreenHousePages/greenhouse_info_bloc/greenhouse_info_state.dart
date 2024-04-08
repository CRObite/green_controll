part of 'greenhouse_info_bloc.dart';

@immutable
abstract class GreenhouseInfoState {}

class GreenhouseInfoInitial extends GreenhouseInfoState {}

class GreenhouseInfoLoading extends GreenhouseInfoState {}

class GreenhouseInfoSuccess extends GreenhouseInfoState {

  final GreenHouse gh;

  GreenhouseInfoSuccess({required this.gh});
}


class GreenhouseInfoError extends GreenhouseInfoState {
  final String errorMessage;

  GreenhouseInfoError({required this.errorMessage});
}


class GreenhouseInfoTimer extends GreenhouseInfoState {

  final GreenHouse gh;

  GreenhouseInfoTimer({required this.gh});
}

