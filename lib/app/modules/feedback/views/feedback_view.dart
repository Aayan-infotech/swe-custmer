import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:southwaltoncarts_customer/app/utils/common_input_text_field.dart';
import 'package:southwaltoncarts_customer/app/utils/validation.dart';

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
          child: Form(
            key: controller.formKey,
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
                  validator: (value)=> Validator.validateField(value,"Name can't be empty"),
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
                  validator: (value)=> Validator.validateEmail(value),
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
                        keyboardType: TextInputType.none,
                        isReadOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(
                                2100),
                          );
                          if (pickedDate != null) {
                            String formattedDate =
                            DateFormat('MMM d yyyy')
                                .format(pickedDate);
                            controller.startDateController.text = formattedDate;
                          }
                        },
                        mPadding: 18,
                        validator: (value)=> Validator.validateField(value,"Start date can't be empty"),
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
                        controller: controller.endDateController,
                        labelText: Strings.timePeriod,
                        hintText: Strings.endTime,
                        keyboardType: TextInputType.none,
                        isReadOnly: true,
                        validator: (value)=> Validator.validateField(value,"End date can't be empty"),
                        mPadding: 18,
                        isSuffix: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(
                                2100), // Adjust lastDate as needed
                          );
                          if (pickedDate != null) {
                            String formattedDate =
                            DateFormat('MMM d yyyy')
                                .format(pickedDate);
                            controller.endDateController.text = formattedDate;
                          }
                        },
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
                  minLines: 3,
                  maxLines: 4,
                  keyboardType: TextInputType.multiline,
                  validator: (value)=> Validator.validateField(value,"Comment can't be empty"),
                  borderColor: shadow,
                  prefix: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                  ),
                  prefixImg: const Center(child: SquareSvgImageFromAsset(Assets.svgIcMessageSend,color: onPrimary,size: 20,)),
                ).marginSymmetric(horizontal: context.width*0.1,vertical: context.height*0.05),


                CommonButton(
                  onPressed: (){
                    if(controller.formKey.currentState?.validate()??false){
                      controller.feedBack();
                    }
                  },
                  label: Strings.submit,
                  bgColor: secondary,
                  labelColor: onPrimary,
                ).marginSymmetric(horizontal: context.width*0.1),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
