import 'dart:developer' as dev;

import 'package:flutter/foundation.dart';

class Alert {
  static void logger(String runtimeType, String msg) {
    if (kDebugMode) {
      dev.log(msg, name: runtimeType.toString().toUpperCase());
    }
  }
}