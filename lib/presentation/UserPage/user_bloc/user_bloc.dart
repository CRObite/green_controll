import 'dart:async';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:green_control/data/repository/auth_repository.dart';
import 'package:green_control/data/repository/file_store_repository.dart';
import 'package:green_control/domain/greenhouse/greenhouse.dart';
import 'package:green_control/domain/greenhouse_warninig/greenhouse_warning.dart';
import 'package:meta/meta.dart';

import '../../../config/custom_exeption.dart';
import '../../../config/get_image.dart';
import '../../../data/repository/greenhouse_repository.dart';
import '../../../domain/current_user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<loadUsersGreenhouseData>((event, emit) async {

      emit(UserLoading());

      try {
        List<GreenhouseWarning> greenhouseWarnings = await getMyGreenHouse(CurrentUser.currentUser!.token);
        List<GreenHouse>ghs = greenhouseWarnings.map((e) => e.greenhouse).toList();
        Uint8List? image = await downloadFile(CurrentUser.currentUser!.token, CurrentUser.currentUser!.profilePicture);
        emit(UserSuccess(ghs,image));

      } catch (e) {
        print(e);
        if (e is Exception) {
          CustomException customException = CustomException.fromDioException(e);
          print(customException.message);

          emit(UserError(errorMessage: customException.message));
        }
      }
    });


    on<setUserAvatar>((event, emit) async {

      emit(UserLoading());

      try {

        String path = await pickImagePath();

        if(path.isEmpty){
          emit(UserError(errorMessage: 'Image path not found'));
        }else{
          String imageId = await uploadFile(CurrentUser.currentUser!.token, path);
          bool imageFixed = await changeUserAvatar(CurrentUser.currentUser!.token, imageId);
          if(imageFixed){
            CurrentUser.currentUser!.profilePicture = imageId;
            add(loadUsersGreenhouseData());
          }else{
            emit(UserError(errorMessage: 'Image cant be set'));
          }
        }
      } catch (e) {
        print(e);
        if (e is Exception) {
          CustomException customException = CustomException.fromDioException(e);
          print(customException.message);

          emit(UserError(errorMessage: customException.message));
        }
      }
    });
  }
}
