import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:southwaltoncarts_customer/app/routes/app_pages.dart';
import 'package:southwaltoncarts_customer/app/widget/shimmer.dart';
import 'package:southwaltoncarts_customer/app/widget/widgets.dart';

import '../../../../generated/assets.dart';
import '../../../theme/theme.dart';
import '../../../utils/common_images.dart';
import '../../../utils/common_text_view.dart';
import '../../../utils/strings.dart';
import '../controllers/dashboard_controller.dart';

class ReservationView extends GetView<DashboardController> {
  const ReservationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                Assets.imagesAppBg,
              ),
              fit: BoxFit.fill)),
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /*Row(
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
                ),*/

                Obx(() {
                  return Visibility(
                      visible: !controller.isReserveLoading.value,
                      replacement: reservationShimmerView(context),
                      child: controller.noReservation.value
                          ? SizedBox(
                              height: context.height * 0.8,
                              child:
                                  noDataView(title: "No reservations found!"))
                          : _contentView(context));
                })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _contentView(BuildContext context) {
    return Obx(() {
      return SizedBox(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.width * 0.056),
              child: CommonText.bold(
                Strings.reservation,
                size: context.width * 0.066,
                color: onPrimary,
              ),
            ),
            SizedBox(
              height: context.height * 0.03,
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: onPrimary, borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonText.bold(
                                  controller.cartName.value,
                                  size: context.width * 0.036,
                                  color: shadow,
                                ),
                                CommonText.bold(
                                  controller.tagNumber.value,
                                  size: context.width * 0.03,
                                  color: shadow,
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.ADDRESS)?.then((onValue) {
                                controller.isReserveLoading.value = true;
                                controller.getReservation();
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 12, right: 12, top: 6, bottom: 6),
                              decoration: BoxDecoration(
                                  color: shadow,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const SquareSvgImageFromAsset(
                                    Assets.svgIcModify,
                                    size: 14,
                                    color: onPrimary,
                                  ),
                                  SizedBox(
                                    width: context.width * 0.01,
                                  ),
                                  CommonText.bold(
                                    Strings.modify,
                                    color: onPrimary,
                                    size: context.width * 0.026,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      AspectRatio(
                        aspectRatio: 1,
                        child: Obx(() {
                          return SquareImageFromNetwork(
                            imageUrl: controller.cartImg.value,
                            fit: BoxFit.contain,
                          );
                        }),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CommonText.medium(
                            "${Strings.deliveryTime} : ",
                            size: 18,
                            color: shadow,
                            letterSpacing: 1.5,
                          ),
                          CommonText.bold(
                            controller.deliveryTime.value,
                            size: 18,
                            color: shadow,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CommonText.medium(
                            "${Strings.pickUpTime} : ",
                            size: 18,
                            color: shadow,
                            letterSpacing: 1.5,
                          ),
                          CommonText.bold(controller.pickUpTime.value,
                              size: 18, color: shadow)
                        ],
                      ).paddingOnly(bottom: 24),
                      Container(
                        width: context.width * 0.5,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(8)),
                        child: GestureDetector(
                          onTap: () {
                            controller.getAgreement();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SquareSvgImageFromAsset(
                                Assets.svgIcFileView,
                                size: 14,
                                color: shadow,
                              ),
                              SizedBox(
                                width: context.width * 0.01,
                              ),
                              const CommonText.bold(
                                Strings.viewAgreement,
                                color: shadow,
                              ),
                            ],
                          ),
                        ),
                      ).paddingOnly(bottom: 16),
                      Container(
                        width: context.width * 0.5,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: blue, borderRadius: BorderRadius.circular(8)),
                        child: GestureDetector(
                          onTap: () {
                            controller.fetchAndSavePdf(controller.transId.value);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SquareSvgImageFromAsset(
                                Assets.svgIcModify,
                                size: 14,
                                color: shadow,
                              ),
                              SizedBox(
                                width: context.width * 0.01,
                              ),
                              const CommonText.bold(
                                Strings.invoice,
                                color: shadow,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ).paddingSymmetric(horizontal: context.width * 0.056),
                // Positioned(
                //   top:context.height>900? (MediaQuery.of(context).size.height * 0.074):(MediaQuery.of(context).size.height * 0.1),
                //   left: MediaQuery.of(context).size.width * 0.1,
                //   right: MediaQuery.of(context).size.width * 0.1,
                //   child: AspectRatio(
                //     aspectRatio: 1,
                //     child: Obx(() {
                //       return SquareImageFromNetwork(
                //         imageUrl: controller.cartImg.value,
                //         fit: BoxFit.contain,
                //       );
                //     }),
                //   ),
                // ),
              ],
            )
          ],
        ),
      );
    });
  }
}
