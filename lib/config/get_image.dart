import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';

Future<Uint8List?> pickImageBytes() async {

  final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    Uint8List? bytes = await pickedFile.readAsBytes();
    return bytes;
  }else{
    return null;
  }

}


Future<String> pickImagePath() async {

  final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    return pickedFile.path;
  }else{
    return '';
  }
}
