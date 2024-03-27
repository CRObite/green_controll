part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {

  final List<Plant> plants;
  final List<GreenHouse> ghs;

  HomeSuccess(this.plants, this.ghs);
}


class HomeError extends HomeState {
  final String errorMessage;

  HomeError({required this.errorMessage});
}
