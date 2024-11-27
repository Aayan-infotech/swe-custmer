import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/assets.dart';
import '../../../theme/theme.dart';
import '../../../utils/common_appBar.dart';
import '../../../utils/common_images.dart';
import '../../../utils/common_input_text_field.dart';
import '../../../utils/strings.dart';
import '../controllers/driver_detail_controller.dart';

class DriverDetailView extends GetView<DriverDetailController> {
  const DriverDetailView({super.key});

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
        appBar: const CommonAppBar(
          title: Strings.driverDetail,
          hasBackIcon: true,
          bgColor: Colors.transparent,
          isTitleCenter: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: context.height * 0.04,
              ),
              SizedBox(
                  height: context.height * 0.24,
                  width: context.width * 0.86,
                  child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: surface,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: SquareImageFromNetwork(
                        imageUrl: controller.drivingLicense.value,
                        fit: BoxFit.fill,
                      ))),
              SizedBox(
                height: context.height * 0.04,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  children: [
                    CommonTextField(
                      controller: controller.fullNameController,
                      labelText: Strings.name,
                      mPadding: 18,
                      isReadOnly: true,
                      keyboardType: TextInputType.none,
                      borderColor: shadow,
                      prefix: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                      ),
                      prefixImg: const SquareSvgImageFromAsset(
                        Assets.svgIcPerson,
                        color: onPrimary,
                        size: 20,
                      ),
                    ),
                    SizedBox(
                      height: context.height * 0.02,
                    ),
                    CommonTextField(
                      controller: controller.emailController,
                      labelText: Strings.email,
                      mPadding: 18,
                      isReadOnly: true,
                      keyboardType: TextInputType.none,
                      borderColor: shadow,
                      prefix: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                      ),
                      prefixImg: const SquareSvgImageFromAsset(
                        Assets.svgIcPerson,
                        color: onPrimary,
                        size: 20,
                      ),
                    ),
                    SizedBox(
                      height: context.height * 0.02,
                    ),
                    CommonTextField(
                      controller: controller.mobileNoController,
                      labelText: Strings.phoneNumber,
                      mPadding: 18,
                      isReadOnly: true,
                      keyboardType: TextInputType.none,
                      borderColor: shadow,
                      prefix: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                      ),
                      prefixImg: const SquareSvgImageFromAsset(
                        Assets.svgIcPerson,
                        color: onPrimary,
                        size: 20,
                      ),
                    ),
                    SizedBox(
                      height: context.height * 0.02,
                    ),
                    CommonTextField(
                      controller: controller.licenceController,
                      labelText: Strings.licenceNumber,
                      mPadding: 18,
                      isReadOnly: true,
                      keyboardType: TextInputType.none,
                      borderColor: shadow,
                      prefix: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                      ),
                      prefixImg: const SquareSvgImageFromAsset(
                        Assets.svgIcPerson,
                        color: onPrimary,
                        size: 20,
                      ),
                    ),
                    SizedBox(
                      height: context.height * 0.02,
                    ),
                    CommonTextField(
                      controller: controller.insurancePolicyController,
                      labelText: Strings.insurancePolicyNumber,
                      mPadding: 18,
                      isReadOnly: true,
                      keyboardType: TextInputType.none,
                      borderColor: shadow,
                      prefix: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                      ),
                      prefixImg: const SquareSvgImageFromAsset(
                        Assets.svgIcPerson,
                        color: onPrimary,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
