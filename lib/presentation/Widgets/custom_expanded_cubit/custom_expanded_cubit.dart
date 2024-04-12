import 'package:bloc/bloc.dart';
import 'package:green_control/domain/analytic/analytic.dart';
import 'package:meta/meta.dart';

import '../../../config/custom_exeption.dart';
import '../../../data/repository/analytic_repository.dart';
import '../../../domain/current_user.dart';

part 'custom_expanded_state.dart';

class CustomExpandedCubit extends Cubit<CustomExpandedState> {
  CustomExpandedCubit() : super(CustomExpandedInitial());

  Future<void> loadAnalyticsData(int arduinoId) async {
    emit(CustomExpandedLoading());

    try {
      Analytic? stat = await getAnalyticById(CurrentUser.currentUser!.token,arduinoId);

      if(stat!= null){
        emit(CustomExpandedSuccess(analytic: stat));
      }else {
        emit(CustomExpandedError(errorMessage: 'No Statistics Data'));
      }

    } catch (e) {
      print(e);
      if (e is Exception) {
        CustomException customException = CustomException.fromDioException(e);
        print(customException.message);
        emit(CustomExpandedError(errorMessage: customException.message));
      }
    }

  }
}
