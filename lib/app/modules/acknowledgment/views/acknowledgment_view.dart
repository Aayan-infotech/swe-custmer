import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:southwaltoncarts_customer/app/utils/extension.dart';

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
          padding: EdgeInsets.only(bottom: context.bottomPadding),
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
                      "By clicking/checking this box, I, the lessee of the cart, acknowledge and certify that the following items need attention and agree to the charges as outlined in the rental agreement.",
                      size: 16,
                      color: shadow,
                      textAlign: TextAlign.justify,
                    )).marginOnly(top: 8, bottom: 8),
              ),
              SizedBox(
                height: context.height * 0.02,
              ),
              Obx(() {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.checklist.length,
                  padding: EdgeInsets.symmetric(
                      horizontal: context.width * 0.1),
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var item = controller.checklist[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                              width: 24,
                              height: 24,
                              child: Checkbox(
                                  value: item['checked'] as bool, onChanged: (value) {
                                    controller.updateChecklist(index, value??false);
                              })),
                           const SizedBox(width: 8),
                           Expanded(
                             child: CommonText.medium(
                              item['text'].toString(),
                              color: shadow,
                              size: 16,
                                                     ),
                           )
                        ],
                      ),
                    );
                  },
                );
              }),
              SizedBox(
                width: context.width * 0.7,
                child: CommonButton(
                  onPressed: () {
                    controller.damageReport();
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
