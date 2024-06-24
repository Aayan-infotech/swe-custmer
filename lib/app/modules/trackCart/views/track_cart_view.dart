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
      child:  Scaffold(
        appBar: const CommonAppBar(title: Strings.trackRental,hasBackIcon: true,bgColor: Colors.transparent,isTitleCenter: true,),
        body: Column(
          children: [
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 16.0),
             child: const Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Column(
                   children: [
                     CommonText.medium(Strings.deliveryDate,size: 16,),
                     CommonText.bold("Oct 4 2024",size: 16,color: shadow,),
                   ],
                 ),
                 Column(
                   children: [
                     CommonText.medium(Strings.deliveryDate,size: 16,),
                     CommonText.bold("Oct 4 2024",size: 16,color: shadow,),
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
                    indicatorStyle: const IndicatorStyle(
                      width: 20,
                      color: secondary,
                      padding: EdgeInsets.all(6),
                    ),
                    endChild: const RightChild(
                      asset: Assets.svgIcBookingFile,
                      title: Strings.bookingPlaced,
                      message: Strings.weHaveReceivedYourBooking,
                    ),
                    beforeLineStyle: const LineStyle(
                      color: secondary,
                    ),
                  ),
                  TimelineTile(
                    alignment: TimelineAlign.manual,
                    lineXY: 0.1,
                    indicatorStyle: const IndicatorStyle(
                      width: 20,
                      color: secondary,
                      padding: EdgeInsets.all(6),
                    ),
                    endChild: const RightChild(
                      asset: Assets.svgIcConfirmCheck,
                      title: Strings.bookingConfirmed,
                      message: Strings.youBookingHasBeenConfirmed,
                    ),
                    beforeLineStyle: const LineStyle(
                      color: secondary,
                    ),
                  ),
                  TimelineTile(
                    alignment: TimelineAlign.manual,
                    lineXY: 0.1,
                    indicatorStyle: const IndicatorStyle(
                      width: 20,
                      color: secondary,
                      padding: EdgeInsets.all(6),
                    ),
                    endChild: const RightChild(
                      asset: Assets.svgIcLocMarker,
                      title: Strings.onTheWay,
                      message: Strings.weAreOnTheWayToDeliver,
                    ),
                    beforeLineStyle: const LineStyle(
                      color: secondary,
                    ),
                  ),
                  TimelineTile(
                    alignment: TimelineAlign.manual,
                    lineXY: 0.1,
                    indicatorStyle: const IndicatorStyle(
                      width: 20,
                      color: secondary,
                      padding: EdgeInsets.all(6),
                    ),
                    endChild: const RightChild(
                      asset: Assets.svgIcConfirmCheck,
                      title: Strings.delivered,
                      message: Strings.weDeliveredTheCart,
                    ),
                    beforeLineStyle: const LineStyle(
                      color: secondary,
                    ),
                  ),
                  TimelineTile(
                    alignment: TimelineAlign.manual,
                    lineXY: 0.1,
                    isLast: true,
                    indicatorStyle: const IndicatorStyle(
                      width: 20,
                      color: secondary,
                      padding: EdgeInsets.all(6),
                    ),
                    endChild:  const RightChild(
                      disabled: true,
                      asset: Assets.svgIcConfirmCheck,
                      title: Strings.pickedUp,
                      message: Strings.weArePickedUpTheCart,
                    ),

                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
