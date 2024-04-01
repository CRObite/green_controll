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

  print(fileId);

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

Future<String> uploadFile(String accessToken, String? filePath) async {
  dio.options.headers['Authorization'] = 'Bearer ${accessToken}';

  print(filePath);
  if(filePath == null || filePath.isEmpty){
    return '';
  }

  String fileName = filePath.split('/').last;

  FormData formData = FormData.fromMap({
    'file': await MultipartFile.fromFile(filePath, filename: fileName),
  });

  print(formData);

  final response = await dio.post(
    '${AppUrls.upload_file}',
    data: formData,
  );


  if (response.statusCode == 200) {
    print(response.data);
    String imageId = response.data['id'];
    return imageId;
  }else{
    return '';
  }
}