import 'dart:async';

import 'package:get_storage/get_storage.dart';

class Prefs {
  static const String sharedPref = 'swc_customer';
  static const String rememberPref = 'remember_prefs';
  static const String userToken = 'token';
  static const String name = 'name';
  static const String email = 'user_email';
  static const String image = 'user_image';
  static const String id = 'user_id';
  static const String phone = 'phone';
  static const String rememberNode = 'remember_node';
  static const String deviceUuid = 'device_uuid';
  static const String timezone = 'timezone';


  final GetStorage _prefs = GetStorage(sharedPref);
  final GetStorage _rememberPrefs = GetStorage(rememberPref);

  Future<void> init() async {
    await GetStorage.init(sharedPref);
    await GetStorage.init(rememberPref);
  }

  void clear() {
    _prefs.erase();
  }

  void clearRememberMePrefs() {
    _rememberPrefs.erase();
  }

  void removeData(String key) {
    _prefs.remove(key);
  }

  void putData(String key, String value) {
    _prefs.write(key, value);
  }

  String getData(String key) {
    return _prefs.read(key) ?? '';
  }

  String token() {
    return getData(userToken);
  }

  String userName() {
    return getData(name);
  }

  String userId() {
    return getData(id);
  }

  String userEmail() {
    return getData(email);
  }

  String userImage() {
    return getData(image);
  }

}