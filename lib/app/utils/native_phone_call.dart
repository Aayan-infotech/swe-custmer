import 'package:flutter/services.dart';

import 'logger_utils.dart';

class NativeCallService {
  static const platform = MethodChannel('in.aayaninfotech.southwaltoncarts_customer/call');

  // Call method
  static Future<void> makePhoneCall(String phoneNumber) async {
    try {
      await platform.invokeMethod('callNumber', {"phoneNumber": phoneNumber});
    } on PlatformException catch (e) {
      Alert.logger("runtimeType", "Failed to make a call: ${e.message}");
    }
  }
}
