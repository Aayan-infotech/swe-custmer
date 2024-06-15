import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:southwaltoncarts_customer/app/routes/app_pages.dart';
import 'package:southwaltoncarts_customer/app/theme/theme.dart';
import 'package:southwaltoncarts_customer/app/utils/common_button.dart';
import 'package:southwaltoncarts_customer/app/utils/common_text_view.dart';
import 'package:southwaltoncarts_customer/app/utils/strings.dart';

import '../../../../generated/assets.dart';
import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).height,
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(Assets.imagesWelcomeBg))),
        child: SafeArea(
          child: Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: context.height * 0.01,
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    SizedBox(
                        height: context.height * 0.2,
                        child: Image.asset(Assets.imagesSwcLogo)),
                    const CommonText.extraBold(Strings.yourJourneyOurCars, size: 24)
                        .marginOnly(top: context.height * 0.06),
                    const CommonText.regular(Strings.rentEffortlesslyRoleAnyWhere,
                            size: 16)
                        .marginOnly(top: 8),
                  ],
                ),
                SizedBox(
                  height: context.height * 0.1,
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    CommonText.extraBold(
                      Strings.welcome.toUpperCase(),
                      size: 38,
                      color: onPrimary,
                    ),
                    SizedBox(
                      height: context.height * 0.1,
                    ),
                    CommonButton(
                      onPressed: () {
                        Get.toNamed(Routes.LOGIN);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CommonText.bold(
                            Strings.getStarted,
                            size: 14,
                            color: secondary,
                            textAlign: TextAlign.center,
                          ),
                          const Icon(
                            Icons.arrow_forward,
                            color: secondary,
                            size: 16,
                          ).marginSymmetric(horizontal: 4)
                        ],
                      ),
                    ).marginSymmetric(horizontal: context.width * 0.1)
                  ],
                ).marginOnly(bottom: 16)
              ],
            ),
          ),
        ),
      );

  }
}
