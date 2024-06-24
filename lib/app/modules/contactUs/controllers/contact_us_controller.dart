import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ContactUsController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();


  FocusNode nameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode messageFocus = FocusNode();
}
