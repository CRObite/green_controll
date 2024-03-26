import 'dart:typed_data';

import 'package:dio/dio.dart';

import '../../util/AppUrl.dart';

Dio dio = Dio(
    BaseOptions(
      connectTimeout: Duration(milliseconds: 3 * 1000),
      receiveTimeout: Duration(milliseconds: 60 * 1000),
    )
);


Future<Uint8List?> downloadFile(String accessToken, String fileId) async {
  dio.options.headers['Authorization'] = 'Bearer ${accessToken}';

  final response = await dio.get(
    '${AppUrls.download_file}$fileId',
    options: Options(responseType: ResponseType.bytes),
  );

  if (response.statusCode == 200) {
    print(response.data);

    Uint8List bytes = Uint8List.fromList(response.data);

    return bytes;
  }else{
    return null;
  }
}