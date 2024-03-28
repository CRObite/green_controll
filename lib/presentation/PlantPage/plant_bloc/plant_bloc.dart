
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:green_control/data/repository/plants_repository.dart';
import 'package:green_control/domain/current_user.dart';
import 'package:meta/meta.dart';

import '../../../config/custom_exeption.dart';
import '../../../data/repository/file_store_repository.dart';
import '../../../domain/plants/plant.dart';

part 'plant_event.dart';
part 'plant_state.dart';

class PlantBloc extends Bloc<PlantEvent, PlantState> {
  PlantBloc() : super(PlantInitial()) {
    on<loadPlantData>((event, emit) async {
      emit(PlantLoading());

      try {
        Plant? plant = await getPlantById(CurrentUser.currentUser!.token, event.plantId);

        if(plant!= null){
          if(plant.imageUrl != null){
            Uint8List? bytes = await downloadFile(CurrentUser.currentUser!.token, plant.imageUrl!);

            emit(PlantSuccess(plant, bytes));
          }else{
            emit(PlantSuccess(plant, null));
          }
        }else{
          emit(PlantError(errorMessage: 'No PlantData' ));
        }


      } catch (e) {
        print(e);
        if (e is Exception) {
          CustomException customException = CustomException.fromDioException(e);
          print(customException.message);

          emit(PlantError(errorMessage: customException.message));
        }
      }
    });
  }
}
