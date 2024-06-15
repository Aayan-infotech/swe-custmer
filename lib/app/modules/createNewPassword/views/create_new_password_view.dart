import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../generated/assets.dart';
import '../../../theme/theme.dart';
import '../../../utils/common_button.dart';
import '../../../utils/common_images.dart';
import '../../../utils/common_inputtext_field.dart';
import '../../../utils/common_text_view.dart';
import '../../../utils/strings.dart';
import '../controllers/create_new_password_controller.dart';

class CreateNewPasswordView extends GetView<CreateNewPasswordController> {
  const CreateNewPasswordView({super.key});
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: context.height*0.02,),
                  const CommonText.extraBold(Strings.createNewPassword,color: onPrimary,size: 24,),
                  SizedBox(height: context.height*0.14,),
                  CommonTextField(
                    controller: controller.newPasswordController,
                    labelText: Strings.newPassword,
                    focus: controller.newPasswordFocus,
                    hintText: Strings.enterYourNewPassword,
                    keyboardType: TextInputType.visiblePassword,
                    mPadding: 18,
                    prefix: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                    ),
                    prefixImg: const SquareSvgImageFromAsset(Assets.svgIcPassword,color: shadow,size: 20,),
                    suffixIcon: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child:  SquareSvgImageFromAsset(Assets.svgEyeClosed,color: onPrimary,size: 20,),
                    ),
                  ).marginOnly(bottom: context.height*0.04),
                  CommonTextField(
                    controller: controller.confirmPasswordController,
                    labelText: Strings.confirmNewPassword,
                    focus: controller.newPasswordFocus,
                    hintText: Strings.enterConfirmNewPassword,
                    keyboardType: TextInputType.visiblePassword,
                    mPadding: 18,
                    prefix: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                    ),
                    prefixImg: const SquareSvgImageFromAsset(Assets.svgIcPassword,color: shadow,size: 20,),
                    suffixIcon: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child:  SquareSvgImageFromAsset(Assets.svgEyeClosed,color: onPrimary,size: 20,),
                    ),
                  ).marginOnly(bottom: context.height*0.04),
                  SizedBox(
                      width: context.width*0.6,
                      height: context.height*0.06,
                      child: CommonButton(onPressed: (){
                       Get.back();
                      },label: Strings.submit,mPadding: const EdgeInsets.all(0),).marginOnly(bottom: context.height*0.01)),

                ],
              ),
            ),
          )
      ),
    );
  }
}
