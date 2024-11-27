import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:southwaltoncarts_customer/app/theme/theme.dart';
import 'package:southwaltoncarts_customer/app/utils/common_appBar.dart';
import 'package:southwaltoncarts_customer/app/utils/common_button.dart';
import 'package:southwaltoncarts_customer/generated/assets.dart';

import '../../../utils/common_images.dart';
import '../../../utils/common_input_text_field.dart';
import '../../../utils/permissions.dart';
import '../../../utils/strings.dart';
import '../../../widget/widgets.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: primary,
        appBar: const CommonAppBar(
          hasBackIcon: true,
          bgColor: Colors.transparent,
          title: '',
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
              left: context.width * 0.1, right: context.width * 0.1),
          child: Column(
            children: [
              GestureDetector(
                onTap: () async {
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
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: context.width * 0.32,
                      height: context.height * 0.2,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: controller.pickedImage.value.value == null
                                ? NetworkImage(controller.profileImg)
                                : FileImage(controller.pickedImage.value.value!)
                                    as ImageProvider,
                          )),
                    ),
                    Positioned(
                      right: context.width * 0.01,
                      bottom: 20,
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: FloatingActionButton.small(
                          backgroundColor: surface,
                          elevation: 0,
                          heroTag: null,
                          focusElevation: 0.0,
                          highlightElevation: 0.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100)),
                          child: const SquareSvgImageFromAsset(
                            Assets.svgIcEdit,
                            size: 24,
                            color: primary,
                          ),
                          onPressed: () async {
                            var isGranted =
                                await Permissions.checkPermissions();
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
                        ).paddingAll(8),
                      ),
                      // child: const SquareSvgImageFromAsset(
                      //   Assets.svgIcEdit,
                      //   size: 32,
                      //   color: surface,
                      // )
                    )
                  ],
                ),
              ),
              SizedBox(
                height: context.height * 0.04,
              ),
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
                  Assets.svgIcPerson,
                  color: shadow,
                  size: 20,
                ),
                suffixIcon: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: SquareSvgImageFromAsset(
                    Assets.svgIcEdit,
                    color: onPrimary,
                    size: 24,
                  ),
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
                  Assets.svgIcMail,
                  color: shadow,
                  size: 20,
                ),
                suffixIcon: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: SquareSvgImageFromAsset(
                    Assets.svgIcEdit,
                    color: onPrimary,
                    size: 24,
                  ),
                ),
              ).marginOnly(bottom: 16),
              CommonTextField(
                controller: controller.phoneNoController,
                labelText: Strings.phoneNumber,
                textColor: onPrimary,
                focus: controller.phoneNoFocus,
                keyboardType: const TextInputType.numberWithOptions(
                    decimal: false, signed: true),
                mPadding: 18,
                prefix: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                ),
                prefixImg: const SquareSvgImageFromAsset(
                  Assets.svgIcCall,
                  color: shadow,
                  size: 20,
                ),
                suffixIcon: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: SquareSvgImageFromAsset(
                    Assets.svgIcEdit,
                    color: onPrimary,
                    size: 24,
                  ),
                ),
              ).marginOnly(bottom: 16),
              CommonTextField(
                controller: controller.addressController,
                labelText: Strings.address,
                textColor: onPrimary,
                focus: controller.addressFocus,
                keyboardType: TextInputType.text,
                mPadding: 18,
                prefix: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                ),
                prefixImg: const SquareSvgImageFromAsset(
                  Assets.svgIcCall,
                  color: shadow,
                  size: 20,
                ),
                suffixIcon: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: SquareSvgImageFromAsset(
                    Assets.svgIcMarker,
                    color: onPrimary,
                    size: 24,
                  ),
                ),
              ).marginOnly(bottom: 24),
              SizedBox(
                  width: context.width * 0.6,
                  height: context.height * 0.058,
                  child: CommonButton(
                    onPressed: () {
                      controller.updateUserDetail();
                    },
                    label: Strings.save,
                    bgColor: onPrimary,
                    labelColor: shadow,
                    textSize: 16,
                  ))
            ],
          ),
        ),
      );
    });
  }


}
