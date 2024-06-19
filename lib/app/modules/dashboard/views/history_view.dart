import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:southwaltoncarts_customer/app/theme/theme.dart';
import 'package:southwaltoncarts_customer/app/utils/common_input_text_field.dart';
import 'package:southwaltoncarts_customer/app/utils/common_text_view.dart';
import 'package:southwaltoncarts_customer/app/utils/strings.dart';
import 'package:southwaltoncarts_customer/generated/assets.dart';

import '../../../utils/common_images.dart';
import '../controllers/dashboard_controller.dart';

class HistoryView extends GetView<DashboardController> {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(Assets.imagesAppBg,),fit: BoxFit.fill)
        ),
        child:  SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: context.width * 0.6,
                        height: context.height * 0.08,
                        child: CommonTextField(
                          controller: controller.searchController,
                          hintText: Strings.search,
                          isBoxView: true,
                          bgColor: onPrimary,
                          prefix: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4),
                          ),
                          suffixIcon: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: SquareSvgImageFromAsset(
                              Assets.svgIcSearch,
                              color: shadow,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.width * 0.3,
                        height: context.height * 0.08,
                        child: CommonTextField(
                          controller: controller.searchController,
                          hintText: Strings.filter,
                          isBoxView: true,
                          isReadOnly: true,
                          bgColor: onPrimary,
                          prefix: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4),
                          ),
                          suffixIcon: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: SquareSvgImageFromAsset(
                              Assets.svgIcFilter,
                              color: shadow,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: context.width*0.04),
                    child: const CommonText.bold(
                      Strings.history,
                      size: 42,
                      color: onPrimary,
                    ),
                  ),
                  SizedBox(
                    height: context.height * 0.02,
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: onPrimary,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: context.width * 0.01,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const CommonText.semiBold(
                                        "Red cart",
                                        size: 16,
                                        color: shadow,
                                      ),
                                      SizedBox(
                                        height: context.height * 0.005,
                                      ),
                                      const CommonText(
                                        "Oct 5 - Oct 10 2024",
                                        size: 14,
                                        color: outlineVariant,
                                        fontWeight: FontWeight.w300,
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const Row(
                                        children: [
                                          CommonText.semiBold(
                                            Strings.completed,
                                            size: 16,
                                            color: success,
                                          ),
                                          Icon(
                                            Icons.check,
                                            color: success,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: context.height * 0.005,
                                      ),
                                      Row(
                                        children: [
                                          const CommonText.bold(
                                            "\$100",
                                            size: 16,
                                            color: shadow,
                                          ),
                                          SizedBox(
                                            width: context.width * 0.02,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                                top: 4,
                                                bottom: 4),
                                            decoration: BoxDecoration(
                                                color: primary,
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                const SquareSvgImageFromAsset(
                                                  Assets.svgIcReload,
                                                  size: 14,
                                                ),
                                                SizedBox(
                                                  width: context.width * 0.01,
                                                ),
                                                const CommonText.bold(
                                                  Strings.reBook,
                                                  size: 10,
                                                  color: shadow,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ).paddingSymmetric(horizontal: 16),
                            Positioned(
                              top: context.height*0.018,
                                left: 0,
                                child: SizedBox(
                                    width: context.width * 0.16,
                                    height: context.height * 0.06,
                                    child: const SquareImageFromAsset(
                                      Assets.imagesGolftCart6,
                                      fit: BoxFit.fill,
                                    )))
                          ],
                        ).paddingOnly(bottom: index == 9 ? 0: 16);
                      },
                    ),
                  )
                ],
              ),
            ),

        ),
      ),
    );
  }
}
