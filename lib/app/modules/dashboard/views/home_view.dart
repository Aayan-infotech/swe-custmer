import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:southwaltoncarts_customer/app/utils/common_button.dart';
import 'package:southwaltoncarts_customer/app/utils/common_text_view.dart';

import '../../../../generated/assets.dart';
import '../../../theme/theme.dart';
import '../../../utils/common_appBar.dart';
import '../../../utils/common_images.dart';
import '../../../utils/constants.dart';
import '../controllers/dashboard_controller.dart';

class HomeView extends GetView<DashboardController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: drawerKey,
      drawer: Container(
        width: context.width*0.76,
        padding: EdgeInsets.only(top: 16),
        height: double.infinity,
        decoration: const BoxDecoration(
          color: primary,
          borderRadius: BorderRadius.only(topRight: Radius.circular(60),bottomRight: Radius.circular(60))
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: const TextSpan(
                        text: "User, ",
                        style: TextStyle(color: onPrimary,
                            fontFamily: mFontFamily,
                            fontSize: 22,
                            fontWeight: FontWeight.w700),
                        children: [
                          TextSpan(text: "\n"),
                          TextSpan(
                              text: "testuser@gmail.com",
                              style: TextStyle(
                                  color: onPrimary,
                                  fontFamily: mFontFamily,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                    const Column(
                      children: [
                        CircleAvatar(
                          minRadius: 24,
                          backgroundColor: onPrimary,
                          child: Icon(Icons.person,size: 24,color: shadow,),
                        ),
                        Card(
                          color: onPrimary,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                Icon(Icons.edit,size: 12,color: primary,),
                                CommonText("Edit",size: 12,color: primary,),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                  _singleItem("History"),
                  _singleItem("History"),
                  _singleItem("History"),
                  _singleItem("History"),
                  _singleItem("History"),



                ],
              ),
            ),
            Positioned(
                left: 232,
                top: 280,
                child: Image.asset(Assets.imagesDrawerBack,)),
            Positioned(
                top: context.height*0.73,
                left: context.width*0.36,
                child: Row(
                  children: [
                    Icon(Icons.logout,size: 24,color: onPrimary,),
                    SizedBox(width: context.width*0.01,),
                    CommonText.extraBold("LOG OUT",size: 22,color: onPrimary,),
                  ],
                ))
          ],
        ),
      ),
      appBar:  CommonAppBar(
        title: 'Hello User!',
        isHome: true,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: SquareSvgImageFromAsset(
              Assets.svgIcBell,
              color: onPrimary,
            ),
          )
        ],
        bgColor: Colors.transparent,
        onBackTap: (){
          drawerKey.currentState?.openDrawer();
        },
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: controller.mList.length,
          itemBuilder: (context, index) {
            var mData = controller.mList[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: onPrimary, borderRadius: BorderRadius.circular(24)),
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
            );
          },
        ),
      ),
    );
  }
  
  Widget _singleItem(String title){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(24)
        ),
         child: CommonText.bold(title,color: onPrimary,size: 18,),
      ),
    ) ;
  }
  
}
