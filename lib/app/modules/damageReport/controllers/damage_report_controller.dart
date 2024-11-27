import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../utils/image_pick.dart';

class DamageReportController extends GetxController {

  TextEditingController desController = TextEditingController();

  var isNoDamageChecked = false.obs;
  final pickedImage = Rx<File?>(null).obs;

  var imageList = RxList<File>();


  Future<void> cameraPicker() async {
    pickedImage.value.value = await ImagePick.getImageFromCamera();

    if(pickedImage.value.value!=null){
      isNoDamageChecked.value = false;
      imageList.add(pickedImage.value.value!);
    }

  }

  Future<void> galleryPicker() async {
    pickedImage.value.value = await ImagePick.getImageFromGallery();
    if(pickedImage.value.value!=null){
      isNoDamageChecked.value = false;
      imageList.add(pickedImage.value.value!);
    }
  }

}
