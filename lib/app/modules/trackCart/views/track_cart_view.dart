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
            Divider().marginOnly(top: 8),
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.1,
                  isFirst: true,
                  indicatorStyle: const IndicatorStyle(
                    width: 20,
                    color: Color(0xFF27AA69),
                    padding: EdgeInsets.all(6),
                  ),
                  endChild: const RightChild(
                    asset: Assets.imagesSwcLogo,
                    title: 'Order Placed',
                    message: 'We have received your order.',
                  ),
                  beforeLineStyle: const LineStyle(
                    color: Color(0xFF27AA69),
                  ),
                ),
                TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.1,
                  indicatorStyle: const IndicatorStyle(
                    width: 20,
                    color: Color(0xFF27AA69),
                    padding: EdgeInsets.all(6),
                  ),
                  endChild: const RightChild(
                    asset: Assets.imagesSwcLogo,
                    title: 'Order Confirmed',
                    message: 'Your order has been confirmed.',
                  ),
                  beforeLineStyle: const LineStyle(
                    color: Color(0xFF27AA69),
                  ),
                ),
                TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.1,
                  indicatorStyle: const IndicatorStyle(
                    width: 20,
                    color: Color(0xFF2B619C),
                    padding: EdgeInsets.all(6),
                  ),
                  endChild: const RightChild(
                    asset: Assets.imagesSwcLogo,
                    title: 'Order Processed',
                    message: 'We are preparing your order.',
                  ),
                  beforeLineStyle: const LineStyle(
                    color: Color(0xFF27AA69),
                  ),
                  afterLineStyle: const LineStyle(
                    color: Color(0xFFDADADA),
                  ),
                ),
                TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.1,
                  isLast: true,
                  indicatorStyle: const IndicatorStyle(
                    width: 20,
                    color: Color(0xFFDADADA),
                    padding: EdgeInsets.all(6),
                  ),
                  endChild:  const RightChild(
                    disabled: true,
                    asset: Assets.imagesSwcLogo,
                    title: 'Ready to Pickup',
                    message: 'Your order is ready for pickup.',
                  ),
                  beforeLineStyle: const LineStyle(
                    color: Color(0xFFDADADA),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
