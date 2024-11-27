import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:southwaltoncarts_customer/app/network/repository/dash_repo.dart';
import 'package:southwaltoncarts_customer/app/utils/app_loader_view.dart';

class DriverDetailController extends GetxController {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController licenceController = TextEditingController();
  TextEditingController insurancePolicyController = TextEditingController();

  var drivingLicense = "".obs;

  @override
  void onInit() {
    getDetail();
    super.onInit();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    licenceController.dispose();
    emailController.dispose();
    mobileNoController.dispose();
    insurancePolicyController.dispose();
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

      var driver = value.data?.bookingDetails?.customerDrivers;

      if (driver?.isNotEmpty ?? false) {
        drivingLicense.value = driver?.first.dlicense ?? "";
        fullNameController.text = driver?.first.dname ?? "";
        mobileNoController.text = driver?.first.dphone ?? "";
        emailController.text = driver?.first.demail ?? "";
        licenceController.text = "N/A";
        insurancePolicyController.text = "N/A";
      }
    }, error: (error) {
      AppLoaderView.hideLoading();
    });
  }
}
