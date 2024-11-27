import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:southwaltoncarts_customer/app/network/repository/dash_repo.dart';
import 'package:southwaltoncarts_customer/app/utils/app_loader_view.dart';

import '../../../routes/app_pages.dart';

class AcknowledgmentController extends GetxController {
  var isLast = false.obs;

  final checklist = [
    {
      'text':
          'The rental cart was returned with no new damage during the rental period.',
      'checked': false
    },
    {
      'text': 'The keys have been put back in their dedicated location.',
      'checked': false
    },
    {
      'text':
          'For electric carts, the charging cords provided are either on the cart or connected for charging, and the cart is fully charged.',
      'checked': false
    },
    {'text': 'The cart has been cleaned out and washed off.', 'checked': false},
    {
      'text':
          'The cart was left at the address listed on the rental agreement.',
      'checked': false
    },
    // Items requiring a description if checked
    {
      'text': 'The cart was damaged during the rental period.',
      'checked': false
    },
    {
      'text': 'The keys were not left in the dedicated location.',
      'checked': false
    },
    {
      'text': 'For electric carts, the cords were not left with the cart.',
      'checked': false
    },
    {'text': 'The cart was not cleaned out or washed off.', 'checked': false},
    {
      'text': 'The cart was not left at the address on the rental agreement.',
      'checked': false
    },
  ].obs;

  var ackSelectedItem = RxList<String>();
  var imgList = RxList<File>();
  var dReasonList = RxList<String>();
  var des = "";
  var payId = "";

  @override
  void onInit() {
    var img = Get.arguments['imageList'];
    des = Get.arguments['desc'];
    payId = Get.arguments['payId'];
    var dR = Get.arguments['reasonList'];
    imgList.assignAll(img);
    dReasonList.assignAll(dR);
    super.onInit();
  }

  void updateChecklist(int index, bool value) {
    checklist[index]['checked'] = value;
    if (value) {
      ackSelectedItem.add(checklist[index]['text'].toString());
    } else {
      ackSelectedItem
          .removeWhere((item) => item == checklist[index]['text'].toString());
    }
    checklist.refresh();
  }

  Future<void> damageReport() async {
    AppLoaderView.loader();
    dio.FormData formData = dio.FormData.fromMap({
      'images': imgList.map((file) {
        final fileName = file.path.split('/').last;
        final fileExtension = fileName.split('.').last;
        return dio.MultipartFile.fromFileSync(
          file.path,
          filename: fileName,
          contentType: dio.DioMediaType("image", fileExtension),
        );
      }).toList(),
      'paymentId': payId,
      'DReasons': dReasonList,
      'AReasons': ackSelectedItem,
      'description': des,
    });
    var res = await DashRepo().createDamageReport(mData: formData);

    res.when(success: (value) {
      AppLoaderView.hideLoading();
      AppLoaderView.showAlertDialog(
          title: "Success",
          description: value.message.toString(),
          onPressed: () {
            Get.back();
            Get.offNamedUntil(
                Routes.FEEDBACK, ModalRoute.withName(Routes.DASHBOARD),
                arguments: {"from": "damage"});
          });
    }, error: (error) {
      AppLoaderView.hideLoading();
      AppLoaderView.showErrorDialog(description: error.message.toString());
    });
  }
}
