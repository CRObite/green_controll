part of 'custom_expanded_cubit.dart';

@immutable
abstract class CustomExpandedState {}

class CustomExpandedInitial extends CustomExpandedState {}

class CustomExpandedLoading extends CustomExpandedState {}

class CustomExpandedError extends CustomExpandedState {
  final String errorMessage;

  CustomExpandedError({required this.errorMessage});
}

class CustomExpandedSuccess extends CustomExpandedState {
  final Analytic analytic;

  CustomExpandedSuccess({required this.analytic});
}