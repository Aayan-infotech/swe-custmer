import 'package:get/get.dart';

import '../controllers/recovery_code_controller.dart';

class RecoveryCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecoveryCodeController>(
      () => RecoveryCodeController(),
    );
  }
}
