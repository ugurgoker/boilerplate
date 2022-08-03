import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'core/enums/enum_app.dart';
import 'core/services/service_json_mapper_context.dart';
import '../provider_setup.dart';
import 'core/resources/_r.dart';
import 'core/settings/controller_language.dart';
import 'core/settings/controller_theme.dart';
import 'core/utils/utilities.dart';
import 'main.reflectable.dart';
import 'core/utils/general_data.dart';

Future<void> main() async {
  
  initializeReflectable();
  ServiceJsonMapperContext();
  WidgetsFlutterBinding.ensureInitialized();
  
  await Hive.initFlutter();
  GeneralData.getInstance().hive = await Hive.openBox('hiveBox');
  
  await LanguageController.initialize();
  await LanguageController.setLanguage(AppLanguage.tr);
  ThemeController.getInstance().getTheme();
  // ServiceNotification.configure();
  
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: R.color.transparent));
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
  
  GeneralData.ipAddress = await Utilities.printIps();
  // GeneralData.macAddress = await GetMac.macAddress;
  
  
  runApp(
    Phoenix(child: const MyApp()),
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
          fontFamily: R.fonts.interRegular,
          primarySwatch: R.color.primarySwatch,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        supportedLocales: LanguageController.supportedLocales,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        routerDelegate: GeneralData.getInstance().routerDelegate,
        routeInformationProvider: GeneralData.rootRouter.routeInfoProvider(),
        routeInformationParser: GeneralData.rootRouter.defaultRouteParser(),
        builder: (_, router) => router!,
      ),
    );
  }
}
