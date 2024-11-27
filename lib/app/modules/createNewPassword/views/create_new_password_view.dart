import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:southwaltoncarts_customer/app/utils/app_loader_view.dart';
import 'package:southwaltoncarts_customer/app/utils/extension.dart';
import 'package:southwaltoncarts_customer/app/utils/validation.dart';

import '../../../gen/assets.gen.dart';
import '../../../theme/theme.dart';
import '../../../utils/common_button.dart';
import '../../../utils/common_images.dart';
import '../../../utils/common_input_text_field.dart';
import '../../../utils/common_text_view.dart';
import '../../../utils/strings.dart';
import '../controllers/create_new_password_controller.dart';

class CreateNewPasswordView extends GetView<CreateNewPasswordController> {
  const CreateNewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).height,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(Assets.imagesAppBg.path))),
      child: SafeArea(
          child: GestureDetector(
        onTap: () => context.hideKeyboard(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            scrolledUnderElevation: 0,
            leading: InkWell(
                onTap: () => Get.back(),
                borderRadius: BorderRadius.circular(16),
                child: const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: onPrimary,
                )),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * 0.12),
            child: Obx(() {
              return Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: context.height * 0.02,
                    ),
                    const CommonText.extraBold(
                      Strings.createNewPassword,
                      color: onPrimary,
                      size: 24,
                    ),
                    SizedBox(
                      height: context.height * 0.14,
                    ),
                    CommonTextField(
                      controller: controller.newPasswordController,
                      labelText: Strings.newPassword,
                      focus: controller.newPasswordFocus,
                      hintText: Strings.enterYourNewPassword,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) => Validator.validatePassword(value),
                      mPadding: 18,
                      obscure: controller.hasPassVisible.value,
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
                            animation: controller.newPasswordFocus,
                            builder: (context, child) {
                              return controller.hasPassVisible.value
                                  ? SquareSvgImageFromAsset(
                                      Assets.svgEyeClosed.path,
                                      color: onPrimary,
                                      size: 20,
                                    )
                                  : SquareSvgImageFromAsset(
                                      Assets.svgIcEyeOpen.path,
                                      color: onPrimary,
                                      size: 20,
                                    );
                            },
                          ),
                        ),
                      ),
                    ).marginOnly(bottom: context.height * 0.04),
                    CommonTextField(
                      controller: controller.confirmPasswordController,
                      labelText: Strings.confirmNewPassword,
                      focus: controller.confirmPasswordFocus,
                      hintText: Strings.enterConfirmNewPassword,
                      keyboardType: TextInputType.visiblePassword,
                      obscure: controller.hasConfirmPassVisible.value,
                      validator: (value) => Validator.validateConfirmPassword(
                          value, controller.newPasswordController.text),
                      mPadding: 18,
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
                            controller.hasConfirmPassVisible.value =
                                !controller.hasConfirmPassVisible.value;
                          },
                          child: AnimatedBuilder(
                            animation: controller.confirmPasswordFocus,
                            builder: (context, child) {
                              return controller.hasConfirmPassVisible.value
                                  ? SquareSvgImageFromAsset(
                                      Assets.svgEyeClosed.path,
                                      color: onPrimary,
                                      size: 20,
                                    )
                                  : SquareSvgImageFromAsset(
                                      Assets.svgIcEyeOpen.path,
                                      color: onPrimary,
                                      size: 20,
                                    );
                            },
                          ),
                        ),
                      ),
                    ).marginOnly(bottom: context.height * 0.04),
                    SizedBox(
                        width: context.width * 0.6,
                        height: context.height * 0.06,
                        child: CommonButton(
                          onPressed: () {
                            if (controller.formKey.currentState?.validate() ??
                                false) {
                              AppLoaderView.loader();
                              controller.resetPassword();
                            }
                          },
                          label: Strings.submit,
                          mPadding: const EdgeInsets.all(0),
                        ).marginOnly(bottom: context.height * 0.01)),
                  ],
                ),
              );
            }),
          ),
        ),
      )),
    );
  }
}
