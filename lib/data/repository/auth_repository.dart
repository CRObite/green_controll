import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:green_control/config/custom_exeption.dart';
import 'package:green_control/domain/user/user.dart';
import 'package:green_control/util/AppUrl.dart';

Dio dio = Dio();

Future<User?> loginUser(String email, String password) async {

  final response = await dio.post(
      '${AppApiUrls.sign_in}',
      data: {
        'email': email,
        'password': password,
      }
  );

  if (response.statusCode == 200) {
    print(response.data);
    User user = User.fromJson(response.data);
    return user;

  }else{
    return null;
  }

}

Future<void> registerUser(String firstname, String lastname,String email, String password) async {
  try {
    // dio.options.headers['Authorization'] = 'Bearer ${CurrentUser.currentTestUser?.accessToken}';

    final response = await dio.post(
        '${AppApiUrls.sign_up}',
        data: {
          "firstname":firstname,
          "lastname":lastname,
          "email":email,
          "password":password,
          "picture": null,
        }
    );

    if (response.statusCode == 200) {
      print(response.data);
    }
  } catch (e) {
    print(e);
    if (e is Exception) {
      CustomException customException = CustomException.fromDioException(e);

    }
  }
}

Future<void> sendCode(String email) async {
  try {
    // dio.options.headers['Authorization'] = 'Bearer ${CurrentUser.currentTestUser?.accessToken}';

    final response = await dio.post(
        '${AppApiUrls.get_code_to_email}$email',
    );

    if (response.statusCode == 200) {
      print(response.data);
    }
  } catch (e) {
    print(e);
    if (e is Exception) {
      CustomException customException = CustomException.fromDioException(e);
    }
  }
}

Future<void> changePassword(String email, int code,String password) async {
  try {
    // dio.options.headers['Authorization'] = 'Bearer ${CurrentUser.currentTestUser?.accessToken}';

    final response = await dio.post(
      '${AppApiUrls.reset_password_by_code}$email',
      queryParameters: {
        'code': code,
        'password': password,
      }
    );

    if (response.statusCode == 200) {
      print(response.data);
    }
  } catch (e) {
    print(e);
    if (e is Exception) {
      CustomException customException = CustomException.fromDioException(e);
    }
  }
}




void _handleCustomException(BuildContext context, CustomException exception) {
  // You can handle different types of exceptions differently
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Error'),
        content: Text(exception.message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}