import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:southwaltoncarts_customer/app/utils/common_images.dart';

import '../../../../generated/assets.dart';
import '../../../theme/theme.dart';
import '../../../utils/common_appBar.dart';
import '../../../utils/common_button.dart';
import '../../../utils/common_text_view.dart';
import '../../../utils/strings.dart';
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: context.height * 0.01,
                ),
                Center(
                    child: const CommonText.extraBold(
                      Strings.myBookings,
                      size: 32,
                      color: secondary,
                    ).marginSymmetric(horizontal: context.width * 0.1)),
                SizedBox(
                  height: context.height * 0.01,
                ),
                SizedBox(
                  height: context.height * 0.04,
                  child: Center(
                    child: Obx(() {
                      return ListView.builder(
                        itemCount: controller.statusList.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var mData = controller.statusList[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0),
                            child: InkWell(
                              onTap: () {
                                // for (var item in controller.statusList) {
                                //   item.isSelected.value = false;
                                // }
                                // mData.isSelected.value = true;
                                // controller.statusList.refresh();
                              },
                              child: Container(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 16),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: mData.isSelected.value
                                        ? blue
                                        : Colors.grey,
                                    borderRadius: BorderRadius.circular(24)),
                                child: CommonText.semiBold(
                                  mData.title,
                                  size: 14,
                                  color:
                                  mData.isSelected.value ? onPrimary : shadow,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }),
                  ),
                ),
                SizedBox(
                  height: context.height * 0.014,
                ),
                const Divider(),
                SizedBox(
                  height: context.height * 0.02,
                ),
                Center(
                  child: Container(
                      width: context.width * 0.8,
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
                          const CommonText.bold(
                            Strings.dropOffAddress,
                            size: 18,
                            color: onPrimary,
                          ),
                          SizedBox(
                            height: context.height * 0.008,
                          ),

                          Visibility(
                            visible: controller.isModify.value,
                            replacement: const CommonText.medium(
                              Strings.dummyText,
                              size: 18,
                              color: onPrimary,
                            ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8),
                              decoration: BoxDecoration(
                                  color: onPrimary,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: context.width * 0.6,
                                    child: const CommonText.medium(
                                      Strings.dummyText,
                                      size: 18,
                                      color: shadow,
                                    ),
                                  ),
                                  const Expanded(
                                      child: InkWell(
                                          child: SquareSvgImageFromAsset(
                                            Assets.svgIcFileEdit,
                                            color: shadow,
                                          )))
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: context.height * 0.02),
                          const CommonText.bold(
                            Strings.pickUpAddress,
                            size: 18,
                            color: onPrimary,
                          ),
                          SizedBox(
                            height: context.height * 0.008,
                          ),
                          Visibility(
                            visible: controller.isModify.value,
                            replacement: const CommonText.medium(
                              Strings.dummyText,
                              size: 18,
                              color: onPrimary,
                            ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8),
                              decoration: BoxDecoration(
                                  color: onPrimary,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: context.width * 0.6,
                                    child: const CommonText.medium(
                                      Strings.dummyText,
                                      size: 18,
                                      color: shadow,
                                    ),
                                  ),
                                  const Expanded(
                                      child: InkWell(
                                          child: SquareSvgImageFromAsset(
                                            Assets.svgIcFileEdit,
                                            color: shadow,
                                          )))
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: context.height * 0.04),
                          Row(
                            children: [
                              const CommonText.bold(
                                "${Strings.deliveryDate} :- ",
                                size: 18,
                                color: onPrimary,
                              ),
                              SizedBox(
                                width: context.width * 0.01,
                              ),
                              const CommonText.medium(
                                "5 oct 2024",
                                size: 18,
                                color: onPrimary,
                              ),
                              SizedBox(
                                width: controller.isModify.value ? context
                                    .width * 0.05 : 0,
                              ),
                              Visibility(
                                  visible: controller.isModify.value,
                                  child: const Expanded(
                                      child: SquareSvgImageFromAsset(
                                        Assets.svgIcFileEdit,
                                        color: onPrimary,
                                      ))
                              )
                            ],
                          ),
                          SizedBox(
                            height: controller.isModify.value?context.height*0.02:context.height * 0.008,
                          ),
                          Row(
                            children: [
                              const CommonText.bold(
                                "${Strings.deliveryTime} :- ",
                                size: 18,
                                color: onPrimary,
                              ),
                              SizedBox(
                                width: context.width * 0.01,
                              ),
                              Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8),
                                  decoration: BoxDecoration(
                                      color: onPrimary,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: const CommonText.medium(
                                    "5 oct 2024",
                                    size: 18,
                                    color: secondary,
                                  )),
                              SizedBox(
                                width: controller.isModify.value ? context
                                    .width * 0.01 : 0,
                              ),
                              Visibility(
                                  visible: controller.isModify.value,
                                  child: const Expanded(
                                      child: SquareSvgImageFromAsset(
                                        Assets.svgIcFileEdit,
                                        color: onPrimary,
                                      ))
                              )
                            ],
                          ),
                          SizedBox(
                            height: controller.isModify.value?context.height*0.02:context.height * 0.008,
                          ),
                          Row(
                            children: [
                              const CommonText.bold(
                                "${Strings.deliveryDate} :- ",
                                size: 18,
                                color: onPrimary,
                              ),
                              SizedBox(
                                width: context.width * 0.01,
                              ),
                              const CommonText.medium(
                                "5 oct 2024",
                                size: 18,
                                color: onPrimary,
                              ),
                              SizedBox(
                                width: controller.isModify.value ? context
                                    .width * 0.05 : 0,
                              ),
                              Visibility(
                                  visible: controller.isModify.value,
                                  child: const Expanded(
                                      child: SquareSvgImageFromAsset(
                                        Assets.svgIcFileEdit,
                                        color: onPrimary,
                                      ))
                              )
                            ],
                          ),
                          SizedBox(
                            height: controller.isModify.value?context.height*0.02:context.height * 0.008,
                          ),
                          Row(
                            children: [
                              const CommonText.bold(
                                "${Strings.deliveryTime} :- ",
                                size: 18,
                                color: onPrimary,
                              ),
                              SizedBox(
                                width: context.width * 0.01,
                              ),
                              Container(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                      color: onPrimary,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: const CommonText.medium(
                                    "5 oct 2024",
                                    size: 18,
                                    color: secondary,
                                  )),
                              SizedBox(
                                width: controller.isModify.value ? context
                                    .width * 0.01 : 0,
                              ),
                              Visibility(
                                visible: controller.isModify.value,
                                child: const Expanded(
                                    child: SquareSvgImageFromAsset(
                                      Assets.svgIcFileEdit,
                                      color: onPrimary,
                                    )),
                              )
                            ],
                          ),
                          SizedBox(
                            height: context.width * 0.03,
                          ),
                          SizedBox(
                            width: context.width * 0.7,
                            child: CommonButton(
                              onPressed: () {
                                controller.isModify.value = !controller.isModify.value;
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
}
