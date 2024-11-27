import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:southwaltoncarts_customer/app/network/repository/auth_repo.dart';
import 'package:southwaltoncarts_customer/app/routes/app_pages.dart';
import 'package:southwaltoncarts_customer/app/utils/app_loader_view.dart';

import '../../../utils/shared_prefs.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  var hasPassVisible = false.obs;

  Future<void> login() async {
    var res =
        await AuthRepo().login(emailController.text, passwordController.text);
    res.when(success: (value) {
      AppLoaderView.hideLoading();
      var user = value.data;
      SharedPrefs().putData(SharedPrefs.email, user?.email.toString() ?? "");
      SharedPrefs().putData(SharedPrefs.name, user?.fullName.toString() ?? "");
      SharedPrefs().putData(SharedPrefs.id, user?.id.toString() ?? "");
      SharedPrefs().putData(SharedPrefs.userToken, value.token ?? "");
      SharedPrefs().putData(SharedPrefs.image, user?.image ?? "");

      AppLoaderView.showAlertDialog(
          title: "Success",
          description: value.message.toString(),
          onPressed: () {
            Get.back();
            Get.offAllNamed(Routes.DASHBOARD);
          });
    }, error: (error) {
      AppLoaderView.hideLoading();
      AppLoaderView.showErrorDialog(description: error.message);
    });
  }
}
