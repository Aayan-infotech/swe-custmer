import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:southwaltoncarts_customer/app/theme/theme.dart';
import 'package:southwaltoncarts_customer/app/utils/common_appBar.dart';
import 'package:southwaltoncarts_customer/app/utils/common_button.dart';
import 'package:southwaltoncarts_customer/generated/assets.dart';

import '../../../utils/common_images.dart';
import '../../../utils/common_input_text_field.dart';
import '../../../utils/strings.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: const CommonAppBar(hasBackIcon: true, bgColor:Colors.transparent,title: '',),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left:context.width*0.1,right: context.width*0.1),
        child: Column(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  maxRadius: context.height*0.06,
                  minRadius: context.height*0.06,
                  backgroundColor: onPrimary,
                  child: SquareSvgImageFromAsset(Assets.svgUser,size: context.height*0.064,color: primary,),
                ),
                Positioned(
                    top: context.height*0.072,
                    left: context.width*0.168,
                    child: SquareSvgImageFromAsset(Assets.svgIcEdit,size: 32,color: primary,))
              ],
            ),
            SizedBox(height: context.height*0.04,),

            CommonTextField(
              controller: controller.nameController,
              labelText: Strings.name,
              focus: controller.nameFocus,
              textColor: onPrimary,
              keyboardType: TextInputType.text,
              mPadding: 18,
              prefix: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
              ),
              prefixImg: const SquareSvgImageFromAsset(
                Assets.svgIcPerson, color: shadow, size: 20,),
              suffixIcon: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: SquareSvgImageFromAsset(
                  Assets.svgIcEdit, color: onPrimary, size: 24,),
              ),
            ).marginOnly(bottom: 16),

            CommonTextField(
              controller: controller.emailController,
              labelText: Strings.email,
              textColor: onPrimary,
              keyboardType: TextInputType.emailAddress,
              mPadding: 18,
              isReadOnly: true,
              prefix: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
              ),
              prefixImg: const SquareSvgImageFromAsset(
                Assets.svgIcMail, color: shadow, size: 20,),
              suffixIcon: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: SquareSvgImageFromAsset(
                  Assets.svgIcEdit, color: onPrimary, size: 24,),
              ),
            ).marginOnly(bottom: 16),

            CommonTextField(
              controller: controller.phoneNoController,
              labelText: Strings.phoneNumber,
              textColor: onPrimary,
              focus: controller.phoneNoFocus,
              keyboardType: const TextInputType.numberWithOptions(decimal: false,signed: true),
              mPadding: 18,
              prefix: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
              ),
              prefixImg: const SquareSvgImageFromAsset(
                Assets.svgIcCall, color: shadow, size: 20,),
              suffixIcon: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: SquareSvgImageFromAsset(
                  Assets.svgIcEdit, color: onPrimary, size: 24,),
              ),
            ).marginOnly(bottom: 16),

            CommonTextField(
              controller: controller.addressController,
              labelText: Strings.address,
              textColor: onPrimary,
              focus: controller.addressFocus,
              keyboardType:  TextInputType.text,
              mPadding: 18,
              prefix: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
              ),
              prefixImg: const SquareSvgImageFromAsset(
                Assets.svgIcCall, color: shadow, size: 20,),
              suffixIcon: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: SquareSvgImageFromAsset(
                  Assets.svgIcMarker, color: onPrimary, size: 24,),
              ),
            ).marginOnly(bottom: 24),
            
            SizedBox(
                width: context.width*0.6,
                height: context.height*0.058,
                child: CommonButton(
                  onPressed: (){},
                  label: Strings.save,
                  bgColor: onPrimary,
                  labelColor: shadow,
                  textSize: 16,))

          ],
        ),
      ),
    );
  }
}
