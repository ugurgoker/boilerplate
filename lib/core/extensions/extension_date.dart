import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../core/settings/controller_language.dart';

extension ExtensionDateTime on DateTime {
  String montNameAndDay(BuildContext context) {
    return DateFormat('MMMM dd', LanguageController.currentLocale.toLanguageTag()).format(this);
  }

  String dayMontNameAndYear() {
    return DateFormat('dd MMMM yyyy', LanguageController.currentLocale.toLanguageTag()).format(this);
  }

  String dateBetween(BuildContext context, DateTime startDate) {
    return '7 gün önce';
  }
}
