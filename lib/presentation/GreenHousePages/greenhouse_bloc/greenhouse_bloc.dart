import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:green_control/data/repository/greenhouse_repository.dart';
import 'package:green_control/domain/greenhouse/greenhouse.dart';
import 'package:meta/meta.dart';

import '../../../config/custom_exeption.dart';
import '../../../domain/current_user.dart';

part 'greenhouse_event.dart';
part 'greenhouse_state.dart';

class GreenhouseBloc extends Bloc<GreenhouseEvent, GreenhouseState> {

  static List<GreenHouse> ghs = [];

  GreenhouseBloc() : super(GreenhouseInitial()) {
    on<loadAllGreenhouseData>((event, emit) async {

      emit(GreenhouseLoading());

      try {

        ghs = await getMyGreenHouse(CurrentUser.currentUser!.token);

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
