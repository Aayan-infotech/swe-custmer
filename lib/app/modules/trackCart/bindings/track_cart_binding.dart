import 'package:get/get.dart';

import '../controllers/track_cart_controller.dart';

class TrackCartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrackCartController>(
      () => TrackCartController(),
    );
  }
}
