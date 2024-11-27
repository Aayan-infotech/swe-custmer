import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:southwaltoncarts_customer/app/theme/theme.dart';

import '../../../network/repository/auth_repo.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/app_loader_view.dart';

class RecoveryCodeController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController otpController = TextEditingController();

  FocusNode otpFocus = FocusNode();

  var email = "";

  var isValid = true;

  @override
  void onInit() {
    email = Get.arguments["email"];
    super.onInit();
  }

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
        fontSize: 20, color: primary, fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: outline, width: 1),
      // boxShadow: [
      //   BoxShadow(
      //     color: Colors.black.withOpacity(0.1),
      //     spreadRadius: 2,
      //     blurRadius: 4,
      //     offset: const Offset(0, 3), // changes position of shadow
      //   ),
      // ],
      borderRadius: BorderRadius.circular(20),
    ),
  );

  Future<void> verifyOtp() async {
    var res = await AuthRepo().otpVerify(email, otpController.text);
    res.when(success: (value) {
      AppLoaderView.hideLoading();
      AppLoaderView.showAlertDialog(
          title: "Success",
          description: value.message.toString(),
          onPressed: () {
            Get.back();
            Get.offNamedUntil(
                Routes.CREATE_NEW_PASSWORD, ModalRoute.withName(Routes.LOGIN),
                arguments: {"email": email});
          });
    }, error: (error) {
      AppLoaderView.hideLoading();
      AppLoaderView.showErrorDialog(description: error.message);
    });
  }
}
