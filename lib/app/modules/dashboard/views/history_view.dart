import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:southwaltoncarts_customer/app/theme/theme.dart';
import 'package:southwaltoncarts_customer/app/utils/common_input_text_field.dart';
import 'package:southwaltoncarts_customer/app/utils/common_text_view.dart';
import 'package:southwaltoncarts_customer/app/utils/strings.dart';
import 'package:southwaltoncarts_customer/app/widget/shimmer.dart';
import 'package:southwaltoncarts_customer/app/widget/widgets.dart';

import '../../../gen/assets.gen.dart';
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
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  Assets.imagesAppBg.path,
                ),
                fit: BoxFit.fill)),
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: context.width * 0.9,
                      height: context.height * 0.08,
                      child: CommonTextField(
                        controller: controller.searchController,
                        hintText: Strings.search,
                        isBoxView: true,
                        bgColor: onPrimary,
                        prefix: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: SquareSvgImageFromAsset(
                            Assets.svgIcSearch.path,
                            color: shadow,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   width: context.width * 0.3,
                    //   height: context.height * 0.08,
                    //   child: CommonTextField(
                    //     controller: controller.searchController,
                    //     hintText: Strings.filter,
                    //     isBoxView: true,
                    //     isReadOnly: true,
                    //     bgColor: onPrimary,
                    //     prefix: const Padding(
                    //       padding: EdgeInsets.symmetric(horizontal: 4),
                    //     ),
                    //     suffixIcon: const Padding(
                    //       padding: EdgeInsets.symmetric(horizontal: 16.0),
                    //       child: SquareSvgImageFromAsset(
                    //         Assets.svgIcFilter,
                    //         color: shadow,
                    //         size: 20,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                SizedBox(
                  height: context.height * 0.02,
                ),
                Expanded(
                  child: Obx(() {
                    return Visibility(
                        visible: !controller.isLoading.value,
                        replacement: historyShimmerLayout(context),
                        child: controller.filteredList.isNotEmpty
                            ? ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller.filteredList.length,
                                itemBuilder: (context, index) {
                                  var item = controller.filteredList[index];
                                  var formattedDate = formatPickupAndDropDates(
                                      pickup:
                                          item.reservationDetails?.pickdate ??
                                              "",
                                      drop: item.reservationDetails?.dropdate ??
                                          "");
                                  return Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            color: onPrimary,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: context.width * 0.01,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CommonText.semiBold(
                                                  item
                                                          .reservationDetails
                                                          ?.vehicleDetails
                                                          ?.vname ??
                                                      "",
                                                  size: 16,
                                                  color: shadow,
                                                ),
                                                SizedBox(
                                                  height:
                                                      context.height * 0.005,
                                                ),
                                                CommonText(
                                                  formattedDate,
                                                  size: 14,
                                                  color: outlineVariant,
                                                  fontWeight: FontWeight.w300,
                                                )
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    // buildStatusRow(item.bookingDetails?.status?.capitalizeFirst ?? ""),
                                                  ],
                                                ),
                                                //  Row(
                                                //   children: [
                                                //     CommonText.semiBold(
                                                //       item.bookingDetails?.status?.capitalize??"",
                                                //       size: 16,
                                                //       color: success,
                                                //     ),
                                                //     SquareSvgImageFromAsset(
                                                //
                                                //     ),
                                                //   ],
                                                // ),
                                                SizedBox(
                                                  height:
                                                      context.height * 0.005,
                                                ),
                                                Row(
                                                  children: [
                                                    CommonText.bold(
                                                      "\$${item.amount}",
                                                      size: 16,
                                                      color: shadow,
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          context.width * 0.02,
                                                    ),
                                                    // Container(
                                                    //   padding:
                                                    //       const EdgeInsets.only(
                                                    //           left: 8,
                                                    //           right: 8,
                                                    //           top: 4,
                                                    //           bottom: 4),
                                                    //   decoration: BoxDecoration(
                                                    //       color: primary,
                                                    //       borderRadius:
                                                    //           BorderRadius
                                                    //               .circular(8)),
                                                    //   child: Row(
                                                    //     mainAxisAlignment:
                                                    //         MainAxisAlignment
                                                    //             .spaceBetween,
                                                    //     children: [
                                                    //       SquareSvgImageFromAsset(
                                                    //         Assets.svgIcReload
                                                    //             .path,
                                                    //         size: 14,
                                                    //       ),
                                                    //       SizedBox(
                                                    //         width:
                                                    //             context.width *
                                                    //                 0.01,
                                                    //       ),
                                                    //       const CommonText.bold(
                                                    //         Strings.reBook,
                                                    //         size: 10,
                                                    //         color: shadow,
                                                    //       ),
                                                    //     ],
                                                    //   ),
                                                    // ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ).paddingSymmetric(horizontal: 16),
                                      Positioned(
                                          top: context.height * 0.018,
                                          left: 0,
                                          child: SizedBox(
                                              width: context.width * 0.16,
                                              height: context.height * 0.06,
                                              child: SquareImageFromNetwork(
                                                imageUrl: item
                                                        .reservationDetails
                                                        ?.vehicleDetails
                                                        ?.image
                                                        ?.first ??
                                                    "",
                                                fit: BoxFit.fill,
                                              )))
                                    ],
                                  ).paddingOnly(bottom: index == 9 ? 0 : 16);
                                },
                              )
                            : noDataView(
                                title: "No reservation history found!"));
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String formatPickupAndDropDates(
      {required String pickup, required String drop}) {
    DateTime pickupDate = DateTime.parse(pickup);
    DateTime dropDate = DateTime.parse(drop);

    String pickupMonth = DateFormat('MMM').format(pickupDate);
    String pickupDay = DateFormat('d').format(pickupDate);
    String dropMonth = DateFormat('MMM').format(dropDate);
    String dropDay = DateFormat('d').format(dropDate);
    String year = DateFormat('y').format(pickupDate);

    return "$pickupMonth $pickupDay - $dropMonth $dropDay $year";
  }

  Row buildStatusRow(String? status) {
    String formattedStatus = status?.toLowerCase() ?? "";
    Map<String, String>? matchedStatus = controller.status.firstWhere(
      (element) => element['status']?.toLowerCase() == formattedStatus,
      orElse: () => {"icon": "", "status": "Unknown"},
    );

    return Row(
      children: [
        CommonText.semiBold(
          matchedStatus['status'] ?? "Unknown",
          size: 16,
          color: success,
        ),
        const SizedBox(width: 8), // Add spacing between text and icon
        if (matchedStatus['icon']?.isNotEmpty ??
            false) // Check if icon is valid
          SquareSvgImageFromAsset(
            matchedStatus['icon']!,
            color: primary,
          ),
      ],
    );
  }
}
