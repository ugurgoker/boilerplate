import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class AppStrings {
  static const String translationsPath = 'assets/translations';
  static const List<Locale> supportedLocales = [Locale('tr', 'TR'), Locale('en', 'US')];

  final String appName = 'appName'.tr();
  final String ok = 'ok'.tr();
  final String cancel = 'cancel'.tr();
}
