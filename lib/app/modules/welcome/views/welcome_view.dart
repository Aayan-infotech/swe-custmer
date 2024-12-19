import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:southwaltoncarts_customer/app/routes/app_pages.dart';
import 'package:southwaltoncarts_customer/app/theme/theme.dart';
import 'package:southwaltoncarts_customer/app/utils/common_button.dart';
import 'package:southwaltoncarts_customer/app/utils/common_text_view.dart';
import 'package:southwaltoncarts_customer/app/utils/extension.dart';
import 'package:southwaltoncarts_customer/app/utils/strings.dart';

import '../../../../generated/assets.dart';
import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.imagesWelcomeBg), fit: BoxFit.fill)),
      child: SafeArea(
        child: GestureDetector(
          onTap: () => context.hideKeyboard(),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Column(
              children: [
                SizedBox(height: context.height * 0.06),
                SizedBox(
                    height: context.height * 0.2,
                    child:
                        Image.asset(Assets.imagesSwcLogo, fit: BoxFit.contain)),
                SizedBox(height: context.height * 0.08),
                CommonText.extraBold(Strings.yourJourneyOurCars,
                    size: context.width * 0.06),
                CommonText.regular(Strings.rentEffortlesslyRoleAnyWhere,
                    size: context.width * 0.036),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CommonText.extraBold(
                        Strings.welcome.toUpperCase(),
                        size: context.width * 0.08,
                        color: onPrimary,
                      ),
                      SizedBox(
                        height: context.height * 0.03,
                      ),
                      CommonButton(
                        onPressed: () {
                          Get.toNamed(Routes.LOGIN);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CommonText.bold(
                              Strings.getStarted,
                              size: context.width * 0.03,
                              color: secondary,
                              textAlign: TextAlign.center,
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: secondary,
                              size: context.width * 0.036,
                            ).marginSymmetric(horizontal: 4)
                          ],
                        ),
                      ).marginSymmetric(horizontal: context.width * 0.1)
                    ],
                  ).marginOnly(bottom: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
