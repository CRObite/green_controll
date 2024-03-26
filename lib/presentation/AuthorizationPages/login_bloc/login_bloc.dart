import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_control/config/validation.dart';
import 'package:green_control/domain/current_user.dart';
import 'package:meta/meta.dart';

import '../../../config/custom_exeption.dart';
import '../../../data/repository/auth_repository.dart';
import '../../../domain/user/user.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());

      String? validation = validateRequiredFields([event.email,event.password]);
      if (validation == null) {
        try {
          final user = await loginUser(event.email, event.password);
          if (user != null) {
            CurrentUser.currentUser = user;
            emit(LoginSuccess(user: user));
          }
        } catch (e) {
          print(e);
          if (e is Exception) {
            CustomException customException = CustomException.fromDioException(e);
            print(customException.message);

            emit(LoginError(errorMessage: customException.message));
          }
        }
      } else {
        emit(LoginError(errorMessage: validation));
      }
    });

    on<OnTextChanged>((event, emit) async {
      emit(LoginInitial());
    });
  }
}
