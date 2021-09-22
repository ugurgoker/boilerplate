// import 'package:dart_json_mapper/dart_json_mapper.dart' show JsonMapper;
import 'package:hive/hive.dart';
import '../enums/enum_app.dart';

import 'utilities.dart';

class GeneralData {
  static late Box<dynamic> hive;
  static late DateTime serverTime;
  static late String strServerTime;

  static const String spLANGUAGE = 'language';
  static const String spDARKMODE = 'dark_mode';
  
  static AppLanguage getLanguage() { return AppLanguage.values[Utilities.getUserSp(spLANGUAGE, defaultValue: 0)]; }
  static void setLanguage(AppLanguage language) async { Utilities.setUserSp(spLANGUAGE, language.index);}

  static ThemeApperance getDarkMode() { return ThemeApperance.values[Utilities.getUserSp(spDARKMODE, defaultValue: 0)]; }
  static void setDarkMode(ThemeApperance theme) async { Utilities.setUserSp(spDARKMODE, theme.index); }


}
