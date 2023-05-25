import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import '../models/model_alert_dialog.dart';
import '../resources/_r.dart';
import 'utilities.dart';

class AlertUtils {
  static Future<void> showPlatformAlert(BuildContext context, ModelAlertDialog model) async {
    final result = await showAlertDialog(
      context: context,
      title: R.string.appName,
      message: model.description,
      barrierDismissible: model.isDismissible!,
      style: AdaptiveStyle.adaptive,
      actions: model.isActiveCancelButton!
          ? [
              AlertDialogAction(
                label: R.string.cancel,
                key: OkCancelAlertDefaultType.cancel,
                textStyle: TextStyle(color: R.themeColor.halfText),
              ),
              AlertDialogAction(label: R.string.ok, key: OkCancelAlertDefaultType.ok, textStyle: TextStyle(color: R.themeColor.primaryDark))
            ]
          : [AlertDialogAction(label: R.string.ok, key: OkCancelAlertDefaultType.ok, textStyle: TextStyle(color: R.themeColor.primaryDark))],
    );

    if (result == OkCancelAlertDefaultType.ok && model.onPressedButton != null) model.onPressedButton!();
  }

  static Future<void> showCloseAppAlert(BuildContext context, {ModelAlertDialog? model}) async {
    // ignore: unused_result
    await showAlertDialog(
      context: context,
      title: R.string.appName,
      message: model!.description,
      barrierDismissible: false,
      style: AdaptiveStyle.adaptive,
      actions: [AlertDialogAction(label: R.string.ok, key: OkCancelAlertDefaultType.ok, textStyle: TextStyle(color: R.themeColor.primaryDark))],
    );

    try {
      Utilities.openStore();
    } catch (e) {
      log(e.toString(), name: 'STORE LAUNCH ERROR');
    }
    exit(0);
  }

  static void showToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: R.color.black,
      textColor: R.color.white,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static void hideSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

  static void showInSnackBar(GlobalKey<ScaffoldState> scaffoldKey, String value) {
    ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(
      SnackBar(
        content: Text(value),
        showCloseIcon: true,
        closeIconColor: R.color.white,
      ),
    );
  }
}
