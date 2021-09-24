import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

extension ExtensionDateTime on DateTime {
  String montNameAndDay(BuildContext context) {
    return DateFormat('MMMM dd', EasyLocalization.of(context)!.currentLocale!.languageCode).format(this);
  }
}
