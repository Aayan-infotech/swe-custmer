import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../routes/app_pages.dart';
import '../theme/theme.dart';

class CustomNavigatorObserver extends NavigatorObserver {
  void _setSystemUIOverlayStyle(String routeName) {
    if ([
      Routes.SPLASH,
      Routes.WELCOME,
      Routes.LOGIN,
      Routes.FORGOT_PASSWORD,
      Routes.RECOVERY_CODE,
      Routes.CREATE_NEW_PASSWORD
    ].contains(routeName)) {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: onPrimary,
        systemNavigationBarDividerColor: onPrimary,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarContrastEnforced: false,
        systemStatusBarContrastEnforced: false,
      ));
    } else {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: secondary,
        systemNavigationBarDividerColor: secondary,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarContrastEnforced: false,
        systemStatusBarContrastEnforced: false,
      ));
    }
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    _setSystemUIOverlayStyle(route.settings.name ?? '');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    if (previousRoute != null) {
      _setSystemUIOverlayStyle(previousRoute.settings.name ?? '');
    }
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    _setSystemUIOverlayStyle(newRoute?.settings.name ?? '');
  }
}
