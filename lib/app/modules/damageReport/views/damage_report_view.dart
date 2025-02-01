import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:southwaltoncarts_customer/app/routes/app_pages.dart';
import 'package:southwaltoncarts_customer/app/utils/common_button.dart';
import 'package:southwaltoncarts_customer/app/utils/common_images.dart';
import 'package:southwaltoncarts_customer/app/utils/common_input_text_field.dart';
import 'package:southwaltoncarts_customer/app/utils/extension.dart';
import 'package:southwaltoncarts_customer/app/utils/validation.dart';

import '../../../gen/assets.gen.dart';
import '../../../theme/theme.dart';
import '../../../utils/common_appBar.dart';
import '../../../utils/common_text_view.dart';
import '../../../utils/native_phone_call.dart';
import '../../../utils/permissions.dart';
import '../../../utils/strings.dart';
import '../../../widget/widgets.dart';
import '../controllers/damage_report_controller.dart';

class DamageReportView extends GetView<DamageReportController> {
  const DamageReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                Assets.imagesTrackCartBg.path,
              ),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: const CommonAppBar(
          title: Strings.damageReport,
          hasBackIcon: true,
          bgColor: Colors.transparent,
          isTitleCenter: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: context.bottomPadding),
          child: Column(
            children: [
              _buildTopHeader(),
              const Divider().marginOnly(top: 8, bottom: 8),
              _content(context),
              _uploadBtn(context),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() {
                    return SizedBox(
                        width: 24,
                        height: 24,
                        child: Checkbox.adaptive(
                            value: controller.isNoDamageChecked.value,
                            onChanged: (onChanged) {
                              controller.isNoDamageChecked.value =
                                  !controller.isNoDamageChecked.value;
                            }));
                  }),
                  const CommonText.medium(
                    Strings.noDamage,
                    color: shadow,
                    size: 16,
                  )
                ],
              ).marginOnly(top: 8, bottom: 8),
              SizedBox(
                height: context.height * 0.1,
                width: context.width * 0.8,
                child: Center(
                  child: Obx(() {
                    if (controller.imageList.isEmpty) {
                      return const CommonText.semiBold(
                        'No images added.',
                        size: 16,
                      );
                    }

                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                            List.generate(controller.imageList.length, (index) {
                          var item = controller.imageList[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Stack(
                              children: [
                                Container(
                                  width: context.width * 0.2,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: FileImage(item),
                                      fit: BoxFit.fill,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        spreadRadius: 2,
                                        blurRadius: 4,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  child: GestureDetector(
                                    onTap: () {
                                      controller.imageList.removeAt(index);
                                      controller.update();
                                    },
                                    child: Assets.svgIcClosee.svg(
                                      height: 20,
                                      width: 20,
                                      color: primary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(
                  width: context.width * 0.8,
                  child: Form(
                    key: controller.formKey,
                    child: CommonTextField(
                      controller: controller.desController,
                      isBoxView: false,
                      borderColor: onSurface,
                      minLines: 6,
                      maxLines: 7,
                      hintText: "Enter description",
                      validator: (value)=> Validator.validateField(value, "Description can't be empty!"),
                      keyboardType: TextInputType.multiline,
                      isSuffix: true,
                    ).marginOnly(bottom: 8),
                  )),
              SizedBox(
                width: context.width * 0.7,
                child: CommonButton(
                  onPressed: () {
                    if (controller.isNoDamageChecked.value) {
                      Get.toNamed(Routes.FEEDBACK,arguments: {
                        "from":"noDamage"
                      });
                    } else if (controller.imageList.isNotEmpty && (controller.formKey.currentState?.validate()??false)) {
                      Get.toNamed(Routes.DAMAGE_REASON,arguments: {
                        "imageList":controller.imageList,
                        "des":controller.desController.text,
                      });
                    } else {
                      Get.rawSnackbar(
                          title: "Alert!",
                          message:
                              "Either upload a damage image or select 'No Damage' to proceed.");
                    }
                  },
                  label: Strings.next,
                  labelColor: onPrimary,
                  bgColor: shadow,
                  mPadding: EdgeInsets.zero,
                  textSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ).marginOnly(top: 16, bottom: 8),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           CommonText.extraBold(
            controller.tagNumber,
            size: 16,
            color: shadow,
          ),
          // GestureDetector(
          //   onTap: () {
          //     NativeCallService.makePhoneCall("+1 850-797-0284");
          //   },
          //   child: Container(
          //       padding:
          //           const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          //       decoration: BoxDecoration(
          //           color: error, borderRadius: BorderRadius.circular(4)),
          //       child: const CommonText.bold(
          //         Strings.emergencyContact,
          //         size: 12,
          //         color: onPrimary,
          //       )),
          // ),
        ],
      ).marginOnly(top: 16),
    );
  }



  Widget _content(BuildContext context) {
    return Column(
      children: [
        const CommonText.extraBold(
          Strings.damagePolicy,
          size: 18,
          color: shadow,
        ).marginOnly(top: 8, bottom: 8),
        Padding(
          padding: EdgeInsets.zero,
          child: Container(
            width: context.width * 0.8,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: onPrimary,
              boxShadow: const [
                BoxShadow(blurRadius: 0.5, color: Colors.transparent)
              ],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                const CommonText.semiBold(
                  "By clicking/checking this box, I, the lessee of the cart, acknowledge and certify that this cart does not have any new damage that has not been previously recorded. I further acknowledge and agree that if any other damage is found at the time of pickup on the last day of this cart rental, I will be responsible for paying for such damage as per the rental agreement.",
                  size: 16,
                  color: shadow,
                  textAlign: TextAlign.justify,
                ).marginOnly(bottom: 8),
                const CommonText.semiBold(
                  "OR",
                  size: 16,
                  color: shadow,
                  textAlign: TextAlign.center,
                ).marginOnly(bottom: 8),
                const CommonText.semiBold(
                  "By clicking/checking this box, I, the lessee of the cart, acknowledge and certify that this cart does have new damage that has not been previously recorded. I further certify that the pictures uploaded below were taken before this cart was driven on the first day of the rental period. The pictures and descriptions of the new damage are provided below.",
                  size: 16,
                  color: shadow,
                  textAlign: TextAlign.justify,
                ).marginOnly(bottom: 8),
              ],
            ),
          ).marginOnly(top: 8, bottom: 8),
        ),
      ],
    );
  }

  Widget _uploadBtn(BuildContext context) {
    return SizedBox(
      width: context.width * 0.7,
      child: CommonButton(
        onPressed: () async {
          var isGranted = await Permissions.checkPermissions();
          if (isGranted) {
            showPicker(
              galleryPicker: () {
                Get.back();
                controller.galleryPicker();
              },
              cameraPicker: () {
                Get.back();
                controller.cameraPicker();
              },
            );
          } else {
            openAppSettings();
          }
        },
        mPadding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CommonText.medium(
              Strings.uploadImage,
              size: 18,
              color: onPrimary,
            ),
            SizedBox(
              width: context.width * 0.02,
            ),
            SquareSvgImageFromAsset(
              Assets.svgIcArrowUp.path,
              color: onPrimary,
              size: 20,
            )
          ],
        ),
      ).marginOnly(top: 16, bottom: 8),
    );
  }
}
