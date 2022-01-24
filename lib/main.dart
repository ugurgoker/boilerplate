import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'core/services/service_json_mapper_context.dart';
import '../provider_setup.dart';
import '../core/resources/strings.dart';

import 'core/resources/_r.dart';
import 'main.reflectable.dart';
import 'core/utils/general_data.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

Future<void> main() async {
  initializeReflectable();
  ServiceJsonMapperContext();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  
  if(!kIsWeb) {
    Hive.init((await getApplicationDocumentsDirectory()).path);
    GeneralData.getInstance().hive = await Hive.openBox('hiveBox');
  }
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: R.color.transparent));
  
  runApp(
    EasyLocalization(
      path: AppStrings.translationsPath,
      supportedLocales: AppStrings.supportedLocales,
      fallbackLocale: AppStrings.supportedLocales.first,
      child: Phoenix(child: const MyApp()),
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
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        routerDelegate: GeneralData.getInstance().routerDelegate,
        routeInformationProvider: GeneralData.rootRouter.routeInfoProvider(),
        routeInformationParser: GeneralData.rootRouter.defaultRouteParser(),
        builder: (_, router) => router!,
      ),
    );
  }
}
