import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  FocusNode nameFocus = FocusNode();
  FocusNode phoneNoFocus = FocusNode();
  FocusNode addressFocus = FocusNode();



}
