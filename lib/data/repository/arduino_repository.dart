
import 'package:dio/dio.dart';
import 'package:green_control/domain/arduino/arduino.dart';

import '../../util/AppUrl.dart';

Dio dio = Dio(
    BaseOptions(
      connectTimeout: Duration(milliseconds: 3 * 1000),
      receiveTimeout: Duration(milliseconds: 60 * 1000),
    )
);


Future<List<Arduino>> getAllArduino(String accessToken) async {
  dio.options.headers['Authorization'] = 'Bearer ${accessToken}';

  final response = await dio.get(
    '${AppUrls.arduino}',
  );

  if (response.statusCode == 200) {
    print(response.data);

    List<dynamic> responseData = response.data['items'];
    List<Arduino> arduinos = responseData.map((json) => Arduino.fromJson(json)).toList();

    print(arduinos);

    return arduinos;
  }else{
    return [];
  }
}

Future<Arduino?> getArduinoById(String accessToken, int id) async {
  dio.options.headers['Authorization'] = 'Bearer ${accessToken}';

  final response = await dio.get(
    '${AppUrls.arduino}/$id',
  );

  if (response.statusCode == 200) {
    print(response.data);

   Arduino arduino = Arduino.fromJson(response.data);

    print(arduino);

    return arduino;
  }else{
    return null;
  }
}

Future<bool> setPlantToArduino(String accessToken, int arduinoId, int plantId) async {
  dio.options.headers['Authorization'] = 'Bearer ${accessToken}';

  final response = await dio.put(
    '${AppUrls.arduino}',
    data: {
      "id": arduinoId,
      "plant": {
        "id": plantId
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

