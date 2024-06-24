import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:southwaltoncarts_customer/app/utils/custom_navigation.dart';

import 'app/routes/app_pages.dart';
import 'app/theme/theme.dart';
import 'app/utils/shared_prefs.dart';

Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([Prefs().init()]);


  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   statusBarIconBrightness: Brightness.light,
  //   statusBarBrightness: Brightness.dark,
  //   systemNavigationBarColor: secondary,
  //   systemNavigationBarDividerColor: secondary,
  //   systemNavigationBarIconBrightness: Brightness.dark,
  //   systemNavigationBarContrastEnforced: false,
  //   systemStatusBarContrastEnforced: false,
  // ));


  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  runApp( GetMaterialApp(
    title: "SWC Customer",
    getPages: AppPages.routes,
    initialRoute: AppPages.INITIAL,
    debugShowCheckedModeBanner: false,
    defaultTransition: Transition.cupertino,
    theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.transparent,
        canvasColor: Colors.transparent,
        colorScheme: lightColorScheme),
    navigatorObservers: [CustomNavigatorObserver()],
  ));
}

