

import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

import 'logger_utils.dart';

class Permissions {

  static Future<bool> checkPermissions() async {
     var cameraStatus = await Permission.camera.status;
     PermissionStatus storageStatus;
     if (Platform.isAndroid) {
       DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
       AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
       storageStatus = (androidInfo.version.sdkInt >= 32
           ? await Permission.photos.status
           : await Permission.storage.status);
     } else {
       storageStatus = await Permission.storage.status;
     }

     if (cameraStatus.isDenied || storageStatus.isDenied) {
       Alert.logger("runtimeType", "Permission is denied.");
       return request();
     } else if (cameraStatus.isGranted && storageStatus.isGranted) {
       Alert.logger("runtimeType.toString()", "Permission is already granted.");
       return true;
     } else if (cameraStatus.isPermanentlyDenied ||
         storageStatus.isPermanentlyDenied) {
       Alert.logger("runtimeType.toString()", "Permission is permanently denied");
       return false;
     } else if (cameraStatus.isRestricted || storageStatus.isRestricted) {
       Alert.logger("runtimeType.toString()", "Permission is OS restricted.");
       return false;
     }
     return false;
   }

  static Future<bool> request() async {
     Permission storagePermission;

     if (Platform.isAndroid) {
       DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
       AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
       storagePermission = androidInfo.version.sdkInt > 32
           ? Permission.photos
           : Permission.storage;
     } else {
       storagePermission = Permission.storage;
     }

     var permsAndroid = [Permission.camera, storagePermission];

     for (var permission in permsAndroid) {
       final status = await permission.request();
       if (status == PermissionStatus.permanentlyDenied) {
         await openAppSettings();
       }
     }

     if (Permission.camera == PermissionStatus.granted &&
         Permission.storage == PermissionStatus.granted) {
       return true;
     } else {
       return false;
     }
   }

 }