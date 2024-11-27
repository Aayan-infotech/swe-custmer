import 'package:get/get.dart';
import 'package:southwaltoncarts_customer/app/utils/utils.dart';

import '../../../network/repository/dash_repo.dart';
import '../../../utils/app_loader_view.dart';

class TrackCartController extends GetxController {
  var status = "PENDING".obs;
  var picUpDate = "".obs;
  var dropDate = "".obs;

  @override
  void onInit() {
    getDetail();
    super.onInit();
  }

  @override
  void dispose() {
    getDetail();
    super.dispose();
  }

  @override
  void onReady() {
    AppLoaderView.loader();
    super.onReady();
  }

  Future<void> getDetail() async {
    var res = await DashRepo().getLatestReservation();

    res.when(success: (value) {
      AppLoaderView.hideLoading();

      status.value = value.data?.bookingDetails?.status ?? "";
      var pDate = Utils.formatDate(
          date: value.data?.reservationDetails?.pickdate ?? "");
      var dDate = Utils.formatDate(
          date: value.data?.reservationDetails?.dropdate ?? "");

      picUpDate.value = pDate;
      dropDate.value = dDate;
    }, error: (error) {
      AppLoaderView.hideLoading();
    });
  }
}
