// import 'package:dart_json_mapper/dart_json_mapper.dart' show JsonMapper;
import 'package:auto_route/auto_route.dart';
import 'package:hive/hive.dart';
import '/core/constant/app_config.dart';
import '/core/services/service_route.dart';
import '../enums/enum_app.dart';

import 'utilities.dart';

class GeneralData {
  static GeneralData? _instance;
  static GeneralData getInstance() => _instance ??= GeneralData();
  static final RootRouter rootRouter = RootRouter(ConstantAppConfig.getInstance().navigatorKey);


  late Box<dynamic> hive;
  late AutoRouterDelegate routerDelegate = AutoRouterDelegate(rootRouter, navigatorObservers: () => [MyObserver()]);
  late DateTime serverTime;

  final String baseUrl = '';
  final String fileUrl = '';

  final String _spDARKMODE = 'dark_mode';
  final String _spTUTORIAL = 'tutorial';
  final String _spAUTHSTATE = 'auth_state';

  ThemeApperance getDarkMode() => ThemeApperance.values[Utilities.getUserSp(_spDARKMODE, defaultValue: ThemeApperance.light.index)];
  void setDarkMode(ThemeApperance value) async => Utilities.setUserSp(_spDARKMODE, value.index);

  bool getIsViewTutorial() => Utilities.getUserSp(_spTUTORIAL, defaultValue: true);
  void setIsViewTutorial(bool value) => Utilities.setUserSp(_spTUTORIAL, value);

  AuthState getAuthState() => AuthState.values[Utilities.getUserSp(_spAUTHSTATE, defaultValue: AuthState.notAuthenticated.index)];
  void setAuthState(AuthState value) async => Utilities.setUserSp(_spAUTHSTATE, value.index);
}
