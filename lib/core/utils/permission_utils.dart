import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import '../models/model_alert_dialog.dart';
import '../utils/utilities.dart';

class PermissionUtils {


  static Future<bool> accessStoragePermission(BuildContext context) async {
    PermissionStatus permission = await Permission.storage.request();
    if (permission.isDenied) {
      Utilities.alerts.showPlatformAlert(context, ModelAlertDialog(description: 'Lütfen depolama erişimi izni verin'));
    }
    return !permission.isDenied;
  }

  static Future<bool> accessCameraPermission(BuildContext context) async {
    PermissionStatus permission = await Permission.camera.request();
    if (permission.isDenied) {
      Utilities.alerts.showPlatformAlert(context, ModelAlertDialog(description: 'Lütfen kamera erişimi izni verin'));
    }
    return !permission.isDenied;
  }

  static Future<bool> accessGalleryPermission(BuildContext context) async {
    PermissionStatus permission = await Permission.photos.request();
    if (permission.isDenied) {
      Utilities.alerts.showPlatformAlert(context, ModelAlertDialog(description: 'Lütfen galeri erişimi izni verin'));
    }
    return !permission.isDenied;
  }
  
  static Future<bool> accessLocationPermission(BuildContext context) async {
    PermissionStatus permission = await Permission.location.request();
    if (permission.isDenied) {
      Utilities.alerts.showPlatformAlert(context, ModelAlertDialog(description: 'Lütfen konum erişimi izni verin'));
    }
    return !permission.isDenied;
  }
}