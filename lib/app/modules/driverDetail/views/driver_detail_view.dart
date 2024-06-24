import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:southwaltoncarts_customer/app/utils/common_button.dart';

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
          title: Strings.trackRental,
          hasBackIcon: true,
          bgColor: Colors.transparent,
          isTitleCenter: true,
        ),
        body:SingleChildScrollView(
          child: Column(
            children: [

              SizedBox(height: context.height*0.04,),
              SizedBox(
                  height: context.height*0.24,
                  child: Image.asset(Assets.imagesDl,fit: BoxFit.fill,)),

              SizedBox(height: context.height*0.04,),

              Padding(padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                children: [
                  CommonTextField(
                    controller: controller.firstNameController,
                    labelText: Strings.firstName,
                    mPadding: 18,
                    borderColor: shadow,
                    prefix: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                    ),
                    prefixImg: const SquareSvgImageFromAsset(Assets.svgIcPerson,color: onPrimary,size: 20,),
                  ),

                  SizedBox(height: context.height*0.02,),

                  CommonTextField(
                    controller: controller.lastNameController,
                    labelText: Strings.lastName,
                    mPadding: 18,
                    borderColor: shadow,
                    prefix: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                    ),
                    prefixImg: const SquareSvgImageFromAsset(Assets.svgIcPerson,color: onPrimary,size: 20,),
                  ),

                  SizedBox(height: context.height*0.02,),

                  CommonTextField(
                    controller: controller.licenceController,
                    labelText: Strings.licenceNumber,
                    mPadding: 18,
                    borderColor: shadow,
                    prefix: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                    ),
                    prefixImg: const SquareSvgImageFromAsset(Assets.svgIcPerson,color: onPrimary,size: 20,),
                  ),

                  SizedBox(height: context.height*0.02,),

                  CommonTextField(
                    controller: controller.insurancePolicyController,
                    labelText: Strings.insurancePolicyNumber,
                    mPadding: 18,
                    borderColor: shadow,
                    prefix: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                    ),
                    prefixImg: const SquareSvgImageFromAsset(Assets.svgIcPerson,color: onPrimary,size: 20,),
                  ),


                ],

              ),)



            ],
          ),
        ),
      ),
    );
  }
}
