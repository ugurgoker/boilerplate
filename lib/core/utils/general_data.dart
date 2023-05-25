import 'package:hive_flutter/hive_flutter.dart';
import '../../core/models/model_token.dart';

import '../enums/enum_app.dart';
import 'utilities.dart';

class GeneralData {
  static GeneralData? _instance;
  static GeneralData getInstance() => _instance ??= GeneralData();

  final String _spDARKMODE = 'dark_mode';
  final String _spLANGUAGE = 'language';
  final String _spAUTHTOKEN = 'auth_token';
  final String _spFCMTOKEN = 'fcm_token';
  final String _spISCHANGEDFCMTOKEN = 'is_changed_fcm_token';
  final String _spREMEMBERME = 'remember_me';
  final String _spUSERNAME = 'username';

  late Box<dynamic> hive;
  String? notificationLink;

  ModelToken? userData;

  ThemeApperance getDarkMode() => ThemeApperance.values[Utilities.getUserSp(_spDARKMODE, defaultValue: ThemeApperance.dark.index)];
  void setDarkMode(ThemeApperance value) async => Utilities.setUserSp(_spDARKMODE, value.index);

  AppLanguage getLanguage() => AppLanguage.fromId(Utilities.getUserSp(_spLANGUAGE, defaultValue: AppLanguage.locale.id));
  void setLanguage(AppLanguage value) async => Utilities.setUserSp(_spLANGUAGE, value.id);

  String? getFCMToken() => Utilities.getUserSp(_spFCMTOKEN, defaultValue: null);
  void setFCMToken(String value) => Utilities.setUserSp(_spFCMTOKEN, value);

  bool getIsChangedFCMToken() => Utilities.getUserSp(_spISCHANGEDFCMTOKEN, defaultValue: true);
  void setIsChangedFCMToken(bool value) => Utilities.setUserSp(_spISCHANGEDFCMTOKEN, value);

  bool getRememberMe() => Utilities.getUserSp(_spREMEMBERME, defaultValue: true);
  void setRememberMe(bool value) => Utilities.setUserSp(_spREMEMBERME, value);

  String? getAuthToken() => Utilities.getUserSp(_spAUTHTOKEN, defaultValue: null);
  void setAuthToken(String? value) => Utilities.setUserSp(_spAUTHTOKEN, value);
  
  String? getUsername() => Utilities.getUserSp(_spUSERNAME, defaultValue: null);
  void setUsername(String? value) => Utilities.setUserSp(_spUSERNAME, value);
}
