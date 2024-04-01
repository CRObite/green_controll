import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:green_control/config/custom_exeption.dart';
import 'package:green_control/domain/user/user.dart';
import 'package:green_control/util/AppUrl.dart';

Dio dio = Dio(
    BaseOptions(
      connectTimeout: Duration(milliseconds: 3 * 1000),
      receiveTimeout: Duration(milliseconds: 60 * 1000),
    )
);


Future<User?> loginUser(String email, String password) async {

  final response = await dio.post(
      '${AppUrls.sign_in}',
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

Future<bool> registerUser(String firstname, String lastname,String email, String password) async {
  final response = await dio.post(
      '${AppUrls.sign_up}',
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
    return true;
  }else{
    return false;
  }
}

Future<bool> sendCode(String email) async {
  final response = await dio.get(
    '${AppUrls.get_code_to_email}$email',
  );
  if (response.statusCode == 200) {
    print(response.data);
    return true;
  } else {
    return false;
  }
}


Future<bool> changePassword(String email, String code,String password) async {
  final response = await dio.post(
      '${AppUrls.reset_password_by_code}$email',
      queryParameters: {
        'code': code,
        'password': password,
      }
  );

  if (response.statusCode == 200) {
    print(response.data);
    return true;
  }else{
    return false;
  }
}

Future<bool> changeUserAvatar(String accessToken, String imageId) async {

  dio.options.headers['Authorization'] = 'Bearer ${accessToken}';
  print(imageId);

  final response = await dio.put(
      '${AppUrls.update_profile_image}',
      data: imageId
  );

  if (response.statusCode == 200) {
    print(response.data);
    return true;
  }else{
    return false;
  }
}
