part of 'email_verification_bloc.dart';

@immutable
abstract class EmailVerificationState {}

class EmailVerificationInitial extends EmailVerificationState {}

class EmailVerificationLoading extends EmailVerificationState {}

class EmailVerificationSuccess extends EmailVerificationState {}


class EmailVerificationError extends EmailVerificationState {
  final String errorMessage;

  EmailVerificationError({required this.errorMessage});
}
