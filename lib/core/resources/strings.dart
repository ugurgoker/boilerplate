import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class AppStrings {
  static const String translationsPath = 'assets/translations';
  static const List<Locale> supportedLocales = [Locale('tr', 'TR'), Locale('en', 'US')];

  final String appName = 'Template Project';
  final String ok = 'ok'.tr();
  final String cancel = 'cancel'.tr();
  final String genericError = 'genericError'.tr();
  final String networkError = 'networkError'.tr();
  final String connectionTimeOut = 'connectionTimeOut'.tr();
  final String accessStoragePermission = 'accessStoragePermission'.tr();
  final String accessCameraPermission = 'accessCameraPermission'.tr();
  final String accessGalleryPermission = 'accessGalleryPermission'.tr();
  final String accessLocationPermission = 'accessLocationPermission'.tr();
}
