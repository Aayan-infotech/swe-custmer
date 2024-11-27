import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../network/repository/auth_repo.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/app_loader_view.dart';

class CreateNewPasswordController extends GetxController {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  FocusNode newPasswordFocus = FocusNode();
  FocusNode confirmPasswordFocus = FocusNode();

  var hasPassVisible = false.obs;
  var hasConfirmPassVisible = false.obs;

  var email = "";

  @override
  void onInit() {
    email = Get.arguments["email"];
    super.onInit();
  }


  Future<void> resetPassword() async {
    var res = await AuthRepo().resetPassword(email, newPasswordController.text);
    res.when(success: (value) {
      AppLoaderView.hideLoading();
      AppLoaderView.showAlertDialog(
          title: "Success",
          description: value.message.toString(),
          onPressed: () {
            Get.back();
            Get.back();
          });
    }, error: (error) {
      AppLoaderView.hideLoading();
      AppLoaderView.showErrorDialog(description: error.message);
    });
  }


}
