import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:southwaltoncarts_customer/app/utils/app_loader_view.dart';

import '../../../network/repository/dash_repo.dart';
import '../../../network/response/LatestReservationResponse.dart';
import '../../../utils/logger_utils.dart';
import '../../../utils/utils.dart';

class DamageReasonController extends GetxController {
  TextEditingController tagController =TextEditingController();

  final checklist = [
    {
      'text': 'The rental cart was returned with no new damage during the rental period.',
      'checked': false,
    },
    {
      'text': 'The keys have been put back in their dedicated location.',
      'checked': false,
    },
    {
      'text': 'For electric carts, the charging cords provided are either on the cart or connected for charging, and the cart is fully charged.',
      'checked': false,
    },
    {
      'text': 'The cart has been cleaned out and washed off.',
      'checked': false,
    },
    {
      'text': 'The cart was left at the address listed on the rental agreement.',
      'checked': false,
    },
  ].obs;


  var reservationData = LatestResData().obs;
  var cartName = "".obs;
  var cartId = "".obs;
  var tagNumber = "".obs;
  var paymentId = "".obs;
  var cartImg = "".obs;
  var pDate = "".obs;
  var dDate = "".obs;


  var imageList = RxList<File>();
  var checkItem = RxList<String>();
var des = "";
  @override
  void onInit() {
    var img = Get.arguments['imageList'];
     des = Get.arguments['des'];
    imageList.assignAll(img);
    Alert.logger(runtimeType.toString(), "Image list size => ${imageList.length}");
    getReservation();
    super.onInit();
  }


  @override
  void dispose() {
    super.dispose();
    tagController.dispose();
  }

  Future<void> getReservation() async {
    var res = await DashRepo().getLatestReservation();

    res.when(success: (value) {
      AppLoaderView.hideLoading();
      if (value.data != null) {
        cartName.value = value.data?.vehicleDetails?.vname ?? "";
       // tagNumber.value = value.data?.vehicleDetails?.tagNumber ?? "";
        cartId.value = value.data?.vehicleDetails?.id ?? "";
        // tagController.text = value.data?.reservationDetails?.id ?? "";
        tagController.text = value.data?.vehicleDetails?.tagNumber ?? "";
        paymentId.value = value.data?.payment?.id ?? "";
        if (value.data?.vehicleDetails?.image?.first.isNotEmpty ?? false) {
          cartImg.value = value.data?.vehicleDetails?.image?.first ?? "";
        }
        var pickUpDate = Utils.formatDamageDate(
             value.data?.reservationDetails?.pickdate ?? "");
        var dropDate = Utils.formatDamageDate(
             value.data?.reservationDetails?.dropdate ?? "");

        dDate.value = dropDate;
        pDate.value = pickUpDate;

      } else {
        Alert.logger(runtimeType.toString(), "INSIDE NO DATA");

      }
    }, error: (error) {
      AppLoaderView.hideLoading();
    });
  }

  void updateChecklist(int index, bool value) {
    checklist[index]['checked'] = value;
    if(value){
      checkItem.add(checklist[index]['text'].toString());
    } else {
      checkItem.removeWhere((item)=> item == checklist[index]['text'].toString());
    }
    checklist.refresh();

    Alert.logger(runtimeType.toString(), "SLECTED ITEM => $checkItem");

  }

  @override
  void onReady() {
    AppLoaderView.loader();
  }
}
