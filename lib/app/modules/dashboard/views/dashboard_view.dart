import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:southwaltoncarts_customer/app/modules/dashboard/views/history_view.dart';
import 'package:southwaltoncarts_customer/app/modules/dashboard/views/home_view.dart';
import 'package:southwaltoncarts_customer/app/modules/dashboard/views/reservation_view.dart';
import 'package:southwaltoncarts_customer/app/utils/common_text_view.dart';

import '../../../../generated/assets.dart';
import '../../../theme/theme.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
   DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        height: MediaQuery
            .sizeOf(context)
            .height,
        width: MediaQuery
            .sizeOf(context)
            .height,
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(Assets.imagesAppBg))),
        child: SafeArea(
            child: Scaffold(
              body: IndexedStack(
                  index: controller.currentIndex.value, children: pages),
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.only(left: 16,right: 16),
                child: SizedBox(
                  height: context.height*0.092,
                  child: ClipRRect(
                    child: Container(
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(16)

                      ),
                      child: TabBar(
                          onTap: (x) {
                              print("TAB => $x");
                              controller.currentIndex.value = x;
                          },
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.blueGrey,
                          tabAlignment:TabAlignment.fill,
                          indicatorPadding: const EdgeInsets.all(16),
                          dividerColor: Colors.transparent,
                          labelPadding: EdgeInsets.zero,
                          padding: const EdgeInsets.only(top: 4),
                          indicatorColor: Colors.transparent,
                          indicator: const BoxDecoration(),
                          indicatorWeight: 0,
                          tabs: [
                            for (int i = 0; i < icons.length; i++)
                              _tabItem(
                                icons[i],
                                labels[i],
                                isSelected: i == controller.currentIndex.value,
                              ),
                          ],
                          controller: controller.tabController),
                    ),
                  ),
                ),
              ),

            )
        ),
      );
    });
  }
  final List<IconData> icons = const [
    Icons.calendar_today_outlined,
    Icons.home_filled,
    Icons.history
  ];
  final List<String> labels = ['Reservation', 'Home', 'History'];

  Widget _tabItem(IconData icon, String label, {bool isSelected = false}) {
    var context = Get.context as BuildContext;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        AnimatedContainer(
            width: context.width*0.24,
            alignment: Alignment.center,
            duration: const Duration(milliseconds: 500),
            decoration: !isSelected
                ? null
                : const BoxDecoration(
              color: primaryContainer,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               Icon(icon,color: isSelected? onPrimaryContainer:onPrimary ,),
                isSelected? CommonText.bold(label,color: isSelected? onPrimaryContainer:onPrimary):Container(),
              ],
            )),
        isSelected?  Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          bottom: context.height*0.084,// Align right to the container's edge
          child: ClipRect( // Clip the divider to prevent overflowing
            child: Divider(color: onPrimaryContainer, thickness: 3),
          ),
        ) : const SizedBox(),
      ],
    );
  }
}


BottomNavigationBarItem bottomNavItem(IconData icon, String title) {
  return BottomNavigationBarItem(
    icon: Icon(icon, color: onPrimary.withOpacity(0.4)),
    activeIcon: Icon(icon, color: secondary),
    label: title,
  );
}



const pages = [ReservationView(), HomeView(), HistoryView(),];

