import 'package:bloc/bloc.dart';
import 'package:green_control/data/repository/arduino_repository.dart';
import 'package:green_control/domain/arduino/arduino.dart';
import 'package:meta/meta.dart';

import '../../../config/custom_exeption.dart';
import '../../../domain/current_user.dart';

part 'current_parameters_state.dart';

class CurrentParametersCubit extends Cubit<CurrentParametersState> {
  CurrentParametersCubit() : super(CurrentParametersInitial());

  Future<void> loadArduinoParameterData(int arduinoId) async {
    emit(CurrentParametersLoading());

    try {
      Arduino? arduino = await getArduinoById(CurrentUser.currentUser!.token, arduinoId);

      if (arduino != null) {
        print('sad monkey');
        emit(CurrentParametersSuccess(arduino: arduino));
        print('bad monkey');
      } else {
        emit(CurrentParametersError(errorMessage: 'No Arduino Parameters Data'));
      }
    } catch (e) {
      print(e);
      if (e is Exception) {
        CustomException customException = CustomException.fromDioException(e);
        print(customException.message);

        emit(CurrentParametersError(errorMessage: customException.message));
      }
    }
  }
}
