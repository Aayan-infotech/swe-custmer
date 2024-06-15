import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

import '../../../../generated/assets.dart';
import '../../../routes/app_pages.dart';
import '../../../theme/theme.dart';
import '../../../utils/common_button.dart';
import '../../../utils/common_images.dart';
import '../../../utils/common_text_view.dart';
import '../../../utils/strings.dart';
import '../controllers/recovery_code_controller.dart';

class RecoveryCodeView extends GetView<RecoveryCodeController> {
  const RecoveryCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).height,
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(Assets.imagesAppBg))),
      child: SafeArea(
          child: Scaffold(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: context.height * 0.022,
              ),
              const CommonText.extraBold(
                Strings.recoveryCode,
                color: onPrimary,
                size: 28,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: context.height * 0.04,
              ),
              SquareSvgImageFromAsset(
                Assets.svgIcMessageSend,
                size: context.height * 0.14,
              ),
              SizedBox(
                height: context.height * 0.014,
              ),
              const CommonText.medium(
                Strings.weHaveSent4DigitRecoveryCodeToYourEmail,
                color: onPrimary,
                size: 16,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: context.height * 0.06,
              ),
              const CommonText.semiBold(
                Strings.kindlyFillTheCodeInTheBox,
                color: onPrimary,
                size: 18,
                textAlign: TextAlign.center,
              ),
              PinCodeTextField(
                controller: controller.otpController,
                hasError: false,
                pinBoxRadius: 12,
                defaultBorderColor: Colors.white,
                pinBoxColor: Colors.transparent,
                pinBoxWidth: 44,
                pinBoxHeight: 44,
                pinBoxOuterPadding: const EdgeInsets.all(16),
                focusNode: controller.otpFocus,
              ).marginOnly(bottom: 16),

              SizedBox(
                  width: context.width * 0.6,
                  height: context.height * 0.06,
                  child: CommonButton(
                    onPressed: () {
                      Get.offNamedUntil(Routes.CREATE_NEW_PASSWORD, ModalRoute.withName(Routes.LOGIN),
                      );
                    },
                    label: Strings.submit,
                    mPadding: const EdgeInsets.all(0),
                  ).marginOnly(bottom: context.height * 0.01)),
            ],
          ),
        ),
      )),
    );
  }
}
