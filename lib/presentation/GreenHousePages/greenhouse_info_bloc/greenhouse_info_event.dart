part of 'greenhouse_info_bloc.dart';

@immutable
abstract class GreenhouseInfoEvent {}

class loadGreenHouseData extends GreenhouseInfoEvent{
  final int greenhouseId;

  loadGreenHouseData(this.greenhouseId);
}

class loadByTimerGreenHouseData extends GreenhouseInfoEvent{
  final int greenhouseId;

  loadByTimerGreenHouseData(this.greenhouseId);
}