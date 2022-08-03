import 'dart:convert';
import 'dart:developer';
import 'dart:ui';
import 'package:flutter/services.dart';

import '../enums/enum_app.dart';
import '../models/model_dropdown.dart';
import '../resources/_r.dart';
import '../utils/general_data.dart';

class LanguageController {
  static AppLanguage currentAppLang = AppLanguage.tr;

  static ModelDropdown tr = ModelDropdown(id: AppLanguage.tr.index, title: 'Türkçe');
  static ModelDropdown en = ModelDropdown(id: AppLanguage.en.index, title: 'İngilizce');

  static late Locale currentLocale;
  static late Map<String, dynamic> selectedLocaleJson;

  static late ModelDropdown selectedLang;

  static const String translationsPath = 'assets/translations';
  static const List<Locale> supportedLocales = [Locale('tr', 'TR'), Locale('en', 'US')];

  static Future<void> setLanguage(AppLanguage language) async {
    if(GeneralData.getInstance().getLanguage() != language) {
      currentAppLang = language;
      GeneralData.getInstance().setLanguage(language);
      await initialize();
    }
    R.refreshClass();
    
    log('current language: ${currentLocale.toLanguageTag()}', name: 'LOCALIZATION');
  }

  static Future<void> initialize() async {
    switch (GeneralData.getInstance().getLanguage()) {
      case AppLanguage.en:
        currentLocale = supportedLocales[1];
        currentAppLang = AppLanguage.en;
        await loadLang();
        selectedLang = en;
        break;
      case AppLanguage.tr:
        currentLocale = supportedLocales[0];
        currentAppLang = AppLanguage.tr;
        await loadLang();
        selectedLang = tr;
        break;
      default:
    }
    
    
    log('current language: ${currentLocale.toLanguageTag()}', name: 'LOCALIZATION');
  }

  static Future<void> loadLang() async {
    selectedLocaleJson = jsonDecode(await rootBundle.loadString(translationsPath + '/${currentLocale.toLanguageTag()}.json'));
    en = ModelDropdown(id: AppLanguage.en.index, title: R.string.english);
    tr = ModelDropdown(id: AppLanguage.tr.index, title: R.string.turkish);
  }

  static String getLanguageName() {
    switch (GeneralData.getInstance().getLanguage()) {
      case AppLanguage.tr:
        return R.string.turkish;
      case AppLanguage.en:
        return R.string.english;
      default:
        return R.string.turkish;
    }
  }

  static List<ModelDropdown> getLanguagesForDropdown() {
    return [tr, en];
  }
}
