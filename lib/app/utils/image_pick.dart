import 'dart:io';

import 'package:image_picker/image_picker.dart';

import 'logger_utils.dart';

class ImagePick {
  static Future<File?> getImageFromGallery() async {
    final picker = ImagePicker();

    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  //Image Picker function to get image from camera
  static Future<File?> getImageFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    Alert.logger("runtimeType.toString()", "PICKER IMAGE => $pickedFile");
    if (pickedFile != null) {
      Alert.logger("runtimeType.toString()",
          "PICKER IMAGE FILE PATH => ${pickedFile.path}");
      return File(pickedFile.path);
    }
    return null;
  }
}
