part of 'email_verification_bloc.dart';

@immutable
abstract class EmailVerificationEvent {}

class EmailVerificationButtonPressed extends EmailVerificationEvent {

  final String email;
  final String code;
  final String password;
  final String confirmPassword;

  EmailVerificationButtonPressed({required this.email, required this.code, required this.password, required this.confirmPassword});

}

class OnTextChanged extends EmailVerificationEvent {}