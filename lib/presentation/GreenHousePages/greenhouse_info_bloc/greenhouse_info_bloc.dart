import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:green_control/data/repository/greenhouse_repository.dart';
import 'package:green_control/domain/current_user.dart';
import 'package:meta/meta.dart';

import '../../../config/custom_exeption.dart';
import '../../../domain/greenhouse/greenhouse.dart';

part 'greenhouse_info_event.dart';
part 'greenhouse_info_state.dart';

class GreenhouseInfoBloc extends Bloc<GreenhouseInfoEvent, GreenhouseInfoState> {
  GreenhouseInfoBloc() : super(GreenhouseInfoInitial()) {
    on<loadGreenHouseData>((event, emit) async {
      emit(GreenhouseInfoLoading());

      try {
        GreenHouse? gh = await getGreenHouse(CurrentUser.currentUser!.token, event.greenhouseId);

        if(gh!= null){
          emit(GreenhouseInfoSuccess(gh: gh));
        }else{
          emit(GreenhouseInfoError(errorMessage: 'No Greenhouse Data' ));
        }

      } catch (e) {
        print(e);
        if (e is Exception) {
          CustomException customException = CustomException.fromDioException(e);
          print(customException.message);

          emit(GreenhouseInfoError(errorMessage: customException.message));
        }
      }
    });

    on<loadByTimerGreenHouseData>((event, emit) async {

      try {
        GreenHouse? gh = await getGreenHouse(CurrentUser.currentUser!.token, event.greenhouseId);

        if(gh!= null){
          emit(GreenhouseInfoTimer(gh: gh));
        }

      } catch (e) {
        print(e);
        if (e is Exception) {
          CustomException customException = CustomException.fromDioException(e);
          print(customException.message);

          emit(GreenhouseInfoError(errorMessage: customException.message));
        }
      }
    });
  }
}
