part of 'current_parameters_cubit.dart';

@immutable
abstract class CurrentParametersState {}

class CurrentParametersInitial extends CurrentParametersState {}

class CurrentParametersLoading extends CurrentParametersState {}

class CurrentParametersError extends CurrentParametersState {
  final String errorMessage;

  CurrentParametersError({required this.errorMessage});
}

class CurrentParametersSuccess extends CurrentParametersState {
    final Arduino arduino;

  CurrentParametersSuccess({required this.arduino});
}