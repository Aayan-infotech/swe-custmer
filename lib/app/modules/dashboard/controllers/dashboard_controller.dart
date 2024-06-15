  import 'package:flutter/material.dart';
  import 'package:get/get.dart';
  import 'package:southwaltoncarts_customer/app/model/single_item_model.dart';
  import 'package:southwaltoncarts_customer/app/utils/strings.dart';
  import 'package:southwaltoncarts_customer/generated/assets.dart';

  class DashboardController extends GetxController with GetSingleTickerProviderStateMixin {



    final PageController pageController = PageController();

    late TabController tabController = TabController(vsync: this, length: 3);

    RxInt currentIndex = 1.obs;

    final count = 0.obs;

    var mList = [
      SingleItemModel(title: Strings.truckCart, img: Assets.imagesTruck),
      SingleItemModel(title: Strings.driverDetails, img: Assets.imagesDriver),
      SingleItemModel(title: Strings.damageReport, img: Assets.imagesDamage)
    ];


  }
