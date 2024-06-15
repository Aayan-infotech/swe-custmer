import 'dart:async';

import 'package:get/get.dart';
import 'package:southwaltoncarts_customer/app/routes/app_pages.dart';

class SplashController extends GetxController {

  Timer? timer;

  void navigateTo(){
   timer = Timer(const Duration(seconds: 3),()=>Get.toNamed(Routes.WELCOME));
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  void onClose() {
    timer?.cancel();
  }
}
