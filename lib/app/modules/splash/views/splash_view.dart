import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:southwaltoncarts_customer/generated/assets.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {

    controller.navigateTo();

    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).height,
        decoration: const BoxDecoration(
          image: DecorationImage(image:AssetImage(Assets.imagesAppBg))
        ),
        child: Center(
          child: Image.asset(Assets.imagesSwcLogo),
        ),
      ),
    );
  }
}
