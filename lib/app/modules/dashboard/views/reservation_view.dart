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
    return Scaffold(
      body: SizedBox(
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
      return Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * 0.056),
            child: const CommonText.bold(
              Strings.reservation,
              size: 42,
              color: onPrimary,
            ),
          ),
          SizedBox(
            height: context.height * 0.03,
          ),
          Stack(
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText.bold(
                              controller.cartName.value,
                              size: 16,
                              color: shadow,
                            ),
                            CommonText.bold(
                              controller.bookingId.value,
                              size: 16,
                              color: shadow,
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: (){
                            Get.toNamed(Routes.ADDRESS);
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
                                const CommonText.bold(
                                  Strings.modify,
                                  color: onPrimary,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: context.height * 0.33,
                    ),
                    //  SizedBox(child: Image.asset(Assets.imagesGolfCart,)),
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
              Positioned(
                  bottom: context.height*0.18,
                  top: context.height*0.08,
                  left:-10,
                  right:context.height*0.026,
                  child: SizedBox(
                      height: context.height*0.3,
                      child: Obx(() {
                        return SquareImageFromNetwork(
                          imageUrl: controller.cartImg.value,
                          fit: BoxFit.fill
                        );
                      })))
            ],
          )
        ],
      );
    });
  }
}
