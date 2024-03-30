import 'dart:typed_data';

import 'package:dio/dio.dart';

import '../../util/AppUrl.dart';

Dio dio = Dio(
    BaseOptions(
      connectTimeout: Duration(milliseconds: 3 * 1000),
      receiveTimeout: Duration(milliseconds: 60 * 1000),
    )
);


Future<Uint8List?> downloadFile(String accessToken, String? fileId) async {
  dio.options.headers['Authorization'] = 'Bearer ${accessToken}';
  if (fileId == null) {
    return null;
  }

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

Future<bool> uploadFile(String accessToken, String? filePath) async {
  dio.options.headers['Authorization'] = 'Bearer ${accessToken}';

  if(filePath != null || filePath!.isEmpty){
    return false;
  }

  FormData formData = FormData.fromMap({
    'file': await MultipartFile.fromFile(filePath, filename: 'avatar.jpg'),
  });

  final response = await dio.get(
    '${AppUrls.upload_file}',
    data: formData,
  );


  if (response.statusCode == 200) {
    print(response.data);

    return true;
  }else{
    return false;
  }
}