import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:southwaltoncarts_customer/app/model/single_select_item_model.dart';
import 'package:southwaltoncarts_customer/app/utils/app_loader_view.dart';
import 'package:southwaltoncarts_customer/app/utils/strings.dart';
import 'package:southwaltoncarts_customer/app/utils/utils.dart';

import '../../../network/repository/dash_repo.dart';
import '../../../network/response/LatestReservationResponse.dart';
import '../../../utils/logger_utils.dart';

class AddressController extends GetxController {
  var isModify = false.obs;

  TextEditingController pickUpAddressController = TextEditingController();
  TextEditingController deliveryAddressController = TextEditingController();

  var statusList = [
    SingleSelectItemModel(title: Strings.confirmed, isSelected: true.obs),
    SingleSelectItemModel(title: Strings.notConfirmed, isSelected: false.obs),
    SingleSelectItemModel(title: Strings.completed, isSelected: false.obs)
  ].obs;

  //Reservation
  var reservationData = LatestResData().obs;
  var revId = "".obs;
  var transId = "".obs;
  var deliveryTime = "".obs;
  var pickUpTime = "".obs;
  var deliveryDate = "".obs;
  var pickUpDate = "".obs;
  var pickUpLocation = "".obs;
  var dropLocation = "".obs;
  var cartImg = "".obs;
  var noReservation = false.obs;
  var isReserveLoading = false.obs;

  @override
  void onInit() {
    isReserveLoading.value = true;
    getReservation();
    super.onInit();
  }

  Future<void> getReservation() async {
    var res = await DashRepo().getLatestReservation();
    res.when(success: (value) {
      isReserveLoading.value = false;
      noReservation.value = false;
      if (value.data != null) {
        revId.value = value.data?.reservationDetails?.id ?? "";
        var pickDate = Utils.formatDate(
            date: value.data?.reservationDetails?.pickdate ?? "");
        var dropDate = Utils.formatDate(
            date: value.data?.reservationDetails?.dropdate ?? "");

        var pickTime = Utils.formatDateTime(
            date: value.data?.reservationDetails?.pickdate ?? "");
        var dropTime = Utils.formatDateTime(
            date: value.data?.reservationDetails?.dropdate ?? "");

        pickUpLocation.value = value.data?.reservationDetails?.pickup ?? "";
        dropLocation.value = value.data?.reservationDetails?.drop ?? "";

        transId.value = value.data?.payment?.id ?? "";
        pickUpTime.value = pickTime;
        deliveryTime.value = dropTime;

        pickUpDate.value = pickDate;
        deliveryDate.value = dropDate;
      } else {
        Alert.logger(runtimeType.toString(), "INSIDE NO DATA");
        noReservation.value = true;
      }
    }, error: (error) {
      isReserveLoading.value = false;
      noReservation.value = true;
    });
  }

  Future<void> updateBooking(String id) async {
    var res = await DashRepo().updateReservation(
        reservationId: id,
        pickup: pickUpAddressController.text,
        drop: deliveryAddressController.text,
        pickdate: pickUpDate.value,
        dropdate: deliveryDate.value);

    res.when(success: (value) {
      AppLoaderView.hideLoading();
      AppLoaderView.showAlertDialog(
          title: "Success",
          description: value.message.toString(),
          onPressed: () {
            Get.back();
            isModify.value = false;
            isReserveLoading.value = true;
            getReservation();
          });
    }, error: (error) {
      AppLoaderView.hideLoading();
      AppLoaderView.showErrorDialog(description: error.message);
    });
  }
}
