import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:southwaltoncarts_customer/app/theme/theme.dart';
import 'package:southwaltoncarts_customer/app/utils/common_appBar.dart';
import 'package:southwaltoncarts_customer/app/utils/common_text_view.dart';
import 'package:southwaltoncarts_customer/app/utils/strings.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../../generated/assets.dart';
import '../controllers/track_cart_controller.dart';
import 'delivery_timeline.dart';

class TrackCartView extends GetView<TrackCartController> {
  const TrackCartView({super.key});

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
          title: Strings.trackRental,
          hasBackIcon: true,
          bgColor: Colors.transparent,
          isTitleCenter: true,
        ),
        body: Obx(() {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const CommonText.medium(
                          Strings.pickUpDate,
                          size: 16,
                        ),
                        CommonText.bold(
                          controller.picUpDate.value,
                          size: 16,
                          color: shadow,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const CommonText.medium(
                          Strings.deliveryDate,
                          size: 16,
                        ),
                        CommonText.bold(
                          controller.dropDate.value,
                          size: 16,
                          color: shadow,
                        ),
                      ],
                    )
                  ],
                ).marginOnly(top: 16),
              ),
              const Divider().marginOnly(top: 8),
              Center(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    TimelineTile(
                      alignment: TimelineAlign.manual,
                      lineXY: 0.1,
                      isFirst: true,
                      afterLineStyle: LineStyle(
                        color: controller.status.value == "PENDING"
                            ? primary
                            : onSurface.withOpacity(0.6),
                      ),
                      indicatorStyle: IndicatorStyle(
                        width: 20,
                        color: controller.status.value == "PENDING"
                            ? primary
                            : onSurface.withOpacity(0.6),
                        padding: const EdgeInsets.all(6),
                      ),
                      endChild: RightChild(
                        disabled: controller.status.value != "PENDING",
                        asset: Assets.svgIcBookingFile,
                        title: Strings.bookingPlaced,
                        message: Strings.weHaveReceivedYourBooking,
                        iconClr: controller.status.value == "PENDING"
                            ? primary
                            : onSurface.withOpacity(0.6),
                        titleClr: controller.status.value == "PENDING"
                            ? primary
                            : onSurface.withOpacity(0.6),
                        msgClr: controller.status.value == "PENDING"
                            ? primary
                            : onSurface.withOpacity(0.6),
                      ),
                      beforeLineStyle: LineStyle(
                        color: controller.status.value == "PENDING"
                            ? primary
                            : onSurface.withOpacity(0.6),
                      ),
                    ),
                    TimelineTile(
                      alignment: TimelineAlign.manual,
                      lineXY: 0.1,
                      indicatorStyle: IndicatorStyle(
                        width: 20,
                        color: controller.status.value == "PENDING"
                            ? primary
                            : onSurface.withOpacity(0.6),
                        padding: const EdgeInsets.all(6),
                      ),
                      beforeLineStyle: LineStyle(
                        color: controller.status.value == "PENDING"
                            ? primary
                            : onSurface.withOpacity(0.6),
                      ),
                      afterLineStyle: LineStyle(
                        color: controller.status.value == "PENDING"
                            ? primary
                            : onSurface.withOpacity(0.6),
                      ),
                      endChild: RightChild(
                        disabled: controller.status.value != "PENDING",
                        asset: Assets.svgIcConfirmCheck,
                        title: Strings.bookingConfirmed,
                        message: Strings.youBookingHasBeenConfirmed,
                        iconClr: controller.status.value == "PENDING"
                            ? primary
                            : onSurface.withOpacity(0.6),
                        titleClr: controller.status.value == "PENDING"
                            ? primary
                            : onSurface.withOpacity(0.6),
                        msgClr: controller.status.value == "PENDING"
                            ? primary
                            : onSurface.withOpacity(0.6),
                      ),
                    ),
                    TimelineTile(
                      alignment: TimelineAlign.manual,
                      lineXY: 0.1,
                      indicatorStyle: IndicatorStyle(
                        width: 20,
                        color: controller.status.value == "PENDING"
                            ? primary
                            : onSurface.withOpacity(0.6),
                        padding: const EdgeInsets.all(6),
                      ),
                      beforeLineStyle: LineStyle(
                        color: controller.status.value == "PENDING"
                            ? primary
                            : onSurface.withOpacity(0.6),
                      ),
                      afterLineStyle: LineStyle(
                        color: controller.status.value == "PENDING"
                            ? primary
                            : onSurface.withOpacity(0.6),
                      ),
                      endChild: RightChild(
                        disabled: controller.status.value != "PENDING",
                        asset: Assets.svgIcLocMarker,
                        title: Strings.onTheWay,
                        message: Strings.weAreOnTheWayToDeliver,
                        iconClr: controller.status.value == "PENDING"
                            ? primary
                            : onSurface.withOpacity(0.6),
                        titleClr: controller.status.value == "PENDING"
                            ? primary
                            : onSurface.withOpacity(0.6),
                        msgClr: controller.status.value == "PENDING"
                            ? primary
                            : onSurface.withOpacity(0.6),
                      ),
                    ),
                    TimelineTile(
                      alignment: TimelineAlign.manual,
                      lineXY: 0.1,
                      beforeLineStyle: LineStyle(
                        color: controller.status.value == "DELIVERED"
                            ? primary
                            : onSurface.withOpacity(0.6),
                      ),
                      afterLineStyle: LineStyle(
                        color: controller.status.value == "DELIVERED"
                            ? primary
                            : onSurface.withOpacity(0.6),
                      ),
                      indicatorStyle: IndicatorStyle(
                        width: 20,
                        color: controller.status.value == "DELIVERED"
                            ? primary
                            : onSurface.withOpacity(0.6),
                        // Highlight or disable based on status
                        padding: const EdgeInsets.all(6),
                      ),
                      endChild: RightChild(
                        disabled: controller.status.value != "DELIVERED",
                        asset: Assets.svgIcConfirmCheck,
                        title: Strings.delivered,
                        message: Strings.weDeliveredTheCart,
                        iconClr: controller.status.value == "DELIVERED"
                            ? primary
                            : onSurface.withOpacity(0.6),
                        titleClr: controller.status.value == "DELIVERED"
                            ? primary
                            : onSurface.withOpacity(0.6),
                        msgClr: controller.status.value == "DELIVERED"
                            ? primary
                            : onSurface.withOpacity(0.6),
                      ),
                    ),
                    TimelineTile(
                      alignment: TimelineAlign.manual,
                      lineXY: 0.1,
                      isLast: true,
                      beforeLineStyle: LineStyle(
                        color: controller.status.value == "COMPLETED"
                            ? primary
                            : onSurface.withOpacity(0.6),
                      ),
                      afterLineStyle: LineStyle(
                        color: controller.status.value == "COMPLETED"
                            ? primary
                            : onSurface.withOpacity(0.6),
                      ),
                      indicatorStyle: IndicatorStyle(
                        width: 20,
                        color: controller.status.value == "COMPLETED"
                            ? primary
                            : onSurface.withOpacity(0.6),
                        padding: const EdgeInsets.all(6),
                      ),
                      endChild: RightChild(
                        disabled: controller.status.value != "COMPLETED",
                        asset: Assets.svgIcConfirmCheck,
                        title: Strings.pickedUp,
                        message: Strings.weArePickedUpTheCart,
                        iconClr: controller.status.value == "COMPLETED"
                            ? primary
                            : onSurface.withOpacity(0.6),
                        titleClr: controller.status.value == "COMPLETED"
                            ? primary
                            : onSurface.withOpacity(0.6),
                        msgClr: controller.status.value == "COMPLETED"
                            ? primary
                            : onSurface.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
