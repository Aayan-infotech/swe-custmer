import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:southwaltoncarts_customer/app/utils/custom_navigation.dart';

import 'app/network/networkUtils/api_handler.dart';
import 'app/network/networkUtils/dio_client.dart';
import 'app/routes/app_pages.dart';
import 'app/theme/theme.dart';
import 'app/utils/shared_prefs.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize any asynchronous tasks, such as initializing shared preferences
  await SharedPrefs().init();

  // Configure system settings
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  Get.put(ApiHandler(), tag: "handler", permanent: true);
  Get.put(DioClient().getClient(), tag: "dio_client", permanent: true);

  // Run the application
  runApp(
    GetMaterialApp(
      title: "SWC Customer App",
      getPages: AppPages.routes,
      initialRoute: AppPages.INITIAL,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.transparent,
        canvasColor: Colors.transparent,
        colorScheme: lightColorScheme,
      ),
      // navigatorObservers: [CustomNavigatorObserver()],
    ),
  );
}
