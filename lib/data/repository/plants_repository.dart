import 'package:dio/dio.dart';
import 'package:green_control/domain/plants/plant.dart';
import 'package:green_control/util/AppUrl.dart';

Dio dio = Dio(
    BaseOptions(
      connectTimeout: Duration(milliseconds: 3 * 1000),
      receiveTimeout: Duration(milliseconds: 60 * 1000),
    )
);


Future<List<Plant>> getPlants(String accessToken) async {
  dio.options.headers['Authorization'] = 'Bearer ${accessToken}';

  final response = await dio.get(
      '${AppUrls.plants}',
      queryParameters: {
        "size": 25,
      }
  );

  if (response.statusCode == 200) {
    print(response.data);


    List<dynamic> responseData = response.data['items'];
    List<Plant> plants = responseData.map((json) => Plant.fromJson(json)).toList();

    print(plants);

    return plants;
  }else{
    return [];
  }
}

Future<Plant?> getPlantById(String accessToken,int plantId) async {
  dio.options.headers['Authorization'] = 'Bearer ${accessToken}';

  final response = await dio.get(
    '${AppUrls.plants}/$plantId',
  );

  if (response.statusCode == 200) {
    print(response.data);


    Plant plant = Plant.fromJson(response.data);

    print(plant);

    return plant;
  }else{
    return null;
  }
}