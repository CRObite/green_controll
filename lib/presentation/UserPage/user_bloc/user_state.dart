part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {

  final List<GreenHouse> ghs;
  final  Uint8List? image;
  UserSuccess(this.ghs, this.image);
}

class UserAvatarLoaded extends UserState {

  final  Uint8List? image;

  UserAvatarLoaded(this.image);

}


class UserError extends UserState {
  final String errorMessage;

  UserError({required this.errorMessage});
}
