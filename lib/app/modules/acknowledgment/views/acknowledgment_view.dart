import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/assets.dart';
import '../../../routes/app_pages.dart';
import '../../../theme/theme.dart';
import '../../../utils/common_appBar.dart';
import '../../../utils/common_button.dart';
import '../../../utils/common_text_view.dart';
import '../../../utils/strings.dart';
import '../controllers/acknowledgment_controller.dart';

class AcknowledgmentView extends GetView<AcknowledgmentController> {
  const AcknowledgmentView({super.key});

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
          title: Strings.acknowledgment,
          hasBackIcon: true,
          bgColor: Colors.transparent,
          isTitleCenter: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: context.height * 0.01,
              ),
              Center(
                child: Container(
                    width: context.width * 0.72,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: onPrimary,
                        boxShadow: const [
                          BoxShadow(blurRadius: 0.5, color: Colors.transparent)
                        ],
                        borderRadius: BorderRadius.circular(16)),
                    child: const CommonText.semiBold(
                      Strings.mediumDummyText,
                      size: 16,
                      color: shadow,
                      textAlign: TextAlign.center,
                    )).marginOnly(top: 8, bottom: 8),
              ),
              SizedBox(
                height: context.height * 0.02,
              ),
              GridView.builder(
                shrinkWrap: true,
                itemCount: 5,
                padding: EdgeInsets.symmetric(horizontal: context.width * 0.1),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 4,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 8),
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                          width: 24,
                          height: 24,
                          child: Checkbox(
                              value: true, onChanged: (onChanged) {})),
                      const CommonText.medium(
                        Strings.noDamage,
                        color: shadow,
                        size: 16,
                      )
                    ],
                  );
                },
              ),
              SizedBox(
                width: context.width * 0.7,
                child: CommonButton(
                  onPressed: () {
                    Get.offNamedUntil(
                      Routes.FEEDBACK,
                      ModalRoute.withName(Routes.DASHBOARD),
                    );
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
}
