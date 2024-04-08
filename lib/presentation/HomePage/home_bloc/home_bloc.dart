import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:green_control/data/repository/plants_repository.dart';
import 'package:green_control/domain/current_user.dart';
import 'package:green_control/domain/greenhouse/greenhouse.dart';
import 'package:meta/meta.dart';

import '../../../config/custom_exeption.dart';
import '../../../data/repository/greenhouse_repository.dart';
import '../../../domain/greenhouse_warninig/greenhouse_warning.dart';
import '../../../domain/plants/plant.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<loadAllData>((event, emit) async {

      emit(HomeLoading());

      try {
        final plants = await getPlants(CurrentUser.currentUser!.token);

        List<GreenhouseWarning> greenhouseWarnings = await getMyGreenHouse(CurrentUser.currentUser!.token);

        List<GreenHouse> filteredList = filterGreenHouses(greenhouseWarnings);

        emit(HomeSuccess(plants, filteredList));

      } catch (e) {
        print(e);
        if (e is Exception) {
          CustomException customException = CustomException.fromDioException(e);
          print(customException.message);

          emit(HomeError(errorMessage: customException.message));
        }
      }

    });
  }

  List<GreenHouse> filterGreenHouses(List<GreenhouseWarning> greenhouseWarnings) {
    List<GreenHouse> filteredGreenHouses = [];

    for (var greenhouseWarning in greenhouseWarnings) {
      if (!greenhouseWarning.warning.optimalTemperature ||
          !greenhouseWarning.warning.optimalHumidity ||
          !greenhouseWarning.warning.optimalLight ||
          !greenhouseWarning.warning.optimalCarbonDioxide) {
        filteredGreenHouses.add(greenhouseWarning.greenhouse);
      }
    }

    return filteredGreenHouses;
  }

}
