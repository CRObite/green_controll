
import 'package:dio/dio.dart';
import 'package:green_control/domain/greenhouse/greenhouse.dart';
import 'package:green_control/domain/greenhouse_warninig/greenhouse_warning.dart';

import '../../domain/arduino/arduino.dart';
import '../../util/AppUrl.dart';

Dio dio = Dio(
    BaseOptions(
      connectTimeout: Duration(milliseconds: 3 * 1000),
      receiveTimeout: Duration(milliseconds: 60 * 1000),
    )
);


Future<List<GreenhouseWarning>> getMyGreenHouse(String accessToken) async {
  dio.options.headers['Authorization'] = 'Bearer ${accessToken}';

  final response = await dio.get(
    '${AppUrls.my_greenhouses}',
  );

  if (response.statusCode == 200) {
    print(response.data);

    List<dynamic> responseData = response.data;
    List<GreenhouseWarning> greenhouses = responseData.map((json) => GreenhouseWarning.fromJson(json)).toList();

    print(greenhouses);

    return greenhouses;
  }else{
    return [];
  }
}

Future<GreenHouse?> getGreenHouse(String accessToken, int GreenhouseId) async {
  dio.options.headers['Authorization'] = 'Bearer ${accessToken}';

  final response = await dio.get(
    '${AppUrls.greenhouse}$GreenhouseId',
  );

  if (response.statusCode == 200) {
    print(response.data);

    GreenHouse gh = GreenHouse.fromJson(response.data);

    return gh;
  }else{
    return null;
  }
}

Future<bool> deleteGreenHouse(String accessToken, int GreenhouseId) async {
  dio.options.headers['Authorization'] = 'Bearer ${accessToken}';

  final response = await dio.delete(
    '${AppUrls.greenhouse}$GreenhouseId',
  );

  if (response.statusCode == 200) {
    print(response.data);

    return true;
  }else{
    return false;
  }
}

Future<bool> crateGreenHouse(String accessToken, String name, int arduinoId) async {
  dio.options.headers['Authorization'] = 'Bearer ${accessToken}';

  final response = await dio.post(
    '${AppUrls.greenhouses}',
    data: {
      "name": name,
      "arduino":{
        "id":arduinoId
      }
    }
  );

  if (response.statusCode == 200) {
    print(response.data);

    return true;
  }else{
    return false;
  }
}

