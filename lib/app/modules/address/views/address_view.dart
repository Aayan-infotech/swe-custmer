import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:southwaltoncarts_customer/app/utils/app_loader_view.dart';
import 'package:southwaltoncarts_customer/app/utils/common_images.dart';
import 'package:southwaltoncarts_customer/app/utils/common_input_text_field.dart';
import 'package:southwaltoncarts_customer/app/utils/utils.dart';

import '../../../../generated/assets.dart';
import '../../../theme/theme.dart';
import '../../../utils/common_appBar.dart';
import '../../../utils/common_button.dart';
import '../../../utils/common_text_view.dart';
import '../../../utils/strings.dart';
import '../../../widget/shimmer.dart';
import '../controllers/address_controller.dart';

class AddressView extends GetView<AddressController> {
  const AddressView({super.key});

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
          title: Strings.address,
          hasBackIcon: true,
          bgColor: Colors.transparent,
          isTitleCenter: true,
        ),
        body: SingleChildScrollView(
          child: Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: context.height * 0.01,
                ),
                const CommonText.extraBold(
                  Strings.myBookings,
                  size: 32,
                  color: secondary,
                ).marginSymmetric(horizontal: context.width * 0.1),
                const Divider(),
                SizedBox(
                  height: context.height * 0.02,
                ),
                Visibility(
                  visible: !controller.isReserveLoading.value,
                  replacement: reservationShimmerView(context),
                  child: Container(
                      width: (context.height>=1000)? context.width * 0.8:context.width * 0.84,
                      padding: const EdgeInsets.all(16),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          color: secondary,
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 0.5, color: Colors.transparent)
                          ],
                          borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildAddressView(
                            title: Strings.pickUpAddress,
                            address: controller.pickUpLocation.value,
                            mController: controller.pickUpAddressController,
                            onChanged: (val) {
                              controller.pickUpLocation.value = val;
                            },
                          ),
                          SizedBox(height: context.height * 0.02),
                          _buildAddressView(
                            title: Strings.dropOffAddress,
                            address: controller.dropLocation.value,
                            mController: controller.deliveryAddressController,
                            onChanged: (val) {
                              controller.dropLocation.value = val;
                            },
                          ),
                          SizedBox(height: context.height * 0.04),
                          _buildDateView(
                              title: Strings.pickUpDate,
                              value: controller.pickUpDate.value,
                              onClick: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(
                                      2100), // Adjust lastDate as needed
                                );
                                if (pickedDate != null) {
                                  String formattedDate =
                                      DateFormat('MMM d yyyy')
                                          .format(pickedDate);
                                  controller.pickUpDate.value = formattedDate;
                                }
                              }),
                          SizedBox(
                            height: controller.isModify.value
                                ? context.height * 0.02
                                : context.height * 0.008,
                          ),
                          _buildDateView(
                              title: Strings.pickUpTime,
                              value: controller.pickUpTime.value,
                              onClick: () async {
                                TimeOfDay? pickedTime = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                );
                                if (pickedTime != null) {
                                  String formattedTime =
                                      Utils.formatTime(pickedTime);
                                  controller.pickUpTime.value = formattedTime;
                                }
                              }),
                          SizedBox(
                            height: controller.isModify.value
                                ? context.height * 0.02
                                : context.height * 0.008,
                          ),
                          _buildDateView(
                              title: Strings.deliveryDate,
                              value: controller.deliveryDate.value,
                              onClick: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(
                                      2100), // Adjust lastDate as needed
                                );
                                if (pickedDate != null) {
                                  String formattedDate =
                                      DateFormat('MMM d yyyy')
                                          .format(pickedDate);
                                  controller.deliveryDate.value = formattedDate;
                                }
                              }),
                          SizedBox(
                            height: controller.isModify.value
                                ? context.height * 0.02
                                : context.height * 0.008,
                          ),
                          _buildDateView(
                              title: Strings.deliveryTime,
                              value: controller.deliveryTime.value,
                              onClick: () async {
                                TimeOfDay? pickedTime = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                );
                                if (pickedTime != null) {
                                  String formattedTime =
                                      Utils.formatTime(pickedTime);
                                  controller.deliveryTime.value = formattedTime;
                                }
                              }),
                          SizedBox(
                            height: context.width * 0.03,
                          ),
                          SizedBox(
                            width: context.width * 0.7,
                            child: CommonButton(
                              onPressed: () {
                                if (controller.isModify.value) {
                                  AppLoaderView.loader();
                                  controller
                                      .updateBooking(controller.revId.value);
                                } else {
                                  controller.isModify.value =
                                      !controller.isModify.value;
                                }
                              },
                              label: controller.isModify.value
                                  ? Strings.save
                                  : Strings.modify,
                              textSize: 20,
                              mPadding: const EdgeInsets.all(12),
                              fontWeight: FontWeight.w500,
                            ),
                          ).marginOnly(top: 16, bottom: 8),
                        ],
                      )).marginOnly(top: 8, bottom: 8),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _buildAddressView(
      {required String title,
      required String address,
      required TextEditingController mController,
      required Function(String) onChanged}) {
    mController.text = address;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText.bold(
          title,
          size: 18,
          color: onPrimary,
        ),
        SizedBox(
          height: Get.context!.height * 0.008,
        ),
        Visibility(
            visible: controller.isModify.value,
            replacement: CommonText.medium(
              address,
              size: 18,
              color: onPrimary,
            ),
            child: CommonTextField(
              controller: mController,
              isBoxView: true,
              onChanged: onChanged,
            )),
      ],
    );
  }

  Widget _buildDateView(
      {required String title,
      required String value,
      required VoidCallback onClick}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CommonText.bold(
          "$title :- ",
          size: 18,
          color: onPrimary,
        ),
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: CommonText.medium(
            value,
            size: 18,
            textAlign: TextAlign.center,
            color: onPrimary,
          ),
        ),
        Visibility(
            visible: controller.isModify.value,
            child: Align(
                alignment: AlignmentDirectional.centerEnd,
                child: GestureDetector(
                  onTap: onClick,
                  child: const SquareSvgImageFromAsset(
                    Assets.svgIcFileEdit,
                    color: onPrimary,
                  ),
                )))
      ],
    );
  }
}
