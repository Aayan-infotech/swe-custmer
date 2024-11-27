import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../network/networkUtils/log_interceptor.dart' as logger;
import '../../utils/constants.dart';
import '../../utils/shared_prefs.dart';


class DioClient {
  DioClient() {
    setUpOptions();
  }

  Dio _dio = Dio();

  setUpOptions() async {
    Map<String, String> headerMap = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "platform": Platform.isAndroid ? "android" : "ios",
      "isDebug": kDebugMode.toString(),
    };

    if (SharedPrefs().token().isNotEmpty) {
      headerMap['Authorization'] = "Bearer ${SharedPrefs().token()}";
    }

    var baseOptions = BaseOptions(
      baseUrl: Constants.baseUrl,
      connectTimeout: const Duration(seconds: 30000),
      receiveTimeout: const Duration(seconds: 30000),
      headers: headerMap,
    );
    _dio = Dio(baseOptions);
    _dio.interceptors.add(logger.LogInterceptor());
  }

  Dio getClient() => _dio;
}