import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:green_control/config/custom_exeption.dart';
import 'package:green_control/data/repository/auth_repository.dart';
import 'package:meta/meta.dart';

import '../../../config/validation.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterButtonPressed>((event, emit) async {
      emit(RegisterLoading());

      String? validation = validateRequiredFields([event.email,event.password, event.lastName, event.firstName, event.confirmPassword]);
      if (validation == null && event.password == event.confirmPassword) {
        try {
          final bool isRegistered = await registerUser(event.firstName,event.lastName,event.email,event.password);
          if (isRegistered) {
            emit(RegisterSuccess());
          }
        } catch (e) {
          print(e);
          if (e is Exception) {
            CustomException customException = CustomException.fromDioException(e);
            print(customException.message);

            emit(RegisterError(errorMessage: customException.message));
          }
        }
      } else if(validation == null && event.password != event.confirmPassword){
        emit(RegisterError(errorMessage: 'Password not same'));
      }else if(validation != null){
        emit(RegisterError(errorMessage: validation));
      }
    });

    on<OnTextChanged>((event, emit) async {
      emit(RegisterInitial());
    });
  }
}
