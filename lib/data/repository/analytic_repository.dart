import 'package:dio/dio.dart';
import 'package:green_control/domain/analytic/analytic.dart';
import '../../util/AppUrl.dart';

Dio dio = Dio(
    BaseOptions(
      connectTimeout: Duration(milliseconds: 3 * 1000),
      receiveTimeout: Duration(milliseconds: 60 * 1000),
    )
);


Future<Analytic?> getAnalyticById(String accessToken,int arduinoId) async {
  dio.options.headers['Authorization'] = 'Bearer ${accessToken}';

  final response = await dio.get(
    '${AppUrls.logger_arduino_id}$arduinoId${AppUrls.weekly_averages}',
  );

  if (response.statusCode == 200) {
    print(response.data);

    Analytic analytic = Analytic.fromJson(response.data);

    print(analytic);

    return analytic;
  } else {
    return null;
  }
}