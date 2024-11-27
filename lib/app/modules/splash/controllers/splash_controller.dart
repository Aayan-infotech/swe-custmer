import 'dart:async';

import 'package:get/get.dart';
import 'package:southwaltoncarts_customer/app/routes/app_pages.dart';
import 'package:southwaltoncarts_customer/app/utils/shared_prefs.dart';

import '../../../gen/assets.gen.dart';

class SplashController extends GetxController {
  var img = Assets.imagesAppBg.path;

  @override
  void onInit() {
    navigateTo();
    super.onInit();
  }

  void navigateTo() async {
    await Future.delayed(const Duration(seconds: 2));
    if (SharedPrefs().token().isNotEmpty) {
      Get.offAllNamed(Routes.DASHBOARD);
    } else {
      Get.offAllNamed(Routes.WELCOME);
    }
  }
}
