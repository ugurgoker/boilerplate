import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import '/core/resources/_r.dart';
import '../models/model_alert_dialog.dart';
import '../utils/utilities.dart';

class PermissionUtils {


  static Future<bool> accessStoragePermission(BuildContext context) async {
    PermissionStatus permission = await Permission.storage.request();
    if (permission.isDenied) {
      Utilities.alerts.showPlatformAlert(context, ModelAlertDialog(description: R.string.accessStoragePermission));
    }
    return !permission.isDenied;
  }

  static Future<bool> accessCameraPermission(BuildContext context) async {
    PermissionStatus permission = await Permission.camera.request();
    if (permission.isDenied) {
      Utilities.alerts.showPlatformAlert(context, ModelAlertDialog(description: R.string.accessCameraPermission));
    }
    return !permission.isDenied;
  }

  static Future<bool> accessGalleryPermission(BuildContext context) async {
    PermissionStatus permission = await Permission.photos.request();
    if (permission.isDenied) {
      Utilities.alerts.showPlatformAlert(context, ModelAlertDialog(description: R.string.accessGalleryPermission));
    }
    return !permission.isDenied;
  }
  
  static Future<bool> accessLocationPermission(BuildContext context) async {
    PermissionStatus permission = await Permission.location.request();
    if (permission.isDenied) {
      Utilities.alerts.showPlatformAlert(context, ModelAlertDialog(description: R.string.accessLocationPermission));
    }
    return !permission.isDenied;
  }
}