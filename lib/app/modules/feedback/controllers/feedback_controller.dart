import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FeedbackController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController commentController = TextEditingController();


  FocusNode nameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode startDateFocus = FocusNode();
  FocusNode endDateFocus = FocusNode();
  FocusNode commentFocus = FocusNode();

}
