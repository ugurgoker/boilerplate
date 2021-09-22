import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../settings/controller_language.dart';

extension ExtensionDateTime on DateTime {
  String montNameAndDay(BuildContext context) {
    return DateFormat('MMMM dd', LanguageController.currentAppLanguageString).format(this);
  }
}
