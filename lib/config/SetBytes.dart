import 'dart:typed_data';

import '../data/repository/file_store_repository.dart';
import '../domain/current_user.dart';

class SetBytes{
  static final Map<String, Uint8List> _imageCache = {};

  static Future<Uint8List?> setBytes(String id) async {

    if (_imageCache.containsKey(id)) {
      return _imageCache[id];
    } else {
      Uint8List? bytes = await downloadFile(CurrentUser.currentUser!.token, id);
      if (bytes != null) {
        _imageCache[id] = bytes;
      }
      return bytes;
    }
  }


  static void clearImages(){
    _imageCache.clear();
  }
}