import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import '../core/constant/mapper.dart';
import '../core/constant/app_config.dart';
import '../provider_setup.dart';
import '../core/resources/strings.dart';

import 'core/resources/_r.dart';
import 'core/services/service_route.dart';
import 'main.reflectable.dart';
import 'core/utils/general_data.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

void main() async {
  initializeReflectable();
  JsonMapperContext();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  
  if(!kIsWeb) {
    Hive.init((await getApplicationDocumentsDirectory()).path);
    GeneralData.hive = await Hive.openBox(R.string.appName);
  }
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: R.color.transparent));
  
  runApp(
    EasyLocalization(
      child: Phoenix(child: const MyApp()),
      path: AppStrings.translationsPath,
      supportedLocales: AppStrings.supportedLocales,
      fallbackLocale: AppStrings.supportedLocales.first,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp.router(
        theme: ThemeData(
          fontFamily: R.fonts.regular,
          primarySwatch: R.color.primarySwatch,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        routerDelegate: AutoRouterDelegate(AppConfig.rootRouter, navigatorObservers: () => [MyObserver()]),
        routeInformationProvider: AutoRouteInformationProvider(),
        routeInformationParser: AppConfig.rootRouter.defaultRouteParser(),
        builder: (_, router) => router!,
      ),
    );
  }
}
