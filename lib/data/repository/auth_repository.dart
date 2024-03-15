import 'package:dio/dio.dart';

Dio dio = Dio();

// Future<CustomResponse> getBalance() async {
//   try {
//     dio.options.headers['Authorization'] = 'Bearer ${CurrentUser.currentTestUser?.accessToken}';
//
//     final response = await dio.get(
//       '${AppApiUrls.getBalance}',
//     );
//
//     print(response.data);
//
//
//     return CustomResponse(200, '', wallet);
//
//   } catch (e) {
//     print(e);
//     return HandleErrorResponse.handleErrorResponse(e);
//   }
// }