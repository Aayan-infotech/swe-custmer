import 'package:get/get.dart';

class PdfViewerController extends GetxController {

  var filePath  = "";
  var title  = "";

  final count = 0.obs;
  @override
  void onInit() {
    title = Get.arguments["title"];
    filePath = Get.arguments["file"];
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
