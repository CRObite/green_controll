import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:green_control/config/custom_exeption.dart';
import 'package:green_control/data/repository/auth_repository.dart';
import 'package:meta/meta.dart';

import '../../../config/validation.dart';

part 'email_filling_event.dart';
part 'email_filling_state.dart';

class EmailFillingBloc extends Bloc<EmailFillingEvent, EmailFillingState> {
  EmailFillingBloc() : super(EmailFillingInitial()) {
    on<EmailFillingButtonPressed>((event, emit) async {
      emit(EmailFillingLoading());

      String? validation = validateRequiredFields([event.email]);

      if (validation == null) {

        try {
          final bool isSend = await sendCode(event.email);
          if (isSend) {
            emit(EmailFillingSuccess());
          }
        } catch (e) {
          print(e);
          if (e is Exception) {
            CustomException customException = CustomException.fromDioException(e);
            print(customException.name);

            emit(EmailFillingError(errorMessage: customException.message));
          }
        }
      } else {
        emit(EmailFillingError(errorMessage: validation));
      }
    });

    on<OnTextChanged>((event, emit) async {
      emit(EmailFillingInitial());
    });
  }
}
