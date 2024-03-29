import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:green_control/data/repository/auth_repository.dart';
import 'package:meta/meta.dart';

import '../../../config/custom_exeption.dart';
import '../../../config/validation.dart';

part 'email_verification_event.dart';
part 'email_verification_state.dart';

class EmailVerificationBloc extends Bloc<EmailVerificationEvent, EmailVerificationState> {
  EmailVerificationBloc() : super(EmailVerificationInitial()) {
    on<EmailVerificationButtonPressed>((event, emit) async {
      emit(EmailVerificationLoading());

      String? validation = validateRequiredFields([event.email]);

      if (validation == null) {


        print(event.code);
        try {

          final bool isChanged = await changePassword(event.email, event.code, event.password);
          print(isChanged);
          if (isChanged) {
            emit(EmailVerificationSuccess());
          }
        } catch (e) {
          print(e);
          if (e is Exception) {
            CustomException customException = CustomException.fromDioException(e);
            print(customException.message);

            emit(EmailVerificationError(errorMessage: customException.message));
          }
        }
      } else {
        emit(EmailVerificationError(errorMessage: validation));
      }
    });

    on<OnTextChanged>((event, emit) async {
      emit(EmailVerificationInitial());
    });
  }
}
