import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../network/repository/auth_repo.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/app_loader_view.dart';

class ForgotPasswordController extends GetxController {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  FocusNode emailFocus = FocusNode();

  Future<void> sendEmail() async {
    var res =
    await AuthRepo().sendEmail(emailController.text);
    res.when(success: (value) {
      AppLoaderView.hideLoading();
      AppLoaderView.showAlertDialog(
          title: "Success",
          description: value.message.toString(),
          onPressed: () {
            Get.back();
            Get.toNamed(Routes.RECOVERY_CODE,arguments: {
              "email":emailController.text
            });
          });
    }, error: (error) {
      AppLoaderView.hideLoading();
      AppLoaderView.showErrorDialog(description: error.message);
    });
  }

}
