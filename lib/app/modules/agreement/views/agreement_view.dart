import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:southwaltoncarts_customer/app/utils/common_images.dart';

import '../../../../generated/assets.dart';
import '../../../theme/theme.dart';
import '../../../utils/common_appBar.dart';
import '../../../utils/common_text_view.dart';
import '../../../utils/strings.dart';
import '../controllers/agreement_controller.dart';

class AgreementView extends GetView<AgreementController> {
  const AgreementView({super.key});
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
        appBar: const CommonAppBar(title: Strings.agreement,
          hasBackIcon: true,
          bgColor: Colors.transparent,
          isTitleCenter: true,),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: context.width*0.4,
                        child: const CommonText.bold(Strings.dummyText,size: 16,color: secondary,)),
                        const CommonText.bold("Date:- 12/04/2024",size: 16,color: secondary,),
                  ],
                ).marginOnly(top: 16),
              ),
              const Divider().marginOnly(top: 8),
              SizedBox(height: context.height*0.01,),
              const CommonText.extraBold(Strings.rentalAgreement,size: 20,color: secondary,),
              SizedBox(height: context.height*0.01,),
              Center(
                child: Container(
                    width: context.width*0.72,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: onPrimary,
                        boxShadow: const [BoxShadow(blurRadius: 0.5,color: Colors.transparent)],
                        borderRadius: BorderRadius.circular(16)
                    ),
                    child: const CommonText.semiBold(
                      Strings.dummyRentalAgreement, size: 16,
                      color: shadow,
                      textAlign: TextAlign.center,)).marginOnly(
                    top: 8, bottom: 8),
              ),

              SizedBox(height: context.height*0.02,),
              
              Container(
                  width: context.width*0.5,
                  height: context.height*0.1,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(blurRadius: 0.05)],
                    border: Border(
                        top: BorderSide(color: Colors.black,width: 1),
                        bottom: BorderSide(color: Colors.black,width: 1),
                        left: BorderSide(color: Colors.black,width: 1),
                        right: BorderSide(color: Colors.black,width: 1),
                    )
                  ),
                  child: const SquareImageFromAsset(Assets.imagesSignature,fit: BoxFit.fill,))



            ],
          ),
        ),
      ),
    );
  }
}
