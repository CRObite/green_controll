part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class RegisterButtonPressed extends RegisterEvent {

  final String email;
  final String firstName;
  final String lastName;
  final String password;
  final String confirmPassword;

  RegisterButtonPressed({required this.email, required this.firstName, required this.lastName, required this.password, required this.confirmPassword});

}

class OnTextChanged extends RegisterEvent {}