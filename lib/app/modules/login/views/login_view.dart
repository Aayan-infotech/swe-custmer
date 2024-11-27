import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:southwaltoncarts_customer/app/routes/app_pages.dart';
import 'package:southwaltoncarts_customer/app/theme/theme.dart';
import 'package:southwaltoncarts_customer/app/utils/app_loader_view.dart';
import 'package:southwaltoncarts_customer/app/utils/common_button.dart';
import 'package:southwaltoncarts_customer/app/utils/common_images.dart';
import 'package:southwaltoncarts_customer/app/utils/common_input_text_field.dart';
import 'package:southwaltoncarts_customer/app/utils/common_text_view.dart';
import 'package:southwaltoncarts_customer/app/utils/extension.dart';
import 'package:southwaltoncarts_customer/app/utils/strings.dart';
import 'package:southwaltoncarts_customer/app/utils/validation.dart';

import '../../../gen/assets.gen.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.imagesAppBg.path), fit: BoxFit.fill)),
      child: SafeArea(
        child: GestureDetector(
          onTap: () => context.hideKeyboard(),
          child: Scaffold(
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: context.width * 0.1),
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: context.height * 0.02,
                    ),
                    CommonText.extraBold(
                      Strings.login.toUpperCase(),
                      color: onPrimary,
                      size: 28,
                    ),
                    SizedBox(
                      height: context.height * 0.2,
                    ),
                    CommonTextField(
                      controller: controller.emailController,
                      labelText: Strings.emailUserName,
                      focus: controller.emailFocus,
                      keyboardType: TextInputType.emailAddress,
                      mPadding: 18,
                      hintText: Strings.enterEmailUserName,
                      validator: (value) => Validator.validateEmail(value),
                      prefix: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                      ),
                      prefixImg: SquareSvgImageFromAsset(
                        Assets.svgIcMail.path,
                        color: shadow,
                        size: 20,
                      ),
                    ).marginOnly(bottom: context.height * 0.04),
                    Obx(() {
                      return CommonTextField(
                        controller: controller.passwordController,
                        labelText: Strings.password,
                        focus: controller.passwordFocus,
                        hintText: Strings.enterPassword,
                        keyboardType: TextInputType.visiblePassword,
                        mPadding: 18,
                        obscure: controller.hasPassVisible.value,
                        //validator: (value) => Validator.validatePassword(value),
                        prefix: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                        ),
                        prefixImg: SquareSvgImageFromAsset(
                          Assets.svgIcPassword.path,
                          color: shadow,
                          size: 20,
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: InkWell(
                            onTap: () {
                              controller.hasPassVisible.value =
                                  !controller.hasPassVisible.value;
                            },
                            child: AnimatedBuilder(
                              animation: controller.passwordFocus,
                              builder: (context, _) {
                                return controller.hasPassVisible.value
                                    ? SquareSvgImageFromAsset(
                                        Assets.svgEyeClosed.path,
                                        color: onPrimary,
                                        size: 24,
                                      )
                                    : SquareSvgImageFromAsset(
                                        Assets.svgIcEyeOpen.path,
                                        color: onPrimary,
                                        size: 24,
                                      );
                              },
                            ),
                          ),
                        ),
                      );
                    }).marginOnly(bottom: 8),
                    CommonButton(
                      onPressed: () {
                        if (controller.formKey.currentState?.validate() ??
                            false) {
                          AppLoaderView.loader();
                          controller.login();
                        }
                      },
                      label: Strings.login,
                    ).marginOnly(bottom: context.height * 0.01,top: context.height*0.03),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Assets.imagesDividerLine1
                            .image(width: context.width * 0.32),
                        const CommonText.extraBold(
                          Strings.or,
                          color: onSurfaceVariant,
                          size: 16,
                        ).paddingSymmetric(horizontal: 8),
                        Assets.imagesDividerLine2
                            .image(width: context.width * 0.32),
                      ],
                    ).marginOnly(
                      bottom: context.height * 0.02,
                    ),
                    CommonButton(
                      onPressed: () {
                        Get.toNamed(Routes.FORGOT_PASSWORD);
                      },
                      label: Strings.forgotPassword,
                      bgColor: Colors.transparent,
                      labelColor: primary,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
