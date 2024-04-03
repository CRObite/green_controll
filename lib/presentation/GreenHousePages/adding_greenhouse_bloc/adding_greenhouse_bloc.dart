import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:green_control/data/repository/arduino_repository.dart';
import 'package:green_control/data/repository/greenhouse_repository.dart';
import 'package:green_control/data/repository/plants_repository.dart';
import 'package:green_control/domain/arduino/arduino.dart';
import 'package:meta/meta.dart';

import '../../../config/custom_exeption.dart';
import '../../../domain/current_user.dart';
import '../../../domain/plants/plant.dart';

part 'adding_greenhouse_event.dart';
part 'adding_greenhouse_state.dart';

class AddingGreenhouseBloc extends Bloc<AddingGreenhouseEvent, AddingGreenhouseState> {
  AddingGreenhouseBloc() : super(AddingGreenhouseInitial()) {


    on<AddingGreenhouseEvent>((event, emit) async {
      emit(AddingGreenhouseLoading());

      try {
        List<Plant> plant = await getPlants(CurrentUser.currentUser!.token);

        List<Arduino> arduinos = await getAllArduino(CurrentUser.currentUser!.token);

        emit(AddingGreenhouseSuccess(plant, arduinos));

      } catch (e) {
        print(e);
        if (e is Exception) {
          CustomException customException = CustomException.fromDioException(e);
          print(customException.message);

          emit(AddingGreenhouseError(errorMessage: customException.message));
        }
      }
    });


    on<crateButtonPressed>((event, emit) async {
      emit(AddingGreenhouseLoading());

      try {

        if(event.arduino != null && event.plant!= null && event.name.isNotEmpty){
          bool plantSet = await  setPlantToArduino(CurrentUser.currentUser!.token, event.arduino!.id, event.plant!.id);
          if(plantSet){

            bool greenHouseWasCrated = await crateGreenHouse(CurrentUser.currentUser!.token, event.name, event.arduino!.id);

            if(greenHouseWasCrated){
              emit(AddingGreenhouseCrated());
            }else{
              print('Greenhouse Wasnt Created');
            }

          }else{
            print('Arduino Wasnt Set');
          }
        } else{
          emit(AddingGreenhouseError(errorMessage: 'Fill and select all fields'));
        }


      } catch (e) {
        print(e);
        if (e is Exception) {
          CustomException customException = CustomException.fromDioException(e);
          print(customException.message);

          emit(AddingGreenhouseError(errorMessage: customException.message));
        }
      }

    });
  }
}
