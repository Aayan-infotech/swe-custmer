import 'package:flutter/cupertino.dart';
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
import '../controllers/damage_reason_controller.dart';

class DamageReasonView extends GetView<DamageReasonController> {
  const DamageReasonView({super.key});
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
        appBar: const CommonAppBar(title: Strings.damageReport,
          hasBackIcon: true,
          bgColor: Colors.transparent,
          isTitleCenter: true,),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: const CommonText.extraBold(
                    Strings.cartNameCartNumber, size: 16, color: shadow,).marginOnly(top: 8),
                ),
              ),
              const Divider().marginOnly( bottom: 8),
          
              Padding(
                padding: EdgeInsets.zero,
                child: Container(
                    width: context.width*0.56,
                    height: context.width*0.56,
                    decoration: BoxDecoration(
                        color: onPrimary,
                        boxShadow: const [BoxShadow(blurRadius: 0.5,color: Colors.transparent)],
                        borderRadius: BorderRadius.circular(16)
                    ),
                    child: Image.asset(Assets.imagesDamageReport,fit: BoxFit.fill,)).marginOnly(
                    top: 8, bottom: 8),
              ),
          
              CommonTextField(
                controller: controller.tagController,
                labelText: Strings.tagNumber,
                hintText: Strings.enterTagNumber,
                mPadding: 18,
                borderColor: shadow,
                prefix: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                ),
                prefixImg: const SquareSvgImageFromAsset(Assets.svgIcNum,color: onPrimary,size: 20,),
              ).marginSymmetric(horizontal: context.width*0.1),
          
              SizedBox(height: context.height*0.01,),
              
              CommonText.bold("${Strings.deliveredOn} Tue June 20 2024",size: 16,color: error,),
              CommonText.bold("${Strings.pickupOn} Wed June 26 2024",size: 16,color: error,),
          
              SizedBox(height: context.height*0.016,),
          
              CommonText.bold("${Strings.selectTheDamageReason}",size: 20,color: shadow,),
              SizedBox(height: context.height*0.01,),
          
              ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                 return Row(
                    children: [
                      SizedBox(
                          height:24,
                          width: 24,
                          child: Checkbox.adaptive(value: true, onChanged: (onChanged){})),
                      SizedBox(width: context.width*0.02,),
                      const CommonText.medium("Reason",size: 18,color: shadow,),
                    ],
                  ).marginOnly(bottom: 8);
          
          
          
              },).marginSymmetric(horizontal: context.width*0.08),
          
          
          
              SizedBox(
                width: context.width*0.7,
                child: CommonButton(
                  onPressed: () {
                    Get.toNamed(Routes.ACKNOWLEDGMENT);
                  },
                  label: Strings.submit,
                  labelColor: onPrimary,
                  bgColor: shadow,
                  mPadding: EdgeInsets.zero,
                  textSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ).marginOnly(top: 16,bottom: 8),
          
          
            ],
          ),
        ),
      ),
    );
  }
}
