import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:southwaltoncarts_customer/app/utils/common_images.dart';
import 'package:southwaltoncarts_customer/app/utils/common_text_view.dart';

/*class ShowcaseDeliveryTimeline extends StatelessWidget {
  const ShowcaseDeliveryTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Showcase(
      title: 'Delivery Timeline',
      app: _DeliveryTimelineApp(),
      description:
      'A simple timeline with few steps to show the current status of '
          'an order.',
      template: SimpleTemplate(reverse: false),
      theme: TemplateThemeData(
        frameTheme: FrameThemeData(
          statusBarBrightness: Brightness.dark,
          frameColor: const Color(0xFF215C3F),
        ),
        flutterLogoColor: FlutterLogoColor.original,
        brightness: Brightness.dark,
        backgroundColor: const Color(0xFFE9E9E9),
        titleTextStyle: GoogleFonts.neuton(
          fontSize: 80,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF2C7B54),
        ),
        descriptionTextStyle: GoogleFonts.yantramanav(
          fontSize: 24,
          height: 1.2,
          color: const Color(0xFF2C7B54),
        ),
        buttonTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
        ),
        buttonIconTheme: const IconThemeData(color: Colors.white),
        buttonTheme: ButtonThemeData(
          buttonColor: const Color(0xFF2C7B54),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          padding: const EdgeInsets.all(16),
        ),
      ),
      links: [
        (""),
      ],
      logoLink: (""),
    );
  }
}

class _DeliveryTimelineApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Delivery TimelineTile',
      home: _DeliveryTimeline(),
    );
  }
}

class _DeliveryTimeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF379A69),
      child: Theme(
        data: Theme.of(context).copyWith(
          hintColor: const Color(0xFF27AA69).withOpacity(0.2),
        ),
        child: SafeArea(
          child: Scaffold(
            appBar: _AppBar(),
            backgroundColor: Colors.white,
            body: Column(
              children: <Widget>[
                _Header(),
                Expanded(child: _TimelineDelivery()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TimelineDelivery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
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
              asset: 'assets/delivery/order_placed.png',
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
              asset: 'assets/delivery/order_confirmed.png',
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
              asset: 'assets/delivery/order_processed.png',
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
            endChild:  RightChild(
              disabled: true,
              asset: 'assets/delivery/ready_to_pickup.png',
              title: 'Ready to Pickup',
              message: 'Your order is ready for pickup.',
            ),
            beforeLineStyle: const LineStyle(
              color: Color(0xFFDADADA),
            ),
          ),
        ],
      ),
    );
  }
}*/

class RightChild extends StatelessWidget {
  final String asset;
  final String title;
  final String message;
  final Color titleClr;
  final Color msgClr;
  final Color iconClr;
  final bool disabled;

  const RightChild({
    super.key,
    required this.asset,
    required this.title,
    required this.message,
    required this.msgClr,
    required this.iconClr,
    required this.titleClr,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: context.width * 0.1,
        child: Row(
          children: [
            Opacity(
              opacity: disabled ? 0.5 : 1,
              child: SquareSvgImageFromAsset(asset, size: 42,color: iconClr,),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonText.extraBold(title, size: 18, color: titleClr),
                CommonText.medium(
                  message,
                  color: msgClr,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/*
class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF9F9F9),
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFE9E9E9),
            width: 3,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'ESTIMATED TIME',
                    style: GoogleFonts.yantramanav(
                      color: const Color(0xFFA2A2A2),
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '30 minutes',
                    style: GoogleFonts.yantramanav(
                      color: const Color(0xFF636564),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'ORDER NUMBER',
                    style: GoogleFonts.yantramanav(
                      color: const Color(0xFFA2A2A2),
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '#2482011',
                    style: GoogleFonts.yantramanav(
                      color: const Color(0xFF636564),
                      fontSize: 16,
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

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF27AA69),
      leading: const Icon(Icons.menu),
      actions: <Widget>[
        Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Text(
              'CANCEL',
              style: GoogleFonts.neuton(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
      title: Text(
        'Track Order',
        style: GoogleFonts.neuton(
            color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}*/
