import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../gen/assets.gen.dart';
import '../theme/theme.dart';
import '../utils/common_button.dart';
import '../utils/common_text_view.dart';

Widget noDataView({String title = "No data found!"}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Center(
        child: Assets.svgIcNoData.svg(
            height: Get.context!.height * 0.14,
            width: Get.context!.width * 0.3),
      ),
      const SizedBox(
        height: 8,
      ),
      Center(
          child: CommonText.semiBold(
        title,
        size: 22,
        textAlign: TextAlign.center,
      )),
    ],
  );
}

void showPicker(
    {required VoidCallback? galleryPicker, VoidCallback? cameraPicker}) {
  showModalBottomSheet(
    context: Get.context as BuildContext,
    clipBehavior: Clip.hardEdge,
    useSafeArea: true,
    useRootNavigator: true,
    backgroundColor: surface,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16))),
    builder: (builder) {
      return Wrap(children: [
        Container(
          color: surface,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                  child: const Text(
                    "Choose an Image",
                    style: TextStyle(
                      fontFamily: "Manrope_bold",
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      letterSpacing: 0.4,
                      color: onSurface,
                    ),
                  ).paddingAll(16)),
              CommonButton(
                  label: "Gallery",
                  labelColor: onSurface,
                  bgColor: Colors.transparent,
                  onPressed: galleryPicker)
                  .paddingOnly(left: 8, right: 8, bottom: 4),

              // CommonText.semiBold("Gallery", onTap: galleryPicker, color: onBackgroundClr, size: 14, textAlign: TextAlign.center).paddingAll(16),
              Divider(
                  height: 1, thickness: 1, color: outline.withOpacity(0.3)),
              CommonButton(
                  label: "Camera",
                  labelColor: onSurface,
                  bgColor: Colors.transparent,
                  onPressed: cameraPicker)
                  .paddingOnly(left: 8, right: 8, bottom: 4),

              Divider(
                  height: 1, thickness: 1, color: outline.withOpacity(0.3)),
              CommonButton(
                onPressed: () => Get.back(),
                label: "Cancel",
                labelColor: onSurface,
                bgColor: Colors.transparent,
              ).paddingOnly(left: 8, right: 8, bottom: 4),
            ],
          ).paddingOnly(bottom: 24),
        ).paddingOnly(bottom: 24),
      ]);
    },
  );
}
