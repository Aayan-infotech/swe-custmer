import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:southwaltoncarts_customer/app/network/repository/dash_repo.dart';
import 'package:southwaltoncarts_customer/app/utils/app_loader_view.dart';
import 'package:southwaltoncarts_customer/app/utils/image_pick.dart';
import 'package:southwaltoncarts_customer/app/utils/shared_prefs.dart';

class EditProfileController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  FocusNode nameFocus = FocusNode();
  FocusNode phoneNoFocus = FocusNode();
  FocusNode addressFocus = FocusNode();

  var profileImg = SharedPrefs().userImage();

  final pickedImage = Rx<File?>(null).obs;

  @override
  void onInit() {
    getProfile();
    super.onInit();
  }

  @override
  void onReady() {
    AppLoaderView.loader();
    super.onReady();
  }

  Future<void> getProfile() async {
    var res = await DashRepo().getUserProfile();

    res.when(success: (value) {
      AppLoaderView.hideLoading();
      var user = value.data;

      nameController.text = user?.fullName ?? "";
      emailController.text = user?.email ?? "";
      phoneNoController.text = user?.phoneNumber.toString() ?? "";
      addressController.text = user?.state.toString() ?? "";
      // addressController.text = user?.??"";
    }, error: (error) {
      AppLoaderView.hideLoading();
      AppLoaderView.showErrorDialog(description: error.message);
    });
  }

  Future<void> updateUserDetail() async {
    AppLoaderView.loader();
    var userId = SharedPrefs().userId();
    var fileName = "image_$userId.jpg";
    dio.MultipartFile? imageFile;
    if (pickedImage.value.value != null) {
      String filePath = pickedImage.value.value!.path;
      imageFile = await dio.MultipartFile.fromFile(filePath,
          filename: fileName,
          contentType: dio.DioMediaType("image", fileName.split(".").last));
    }

    var res = await DashRepo().updateUserDetail(
        fullName: nameController.text,
        phoneNumber: phoneNoController.text,
        address: addressController.text,
        img: imageFile);

    res.when(success: (success) {
      AppLoaderView.hideLoading();

      var user = success.data;
      SharedPrefs().putData(SharedPrefs.email, user?.email.toString() ?? "");
      SharedPrefs().putData(SharedPrefs.name, user?.fullName.toString() ?? "");
      SharedPrefs().putData(SharedPrefs.id, user?.id.toString() ?? "");
      SharedPrefs().putData(SharedPrefs.image, user?.image ?? "");

      AppLoaderView.showAlertDialog(
        title: "Success",
        description: success.message.toString(),
        onPressed: () => Get.back(),
      );
    }, error: (error) {
      AppLoaderView.hideLoading();
      AppLoaderView.showErrorDialog(description: error.message);
    });
  }

  Future<void> cameraPicker() async {
    pickedImage.value.value = await ImagePick.getImageFromCamera();
  }

  Future<void> galleryPicker() async {
    pickedImage.value.value = await ImagePick.getImageFromGallery();
  }
}
