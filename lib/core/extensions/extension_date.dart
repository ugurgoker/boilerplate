import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../core/settings/controller_language.dart';

extension ExtensionDateTime on DateTime {
  String montNameAndDay(BuildContext context) {
    return DateFormat('MMMM dd', LanguageController.currentLocale.toLanguageTag()).format(this);
  }

  String dayMonthNameAndYear() {
    return DateFormat('dd MMMM yyyy', LanguageController.currentLocale.toLanguageTag()).format(this);
  }

  String hourAndMinute() {
    return DateFormat('hh:mm', LanguageController.currentLocale.toLanguageTag()).format(this);
  }

  String dayMonthYear() {
    return DateFormat('dd.MM.yyyy', LanguageController.currentLocale.toLanguageTag()).format(this);
  }

  String daydMonth() {
    return DateFormat('dd EEE', LanguageController.currentLocale.toLanguageTag()).format(this);
  }

  bool isWeekend() {
    return weekday == DateTime.saturday || weekday == DateTime.sunday;
  }

  int get weekOfMonth {
    var date = this;
    final firstDayOfTheMonth = DateTime(date.year, date.month, 1);
    int sum = firstDayOfTheMonth.weekday - 1 + date.day;
    if (sum % 7 == 0) {
      return sum ~/ 7;
    } else {
      return sum ~/ 7 + 1;
    }
  }
}
