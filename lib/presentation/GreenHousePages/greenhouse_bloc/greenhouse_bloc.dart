import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:green_control/data/repository/greenhouse_repository.dart';
import 'package:green_control/domain/greenhouse/greenhouse.dart';
import 'package:meta/meta.dart';

import '../../../config/custom_exeption.dart';
import '../../../domain/current_user.dart';
import '../../../domain/greenhouse_warninig/greenhouse_warning.dart';

part 'greenhouse_event.dart';
part 'greenhouse_state.dart';

class GreenhouseBloc extends Bloc<GreenhouseEvent, GreenhouseState> {

  static List<GreenHouse> ghs = [];

  GreenhouseBloc() : super(GreenhouseInitial()) {
    on<loadAllGreenhouseData>((event, emit) async {

      emit(GreenhouseLoading());

      try {

        List<GreenhouseWarning> greenhouseWarnings = await getMyGreenHouse(CurrentUser.currentUser!.token);
        ghs = greenhouseWarnings.map((e) => e.greenhouse).toList();

        emit(GreenhouseSuccess(ghs));

      } catch (e) {
        print(e);
        if (e is Exception) {
          CustomException customException = CustomException.fromDioException(e);
          print(customException.message);

          emit(GreenhouseError(errorMessage: customException.message));
        }
      }
    });


    on<searchGreenHouses>((event, emit) async {

      List<GreenHouse> filteredGreenhouses = ghs.where((greenhouse) => greenhouse.name!.contains(event.ghName)).toList();

      emit(GreenhouseSuccess(filteredGreenhouses));

    });

    on<deleteGreenhouseData>((event, emit) async {
      emit(GreenhouseLoading()); 

      try {
        bool isDeleted = await deleteGreenHouse(CurrentUser.currentUser!.token, event.ghId);

        if(isDeleted){
          ghs.removeWhere((greenhouse) => greenhouse.id == event.ghId);
          emit(GreenhouseSuccess(ghs));
        }else{

        }

      } catch (e) {
        if (e is Exception) {
          CustomException customException = CustomException.fromDioException(e);
          emit(GreenhouseError(errorMessage: customException.message));
        }
      }
    });
  }
}
