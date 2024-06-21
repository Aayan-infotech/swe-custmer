import 'package:get/get.dart';

import '../controllers/acknowledgment_controller.dart';

class AcknowledgmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AcknowledgmentController>(
      () => AcknowledgmentController(),
    );
  }
}
