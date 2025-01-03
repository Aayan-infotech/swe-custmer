import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:southwaltoncarts_customer/app/model/single_item_model.dart';
import 'package:southwaltoncarts_customer/app/network/api_end_points.dart';
import 'package:southwaltoncarts_customer/app/network/repository/dash_repo.dart';
import 'package:southwaltoncarts_customer/app/network/response/HistoryResponse.dart';
import 'package:southwaltoncarts_customer/app/routes/app_pages.dart';
import 'package:southwaltoncarts_customer/app/utils/app_loader_view.dart';
import 'package:southwaltoncarts_customer/app/utils/logger_utils.dart';
import 'package:southwaltoncarts_customer/app/utils/shared_prefs.dart';
import 'package:southwaltoncarts_customer/app/utils/strings.dart';
import 'package:southwaltoncarts_customer/app/utils/utils.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

import '../../../gen/assets.gen.dart';
import '../../../network/response/LatestReservationResponse.dart';

class DashboardController extends GetxController
    with GetSingleTickerProviderStateMixin {
  GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();

  TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();

  final streamController = StreamController<SwipeRefreshState>.broadcast();

  final PageController pageController = PageController();

  late TabController tabController = TabController(vsync: this, length: 3);

  RxInt currentIndex = 1.obs;

  var isLoading = false.obs;
  var isReserveLoading = false.obs;
  var isPageLoaderVisible = false.obs;

  var profileImage = SharedPrefs().userImage().obs;
  var userName = SharedPrefs().userName().obs;
  var userEmail = SharedPrefs().userEmail().obs;

  var page = 1.obs;
  var totalPage = 1;

  //Reservation
  var reservationData = LatestResData().obs;
  var cartName = "".obs;
  var bookingId = "".obs;
  var transId = "".obs;
  var deliveryTime = "".obs;
  var pickUpTime = "".obs;
  var cartImg = "".obs;
  var tagNumber = "".obs;
  var noReservation = false.obs;
  Timer? debounceTimer;

  List<Map<String, String>> status = [
    {
      "icon": Assets.svgIcProgress.path,
      "status": "Pending",
    },
    {
      "icon": Assets.svgIcPending.path,
      "status": "In-progress",
    },
    {
      "icon": Assets.svgIcCheck.path,
      "status": "Completed",
    }
  ];

  final count = 0.obs;

  var mList = [
    SingleItemModel(title: Strings.truckCart, img: Assets.imagesTruck.path),
    SingleItemModel(
        title: Strings.driverDetails, img: Assets.imagesDriver.path),
    SingleItemModel(title: Strings.damageReport, img: Assets.imagesDamage.path)
  ];

  var historyList = RxList<BookingData>();

  // var filteredList = RxList<HistoryData>();

  @override
  void onInit() {
    isLoading.value = true;
    isReserveLoading.value = true;
    getHistory();
    getReservation();
    super.onInit();
  }

  @override
  void onReady() {
    AppLoaderView.loader();
    scrollController.addListener(getMoreData);
    searchController.addListener(searchData);
    super.onReady();
  }

  void logout() {
    SharedPrefs().clear();
    Get.offAllNamed(Routes.WELCOME);
  }

  Future<void> getHistory({int mPage = 1, String search = ""}) async {
    var res = await DashRepo().getHistory(page: mPage, search: search);

    res.when(success: (value) {
      isLoading.value = false;
      isPageLoaderVisible.value = false;
      streamController.sink.add(SwipeRefreshState.hidden);
      totalPage = value.data?.totalPages ?? 1;
      if (mPage == 1) {
        historyList.clear();
      }
      if (value.data?.data?.isNotEmpty ?? false) {
        value.data?.data?.forEach((item) {
          historyList.add(item);
        });
      }
      // filteredList.assignAll(historyList);
    }, error: (error) {
      AppLoaderView.hideLoading();
      isLoading.value = false;
    });
  }

  Future<void> getReservation() async {
    var res = await DashRepo().getLatestReservation();

    res.when(success: (value) {
      isReserveLoading.value = false;
      noReservation.value = false;
      AppLoaderView.hideLoading();
      streamController.sink.add(SwipeRefreshState.hidden);
      if (value.data != null) {
        cartName.value = value.data?.vehicleDetails?.vname ?? "";
        tagNumber.value = value.data?.vehicleDetails?.tagNumber ?? "";
        bookingId.value = value.data?.reservationDetails?.id ?? "";
        if (value.data?.vehicleDetails?.image?.first.isNotEmpty ?? false) {
          cartImg.value = value.data?.vehicleDetails?.image?.first ?? "";
        }
        var pickUpDate = Utils.formatDate(
            date: value.data?.reservationDetails?.pickdate ?? "");
        var dropDate = Utils.formatDate(
            date: value.data?.reservationDetails?.dropdate ?? "");
        transId.value = value.data?.payment?.id ?? "";
        pickUpTime.value = pickUpDate;
        deliveryTime.value = dropDate;
      } else {
        Alert.logger(runtimeType.toString(), "INSIDE NO DATA");
        noReservation.value = true;
      }
    }, error: (error) {
      isReserveLoading.value = false;
      AppLoaderView.hideLoading();
      streamController.sink.add(SwipeRefreshState.hidden);
      noReservation.value = true;
    });
  }

  Future<void> fetchAndSavePdf(String id) async {
    AppLoaderView.loader();

    try {
      final directory = await getTemporaryDirectory();
      final filePath = "${directory.path}/temp.pdf";

      var res = await Dio().download(
        "${ApiEndpoints.invoice}/$id",
        filePath,
        options: Options(responseType: ResponseType.bytes),
      );

      AppLoaderView.hideLoading();
      Get.toNamed(Routes.PDF_VIEWER,
          arguments: {"file": filePath, "title": "Invoice"});
    } catch (e) {
      AppLoaderView.hideLoading();
      Get.rawSnackbar(
          title: "Error",
          message: "Failed to load Invoice, Please try again later!");
    }
  }

  Future<void> getAgreement() async {
    AppLoaderView.loader();
    var res = await DashRepo().getAgreement();
    res.when(success: (val) {
      downloadPdf(val.data?.pdf ?? "");
    }, error: (error) {
      AppLoaderView.hideLoading();
      Get.rawSnackbar(
          title: "Error",
          message: "Failed to load Agreement, Please try again later!");
    });
  }

  Future<String> downloadPdf(String pdfUrl) async {
    try {
      final directory = await getTemporaryDirectory();
      final filePath = "${directory.path}/downloaded_file.pdf";

      // Download the file
      await Dio().download(
        pdfUrl,
        filePath,
        options: Options(responseType: ResponseType.bytes),
      );

      AppLoaderView.hideLoading();
      Get.toNamed(Routes.PDF_VIEWER,
          arguments: {"file": filePath, "title": "Agreement"});
      return filePath;
    } catch (e) {
      AppLoaderView.hideLoading();
      throw Exception("Failed to download PDF: $e");
    }
  }

  void onRefresh() {
    page.value = 1;
    isReserveLoading.value = true;
    getHistory(mPage: page.value);
    getReservation();
  }

  void getMoreData() {
    if (scrollController.position.atEdge &&
        scrollController.position.pixels != 0) {
      if (!isLoading.value && page.value < totalPage) {
        isPageLoaderVisible.value = true;
        page.value++;
        getHistory(mPage: page.value);
      } else {
        isPageLoaderVisible.value = false;
      }
    }
  }

  // void searchData() {
  //   isLoading.value = true;
  //   page.value = 1;
  //
  //   if (searchController.text.isEmpty) {
  //     resetData();
  //   } else {
  //     getHistory(mPage: page.value, search: searchController.text);
  //   }
  // }
  void searchData() {
    if (debounceTimer?.isActive ?? false) debounceTimer!.cancel();
    debounceTimer = Timer(const Duration(milliseconds: 500), () {
      isLoading.value = true;
      page.value = 1;

      if (searchController.text.isEmpty) {
        resetData();
      } else {
        getHistory(mPage: page.value, search: searchController.text);
      }
    });
  }

// Reset to default data
  void resetData() {
    historyList.clear();
    getHistory(mPage: page.value, search: "");
  }
}
