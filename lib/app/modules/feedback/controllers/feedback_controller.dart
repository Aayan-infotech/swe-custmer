import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:southwaltoncarts_customer/app/network/repository/dash_repo.dart';
import 'package:southwaltoncarts_customer/app/utils/app_loader_view.dart';
import 'package:southwaltoncarts_customer/app/utils/shared_prefs.dart';

class FeedbackController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController =
      TextEditingController(text: SharedPrefs().userName());
  TextEditingController emailController =
      TextEditingController(text: SharedPrefs().userEmail());
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  FocusNode nameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode startDateFocus = FocusNode();
  FocusNode endDateFocus = FocusNode();
  FocusNode commentFocus = FocusNode();

  var from = "";

  @override
  void onInit() {
    from = Get.arguments["from"];
    super.onInit();
  }

  Future<void> feedBack() async {
    AppLoaderView.loader();

    var res = await DashRepo().feedbackReq(
        email: emailController.text,
        name: nameController.text,
        startDate: startDateController.text,
        endDate: endDateController.text,
        comment: commentController.text);

    res.when(success: (value) {
      AppLoaderView.hideLoading();
      AppLoaderView.showAlertDialog(
          title: "Success",
          description: value.message.toString(),
          onPressed: () {
            Get.back();
            if (from == "damage") {
              Get.back();
            } else {
              Get.back();
              Get.back();
            }
          });
    }, error: (error) {
      AppLoaderView.hideLoading();
      AppLoaderView.showErrorDialog(description: error.message.toString());
    });
  }
}
