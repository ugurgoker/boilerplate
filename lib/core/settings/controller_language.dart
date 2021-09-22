import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../utils/general_data.dart';
import '../resources/strings.dart';
import '../enums/enum_app.dart';

class LanguageController {
  static AppLanguage currentAppLanguage = AppLanguage.tr;
  static String currentAppLanguageString = AppStrings.supportedLocales.first.toString();

  static void setLanguage({required BuildContext context, required AppLanguage language}) {
    currentAppLanguage = language;
    int index;
    //indexler supportedLocales içindeki sıraya göreye verildi.
    switch (language) {
      case AppLanguage.tr:
        currentAppLanguageString = 'tr-TR';
        index = 0;
        break;
      case AppLanguage.en:
        currentAppLanguageString = 'en-US';
        index = 1;
        break;
      default:
        currentAppLanguageString = 'tr-TR';
        index = 0;
        break;
    }
    if(currentAppLanguageString != EasyLocalization.of(context)!.currentLocale!.toLanguageTag()) {
      EasyLocalization.of(context)!.setLocale(AppStrings.supportedLocales[index]);
    }
    GeneralData.setLanguage(currentAppLanguage);
  }
}
