import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:southwaltoncarts_customer/app/utils/common_input_text_field.dart';

import '../../../../generated/assets.dart';
import '../../../routes/app_pages.dart';
import '../../../theme/theme.dart';
import '../../../utils/common_appBar.dart';
import '../../../utils/common_button.dart';
import '../../../utils/common_images.dart';
import '../../../utils/common_text_view.dart';
import '../../../utils/strings.dart';
import '../controllers/feedback_controller.dart';

class FeedbackView extends GetView<FeedbackController> {
  const FeedbackView({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                Assets.imagesTrackCartBg,
              ),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: const CommonAppBar(title: Strings.feedbackRequest,
          hasBackIcon: true,
          bgColor: Colors.transparent,
          isTitleCenter: true,),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: context.height*0.04,),

              CommonTextField(
                  controller: controller.nameController,
                labelText: Strings.name,
                hintText: Strings.enterName,
                focus: controller.nameFocus,
                mPadding: 18,
                borderColor: shadow,
                prefix: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                ),
                prefixImg: const SquareSvgImageFromAsset(Assets.svgIcPerson,color: onPrimary,size: 20,),
              ).marginSymmetric(horizontal: context.width*0.1),

              CommonTextField(
                controller: controller.emailController,
                labelText: Strings.email,
                hintText: Strings.enterEmail,
                focus: controller.emailFocus,
                mPadding: 18,
                borderColor: shadow,
                prefix: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                ),
                prefixImg: const SquareSvgImageFromAsset(Assets.svgIcMail,color: onPrimary,size: 20,),
              ).marginSymmetric(horizontal: context.width*0.1,vertical: context.height*0.05),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: context.width*0.4,
                    child: CommonTextField(
                      controller: controller.startDateController,
                      labelText: Strings.timePeriod,
                      hintText: Strings.startTime,
                      focus: controller.startDateFocus,
                      mPadding: 18,
                      isSuffix: true,
                      borderColor: shadow,
                      prefix: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                      ),
                      suffix: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                      ),
                      suffixIcon: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: SquareSvgImageFromAsset(Assets.svgIcDate,color: secondary,),
                      ),
                    ),
                  ),
                  SizedBox(width: context.width*0.06,),
                  SizedBox(
                    width: context.width*0.4,
                    child: CommonTextField(
                      controller: controller.startDateController,
                      labelText: Strings.timePeriod,
                      hintText: Strings.startTime,
                      focus: controller.startDateFocus,
                      mPadding: 18,
                      isSuffix: true,
                      borderColor: shadow,
                      prefix: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                      ),
                      suffix: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                      ),
                      suffixIcon: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: SquareSvgImageFromAsset(Assets.svgIcDate,color: secondary,),
                      ),
                    ),
                  )
                ],
              ),

              CommonTextField(
                controller: controller.commentController,
                labelText: Strings.comments,
                hintText: Strings.enterDetailedComments,
                focus: controller.commentFocus,
                mPadding: 18,
                borderColor: shadow,
                prefix: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                ),
                prefixImg: const SquareSvgImageFromAsset(Assets.svgIcMessageSend,color: onPrimary,size: 20,),
              ).marginSymmetric(horizontal: context.width*0.1,vertical: context.height*0.05),


              CommonButton(
                onPressed: (){
                  Get.back();
                },
                label: Strings.submit,
                bgColor: secondary,
                labelColor: onPrimary,
              ).marginSymmetric(horizontal: context.width*0.1),

            ],
          ),
        ),
      ),
    );
  }
}
