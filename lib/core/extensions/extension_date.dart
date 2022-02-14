import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

extension ExtensionDateTime on DateTime {
  String montNameAndDay(BuildContext context) {
    return DateFormat('MMMM dd', EasyLocalization.of(context)!.currentLocale!.languageCode).format(this);
  }

  String dayMontNameAndYear(BuildContext context) {
    return DateFormat('dd MMMM yyyy', EasyLocalization.of(context)!.currentLocale!.languageCode).format(this);
  }

  String dateBetween(BuildContext context, DateTime startDate) {
    return '7 gün önce';
  }
}
