import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RecoveryCodeController extends GetxController {
  TextEditingController otpController = TextEditingController();

  FocusNode otpFocus = FocusNode();

  var isValid = true;
}
