import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';
import 'package:southwaltoncarts_customer/app/routes/app_pages.dart';
import 'package:southwaltoncarts_customer/app/utils/common_button.dart';
import 'package:southwaltoncarts_customer/app/utils/common_text_view.dart';
import 'package:southwaltoncarts_customer/app/utils/shared_prefs.dart';
import 'package:southwaltoncarts_customer/app/utils/strings.dart';

import '../../../../generated/assets.dart';
import '../../../theme/theme.dart';
import '../../../utils/common_appbar.dart';
import '../../../utils/common_images.dart';
import '../../../utils/constants.dart';
import '../controllers/dashboard_controller.dart';

class HomeView extends GetView<DashboardController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                Assets.imagesHomeBg,
              ),
              fit: BoxFit.fill)),
      child: Scaffold(
        key: controller.drawerKey,
        drawer: Container(
          width: context.width / 1.5,
          padding: const EdgeInsets.only(top: 16),
          height: (context.height - context.height * 0.092),
          decoration: const BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(60),
                  bottomRight: Radius.circular(60))),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: context.height*0.01),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                        Get.toNamed(Routes.EDIT_PROFILE)?.then((onValue) {
                          controller.profileImage.value =
                              SharedPrefs().userImage();
                          controller.userName.value = SharedPrefs().userName();
                          controller.userEmail.value =
                              SharedPrefs().userEmail();
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                text: controller.userName.value,
                                style: const TextStyle(
                                    color: onPrimary,
                                    fontFamily: Constants.mFontFamily,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700),
                                children: [
                                  const TextSpan(text: "\n"),
                                  TextSpan(
                                      text: controller.userEmail.value,
                                      style: const TextStyle(
                                          color: onPrimary,
                                          fontFamily: Constants.mFontFamily,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              const Card(
                                color: onPrimary,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.edit,
                                        size: 12,
                                        color: primary,
                                      ),
                                      CommonText(
                                        "Edit",
                                        size: 12,
                                        color: primary,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: context.height*0.02),
                    _singleItem("Modify", onClick: () {
                      Get.back();
                      Get.toNamed(Routes.ADDRESS);
                    }),
                    _singleItem("Agreement", onClick: () {
                      Get.back();
                      if (!controller.noReservation.value) {
                        controller.getAgreement();
                      } else {
                        Get.rawSnackbar(
                          title: "No Booking Available",
                          message:
                              "You currently do not have any active bookings. Please make a reservation first.",
                        );
                      }
                    }),
                    _singleItem("Contact Us", onClick: () {
                      Get.back();
                      Get.toNamed(Routes.CONTACT_US);
                    }),
                    // _singleItem("About Us", onClick: () {
                    //   Get.back();
                    //   Get.toNamed(Routes.CONTACT_US);
                    // }),
                    // _singleItem("Privacy Policy", onClick: () {
                    //   Get.back();
                    //   Get.toNamed(Routes.CONTACT_US);
                    // }),
                    // _singleItem("Terms & Condition", onClick: () {
                    //   Get.back();
                    //   Get.toNamed(Routes.CONTACT_US);
                    // }),
                    _singleItem("Share the App", onClick: () {
                      Share.share(
                          'https://play.google.com/store/apps/details?id=in.aayaninfotech.southwaltoncarts_customer&hl=en');
                    }),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(right: 16.0, bottom: 16),
                          child: InkWell(
                            onTap: () {
                              Get.dialog(
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: context.width * 0.14),
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
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const CommonText.bold(
                                                  Strings.logout,
                                                  textAlign: TextAlign.center,
                                                  size: 20,
                                                  color: shadow,
                                                ),
                                                const SizedBox(height: 8),
                                                const CommonText.semiBold(
                                                  Strings
                                                      .areSureYouWantToLogout,
                                                  size: 16,
                                                  color: shadow,
                                                ),
                                                const SizedBox(height: 20),
                                                //Buttons
                                                Row(
                                                  children: [
                                                    Expanded(
                                                        child: SizedBox(
                                                      height:
                                                          context.height * 0.04,
                                                      child: CommonButton(
                                                        onPressed: () {
                                                          Get.back();
                                                          Get.back();
                                                        },
                                                        mPadding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        borderRadius: 8,
                                                        label: Strings.cancel,
                                                        bgColor: Colors.grey,
                                                        labelColor: shadow,
                                                      ),
                                                    )),
                                                    const SizedBox(width: 10),
                                                    Expanded(
                                                      child: SizedBox(
                                                        height: context.height *
                                                            0.04,
                                                        child: CommonButton(
                                                          onPressed: () {
                                                            Get.back();
                                                            controller.logout();
                                                          },
                                                          mPadding:
                                                              const EdgeInsets
                                                                  .all(8),
                                                          borderRadius: 8,
                                                          bgColor: error,
                                                          label: Strings.logout,
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
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Icon(
                                  Icons.logout,
                                  size: 28,
                                  color: onPrimary,
                                ),
                                SizedBox(
                                  width: context.width * 0.01,
                                ),
                                CommonText.extraBold(
                                  Strings.logout.toUpperCase(),
                                  size: 22,
                                  color: onPrimary,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                  // left: context.width * 0.6,
                  left: (context.width>600)?context.width/1.8: context.width / 1.96,
                  top: context.height * 0.4,
                  child: Image.asset(Assets.imagesDrawerBack)),
              /*Positioned(
                  top: context.height * 0.738,
                  left: context.width * 0.4,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.logout,
                        size: 28,
                        color: onPrimary,
                      ),
                      SizedBox(
                        width: context.width * 0.01,
                      ),
                      CommonText.extraBold(
                        Strings.logout.toUpperCase(),
                        size: 22,
                        color: onPrimary,
                      ),
                    ],
                  ))*/
            ],
          ),
        ),
        appBar: CommonAppBar(
          title: 'Hello ${controller.userName.value}',
          titleColor: Colors.white,
          isHome: true,
          // actions: const [
          //   Padding(
          //     padding: EdgeInsets.symmetric(horizontal: 12.0),
          //     child: SquareSvgImageFromAsset(
          //       Assets.svgIcBell,
          //       color: onPrimary,
          //     ),
          //   )
          // ],
          bgColor: Colors.transparent,
          onBackTap: () {
            controller.drawerKey.currentState?.openDrawer();
          },
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Lottie.asset(
              'assets/images/lotti.json',
              width: context.width,
              height: context.height * 0.1,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.mList.length,
                itemBuilder: (context, index) {
                  var mData = controller.mList[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        if (!controller.noReservation.value) {
                          switch (index) {
                            case 0:
                              Get.toNamed(Routes.TRACK_CART);
                              break;
                            case 1:
                              Get.toNamed(Routes.DRIVER_DETAIL);
                              break;
                            case 2:
                              Get.toNamed(Routes.DAMAGE_REPORT);
                              break;
                            default:
                              break;
                          }
                        } else {
                          Get.rawSnackbar(
                            title: "No Booking Available",
                            message:
                                "You currently do not have any active bookings. Please make a reservation first.",
                          );
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: onPrimary,
                            borderRadius: BorderRadius.circular(24)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SquareImageFromAsset(
                              mData.img,
                              color: shadow,
                              size: 40,
                            ),
                            CommonText.bold(
                              mData.title,
                              color: shadow,
                              size: 16,
                            )
                          ],
                        ),
                      ).marginSymmetric(horizontal: context.width * 0.16),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _singleItem(String title, {required VoidCallback onClick}) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            color: Colors.transparent, borderRadius: BorderRadius.circular(24)),
        child: CommonText.bold(
          title,
          color: onPrimary,
          size: 18,
        ),
      ),
    );
  }
}
