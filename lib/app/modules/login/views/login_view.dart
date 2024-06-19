import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:southwaltoncarts_customer/app/routes/app_pages.dart';
import 'package:southwaltoncarts_customer/app/theme/theme.dart';
import 'package:southwaltoncarts_customer/app/utils/common_button.dart';
import 'package:southwaltoncarts_customer/app/utils/common_images.dart';
import 'package:southwaltoncarts_customer/app/utils/common_input_text_field.dart';
import 'package:southwaltoncarts_customer/app/utils/common_text_view.dart';
import 'package:southwaltoncarts_customer/app/utils/strings.dart';

import '../../../../generated/assets.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(Assets.imagesAppBg))),
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: context.width * 0.1),
            child: Column(
              children: [
                SizedBox(height: context.height * 0.02,),
                CommonText.extraBold(
                  Strings.login.toUpperCase(), color: onPrimary, size: 28,),
                SizedBox(height: context.height * 0.2,),
                CommonTextField(
                  controller: controller.emailController,
                  labelText: Strings.emailUserName,
                  focus: controller.emailFocus,
                  keyboardType: TextInputType.emailAddress,
                  mPadding: 18,
                  hintText: Strings.enterEmailUserName,
                  prefix: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                  ),
                  prefixImg: const SquareSvgImageFromAsset(
                    Assets.svgIcMail, color: shadow, size: 20,),
                ).marginOnly(bottom: context.height * 0.04),
                CommonTextField(
                  controller: controller.passwordController,
                  labelText: Strings.password,
                  focus: controller.passwordFocus,
                  hintText: Strings.enterPassword,
                  keyboardType: TextInputType.visiblePassword,
                  mPadding: 18,
                  prefix: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                  ),
                  prefixImg: const SquareSvgImageFromAsset(
                    Assets.svgIcPassword, color: shadow, size: 20,),
                  suffixIcon: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: SquareSvgImageFromAsset(
                      Assets.svgEyeClosed, color: onPrimary, size: 24,),
                  ),
                ).marginOnly(bottom: 8),
                Obx(() {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                          height: 24,
                          width: 24,
                          child: Checkbox(value: controller.isChecked.value,
                              onChanged: (onChanged) {
                                controller.isChecked.value !=
                                    controller.isChecked.value;
                              })),
                      InkWell(
                          onTap : (){
                            controller.isChecked.value =! controller.isChecked.value;
                          },
                          child: const CommonText.semiBold(Strings.rememberMe))
                    ],
                  );
                }).marginOnly(bottom: context.height * 0.024),
                CommonButton(onPressed: () {
                  Get.toNamed(Routes.DASHBOARD);
                }, label: Strings.login,).marginOnly(
                    bottom: context.height * 0.01),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Assets.imagesDividerLine1, width: context.width * 0.32,),
                    const CommonText.extraBold(
                      Strings.or, color: onSurfaceVariant, size: 16,)
                        .paddingSymmetric(horizontal: 8),
                    Image.asset(
                        Assets.imagesDividerLine2, width: context.width * 0.32),
                  ],
                ).marginOnly(bottom: context.height * 0.02,),
                CommonButton(onPressed: () {
                  Get.toNamed(Routes.FORGOT_PASSWORD);
                },
                  label: Strings.forgotPassword,
                  bgColor: Colors.transparent,
                  labelColor: primary,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
