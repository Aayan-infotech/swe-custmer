import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:southwaltoncarts_customer/app/routes/app_pages.dart';
import 'package:southwaltoncarts_customer/app/utils/common_images.dart';

import '../../../../generated/assets.dart';
import '../../../theme/theme.dart';
import '../../../utils/common_button.dart';
import '../../../utils/common_inputtext_field.dart';
import '../../../utils/common_text_view.dart';
import '../../../utils/strings.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return  Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).height,
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(Assets.imagesAppBg))),
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(backgroundColor: Colors.transparent,scrolledUnderElevation: 0,leading: InkWell(
                onTap: () => Get.back(),
                borderRadius: BorderRadius.circular(16),
                child: const Icon(Icons.arrow_back_ios_rounded,color: onPrimary,)),),
            body: Padding(
              padding:  EdgeInsets.symmetric(horizontal: context.width*0.12),
              child: Column(
                children: [
                  SizedBox(height: context.height*0.02,),
                  const CommonText.extraBold(Strings.forgotPassword,color: onPrimary,size: 28,),
                  SizedBox(height: context.height*0.024,),
                   SquareSvgImageFromAsset(Assets.svgIcLock,size: context.height*0.18,),
                  SizedBox(height: context.height*0.08,),
                  CommonTextField(
                    controller: controller.emailController,
                    labelText: Strings.emailUserName,
                    focus: controller.emailFocus,
                    keyboardType: TextInputType.emailAddress,
                    hintText: Strings.enterEmailUserName,
                    mPadding: 18,
                    prefix: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                    ),
                    prefixImg: const SquareSvgImageFromAsset(Assets.svgIcMail,color: shadow,size: 20,),
                  ).marginOnly(bottom: context.height*0.04),
                  SizedBox(
                      width: context.width*0.6,
                      height: context.height*0.06,
                      child: CommonButton(onPressed: (){
                        Get.toNamed(Routes.RECOVERY_CODE);
                      },label: Strings.submit,mPadding: const EdgeInsets.all(0),).marginOnly(bottom: context.height*0.01)),

                ],
              ),
            ),
          )
        ),
      );

  }
}
