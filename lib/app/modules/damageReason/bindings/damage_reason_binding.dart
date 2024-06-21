import 'package:get/get.dart';

import '../controllers/damage_reason_controller.dart';

class DamageReasonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DamageReasonController>(
      () => DamageReasonController(),
    );
  }
}
