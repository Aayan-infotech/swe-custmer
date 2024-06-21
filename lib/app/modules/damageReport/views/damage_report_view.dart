import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:southwaltoncarts_customer/app/routes/app_pages.dart';
import 'package:southwaltoncarts_customer/app/utils/common_button.dart';
import 'package:southwaltoncarts_customer/app/utils/common_images.dart';

import '../../../../generated/assets.dart';
import '../../../theme/theme.dart';
import '../../../utils/common_appBar.dart';
import '../../../utils/common_text_view.dart';
import '../../../utils/strings.dart';
import '../controllers/damage_report_controller.dart';

class DamageReportView extends GetView<DamageReportController> {
  const DamageReportView({super.key});

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
        appBar: const CommonAppBar(title: Strings.trackRental,
          hasBackIcon: true,
          bgColor: Colors.transparent,
          isTitleCenter: true,),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CommonText.extraBold(
                    Strings.cartNumber, size: 16, color: shadow,),
                  Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                          color: error,
                          borderRadius: BorderRadius.circular(4)
                      ),
                      child: const CommonText.bold(
                        Strings.emergencyContact, size: 12, color: onPrimary,)),
                ],
              ).marginOnly(top: 16),
            ),
            const Divider().marginOnly(top: 8, bottom: 8),
            const CommonText.extraBold(
              Strings.damagePolicy, size: 18, color: shadow,).marginOnly(
                top: 8, bottom: 8),

            Padding(
              padding: EdgeInsets.zero,
              child: Container(
                width: context.width*0.8,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: onPrimary,
                      boxShadow: const [BoxShadow(blurRadius: 0.5,color: Colors.transparent)],
                      borderRadius: BorderRadius.circular(16)
                  ),
                  child: const CommonText.semiBold(
                    Strings.smallDummyText, size: 16,
                    color: shadow,
                    textAlign: TextAlign.center,)).marginOnly(
                  top: 8, bottom: 8),
            ),

            InkWell(
              splashColor: onPrimaryContainer,
              borderRadius: BorderRadius.circular(24),
              onTap: (){},
              child: Container(
                height: context.height*0.046,
                width: context.width*0.64,
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.circular(24)
                ),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CommonText.medium(Strings.uploadImage,size: 18,color: onPrimary,),
                    SizedBox(width: context.width*0.02,),
                    const SquareSvgImageFromAsset(Assets.svgIcArrowUp,color: onPrimary,size: 20,)
                  ],
                ),
              ).marginOnly(top: 16,bottom: 8),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() {
                  return SizedBox(
                      width: 24,
                      height: 24,
                      child: Checkbox.adaptive(value: controller.isChecked.value,
                          onChanged: (onChanged) {
                            controller.isChecked.value = !controller.isChecked
                                .value;
                          }));
                }),
                const CommonText.medium(
                  Strings.noDamage, color: shadow, size: 16,)
              ],
            ).marginOnly(top: 8,bottom: 8),

            SizedBox(
              width: context.width*0.7,
              child: CommonButton(
                onPressed: () {
                  Get.toNamed(Routes.DAMAGE_REASON);
                },
                label: Strings.next,
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
    );
  }
}
