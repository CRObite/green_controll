import 'package:dio/dio.dart';

Dio dio = Dio();

// Future<User?> getAllPlants() async {
//   try {
//     dio.options.headers['Authorization'] = 'Bearer ${CurrentUser.currentTestUser?.accessToken}';
//
//     final response = await dio.post(
//         '${AppUrls.sign_in}',
//         data: {
//           'email': email,
//           'password': password,
//         }
//     );
//
//     if (response.statusCode == 200) {
//       print(response.data);
//       return response.data;
//     }else{
//       return null;
//     }
//   } catch (e) {
//     print(e);
//     if (e is Exception) {
//       CustomException customException = CustomException.fromDioException(e);
//     }
//     return null;
//   }
// }