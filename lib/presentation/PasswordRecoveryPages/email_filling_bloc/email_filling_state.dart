part of 'email_filling_bloc.dart';

@immutable
abstract class EmailFillingState {}

class EmailFillingInitial extends EmailFillingState {}

class EmailFillingLoading extends EmailFillingState {}

class EmailFillingSuccess extends EmailFillingState {}


class EmailFillingError extends EmailFillingState {
  final String errorMessage;

  EmailFillingError({required this.errorMessage});
}
