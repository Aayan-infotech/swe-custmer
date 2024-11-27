import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/utils.dart';

import '../../utils/logger_utils.dart';




class LogInterceptor extends Interceptor {
  bool shouldLogBody = true;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    try {
      printAll("-> [${options.method}] || ${options.uri}");

      if (options.headers.isNotEmpty) {
        var headerMsg = "HEADERS ->\n";
        options.headers.forEach((key, v) {
          headerMsg += "                 $key : $v\n";
        });
        printAll(headerMsg);
      }

      if (options.data != null) {
        printAll('BODY ->');
        try {
          printAll(const JsonEncoder.withIndent("    ").convert(options.data));
        } catch (e) {
          e.printError();
          printAll(options.data);
        }
      }
    } catch (e) {
      e.printError;
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    try {
      Alert.logger(runtimeType.toString(), "<- [${response.statusCode}] || ${response.realUri}");

      if (shouldLogBody) {
        Alert.logger(runtimeType.toString(), 'RESPONSE BODY ->');
        String body = "";

        try {
          body = const JsonEncoder.withIndent("  ").convert(response.data);
        } catch (e) {
          e.printError();
          body = response.data;
        }
        printAll(body);
      }
    } catch (e) {
      e.printError();
    }
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    try {
      Alert.logger(runtimeType.toString(), "<- [ERROR] || ${err.requestOptions.uri}");
      Alert.logger(runtimeType.toString(), 'ERR BODY ->\n${err.message}');
    } catch (e) {
      e.printError;
    }

    return super.onError(err, handler);
  }

  void printAll(msg) {
    Alert.logger(runtimeType.toString(), msg);

    // msg.toString().split('\n').forEach(print);
  }
}