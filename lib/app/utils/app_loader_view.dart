import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:southwaltoncarts_customer/app/theme/theme.dart';
import 'package:southwaltoncarts_customer/app/utils/common_button.dart';

import 'common_text_view.dart';

class AppLoaderView {
  static void showErrorDialog(
      {String title = 'Error', String? description = 'Something went wrong'}) {
   /* Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CommonText.bold(title, size: 20),
              CommonText.medium(
                description ?? "",
                size: 16,
                textAlign: TextAlign.center,
              ).paddingSymmetric(vertical: 16),
              CommonButton(
                onPressed: () {
                  if (Get.isDialogOpen!) Get.back();
                },
                label: "Okay",
              ).marginAll(4),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );*/

    Get.dialog(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
            EdgeInsets.symmetric(horizontal: Get.context!.width * 0.14),
            child: Container(
              decoration: const BoxDecoration(
                color: onPrimary,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Material(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText.bold(
                        title,
                        textAlign: TextAlign.center,
                        size: 20,
                        color: shadow,
                      ),
                      const SizedBox(height: 8),
                      CommonText.semiBold(
                        description??"Something went wrong!",
                        size: 16,
                        color: shadow,
                      ),
                      const SizedBox(height: 20),
                      //Buttons
                      SizedBox(
                        height: Get.context!.height * 0.04,
                        child: CommonButton(
                          onPressed: () {
                            Get.back();
                          },
                          mPadding: const EdgeInsets.all(8),
                          borderRadius: 8,
                          bgColor: primary,
                          label: "Okay",
                          labelColor: onPrimary,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );

  }

  static void showAlertDialog({
    String title = "Alert",
    String description = "",
    String primaryText = "Okay",
    String secondaryText = "Cancel",
    VoidCallback? onPressed,
    bool isError = false,
    bool showSecondary = false,
    bool canCancel = false,
  }) {
    /*Get.dialog(
      Dialog(
        backgroundColor: surface,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CommonText.bold(title, size: 20, color: primary),
              CommonText.medium(description,
                  size: 16, color: primary, textAlign: TextAlign.center)
                  .paddingOnly(top: 16, bottom: 16),
              Row(
                children: [
                  Visibility(
                    visible: showSecondary,
                    child: Expanded(
                      child: CommonButton(
                        onPressed: () {
                          if (Get.isDialogOpen!) Get.back();
                        },
                        label: secondaryText,
                      ).marginAll(4),
                    ),
                  ),
                  Expanded(
                    child: CommonButton(
                      onPressed: onPressed ??
                              () {
                            if (Get.isDialogOpen!) Get.back();
                          },
                      label: primaryText,
                    ).marginAll(4),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: canCancel,
    );*/

    Get.dialog(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: Get.context!.width * 0.14),
            child: Container(
              decoration: const BoxDecoration(
                color: onPrimary,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Material(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText.bold(
                        title,
                        textAlign: TextAlign.center,
                        size: 20,
                        color: shadow,
                      ),
                      const SizedBox(height: 8),
                      CommonText.semiBold(
                        description,
                        size: 16,
                        color: shadow,
                      ),
                      const SizedBox(height: 20),
                      //Buttons
                      Row(
                        children: [
                          Visibility(
                            visible: showSecondary,
                            child: Expanded(
                                child: SizedBox(
                              height: Get.context!.height * 0.04,
                              child: CommonButton(
                                onPressed: () {
                                  Get.back();
                                  Get.back();
                                },
                                mPadding: const EdgeInsets.all(8),
                                borderRadius: 8,
                                label: secondaryText,
                                bgColor: Colors.grey,
                                labelColor: shadow,
                              ),
                            )),
                          ),
                          Visibility(
                              visible: showSecondary,
                              child: const SizedBox(width: 10)),
                          Expanded(
                            child: SizedBox(
                              height: Get.context!.height * 0.04,
                              child: CommonButton(
                                onPressed: onPressed,
                                mPadding: const EdgeInsets.all(8),
                                borderRadius: 8,
                                bgColor: primary,
                                label: primaryText,
                                labelColor: onPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static void loader() {
    if (Get.isDialogOpen == false) {
      Get.dialog(Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          width: Get.context!.width * 0.18,
          height: Get.context!.width * 0.18,
          decoration: BoxDecoration(
              color: surface,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(color: Colors.white, blurRadius: 0.15)
              ]),
          child: const SpinKitCircle(
            color: primary,
          ),
        ).marginSymmetric(horizontal: Get.context!.width * 0.25),
      ));
    }
  }

  // Hide loading
  static void hideLoading() {
    if (Get.isDialogOpen!) {
      Get.back(result: false);
    }
  }
}
