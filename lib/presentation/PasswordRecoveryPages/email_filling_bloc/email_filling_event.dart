part of 'email_filling_bloc.dart';

@immutable
abstract class EmailFillingEvent {}

class EmailFillingButtonPressed extends EmailFillingEvent {

  final String email;

  EmailFillingButtonPressed({required this.email});

}

class OnTextChanged extends EmailFillingEvent {}