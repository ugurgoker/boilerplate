// import 'package:dart_json_mapper/dart_json_mapper.dart' show JsonMapper;
import 'package:hive/hive.dart';
import '../../core/constant/app_config.dart';
import '../../core/services/service_route.dart';
import '../enums/enum_app.dart';
import 'package:auto_route/auto_route.dart';

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

  ThemeApperance getDarkMode() => ThemeApperance.values[Utilities.getUserSp(_spDARKMODE, defaultValue: ThemeApperance.light.index)];
  void setDarkMode(ThemeApperance value) async => Utilities.setUserSp(_spDARKMODE, value.index);
}
