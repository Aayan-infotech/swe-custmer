import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:southwaltoncarts_customer/app/routes/app_pages.dart';
import 'package:southwaltoncarts_customer/app/utils/app_loader_view.dart';
import 'package:southwaltoncarts_customer/app/utils/common_images.dart';
import 'package:southwaltoncarts_customer/app/utils/extension.dart';
import 'package:southwaltoncarts_customer/app/utils/validation.dart';

import '../../../../generated/assets.dart';
import '../../../theme/theme.dart';
import '../../../utils/common_button.dart';
import '../../../utils/common_input_text_field.dart';
import '../../../utils/common_text_view.dart';
import '../../../utils/strings.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return  Container(
        height: context.height,
        width: context.width,
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(Assets.imagesAppBg),fit: BoxFit.fill)),
        child: SafeArea(
          child: GestureDetector(
            onTap: ()=>context.hideKeyboard(),
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(backgroundColor: Colors.transparent,scrolledUnderElevation: 0,leading: InkWell(
                  onTap: () => Get.back(),
                  borderRadius: BorderRadius.circular(16),
                  child: const Icon(Icons.arrow_back_ios_rounded,color: onPrimary,)),),
              body: Padding(
                padding:  EdgeInsets.symmetric(horizontal: context.width*0.12),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      SizedBox(height: context.height*0.02,),
                      const CommonText.extraBold(Strings.forgotPassword,color: surface,size: 28,),
                      SizedBox(height: context.height*0.024,),
                       SquareSvgImageFromAsset(Assets.svgIcLock,size: context.height*0.18,color: surface,),
                      SizedBox(height: context.height*0.08,),
                      CommonTextField(
                        controller: controller.emailController,
                        labelText: Strings.emailUserName,
                        focus: controller.emailFocus,
                        keyboardType: TextInputType.emailAddress,
                        hintText: Strings.enterEmailUserName,
                        validator: (value)=>Validator.validateEmail(value),
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
                            if(controller.formKey.currentState?.validate()??false){
                              AppLoaderView.loader();
                              controller.sendEmail();
                            }
                          },label: Strings.submit,mPadding: const EdgeInsets.all(0),).marginOnly(bottom: context.height*0.01)),

                    ],
                  ),
                ),
              ),
            ),
          )
        ),
      );

  }
}
