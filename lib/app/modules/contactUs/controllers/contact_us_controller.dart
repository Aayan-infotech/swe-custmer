import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:southwaltoncarts_customer/app/network/repository/dash_repo.dart';
import 'package:southwaltoncarts_customer/app/utils/app_loader_view.dart';
import 'package:southwaltoncarts_customer/app/utils/extension.dart';
import 'package:southwaltoncarts_customer/app/utils/shared_prefs.dart';

class ContactUsController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController =
      TextEditingController(text: SharedPrefs().userName());
  TextEditingController emailController =
      TextEditingController(text: SharedPrefs().userEmail());
  TextEditingController messageController = TextEditingController();

  FocusNode nameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode messageFocus = FocusNode();

  Future<void> contactUs() async {
    var res = await DashRepo().contactUs(
        fullName: nameController.text,
        email: emailController.text,
        msg: messageController.text);

    res.when(success: (value) {
      AppLoaderView.hideLoading();
      messageController.clear();
      Get.context!.hideKeyboard();
      AppLoaderView.showAlertDialog(
          title: "Success",
          description: value.message.toString(),
          onPressed: () {
            Get.back();
          });
    }, error: (error) {
      AppLoaderView.hideLoading();
      AppLoaderView.showErrorDialog(description: error.message);
    });
  }
}
