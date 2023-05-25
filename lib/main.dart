import 'dart:async';
import 'package:flutter/material.dart';
import 'core/enums/enum_app.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'core/resources/_r.dart';
import 'core/services/service_notification.dart';
import 'core/services/service_route.dart';
import 'core/settings/controller_language.dart';
import 'core/utils/general_data.dart';
import 'firebase_options.dart';
import 'main.reflectable.dart';
import 'ui/base/base_view.dart';
import 'ui/provider_setup.dart';

Future<void> main() async {
  runZonedGuarded<Future<void>>(
    () async {
      FlavorConfig(
        name: Flavor.prod.value,
        location: BannerLocation.topEnd,
        variables: {
          'baseUrl': '',
          'fileUrl': '',
          'api-key': ''
        },
      );

      initializeReflectable();

      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

      await Hive.initFlutter();
      GeneralData.getInstance().hive = await Hive.openBox(R.string.appName);

      await LanguageController.initialize();
      await ServiceNotification.configure();

      await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: R.color.transparent, systemNavigationBarColor: R.color.transparent));

      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);

      runApp(const MyApp());
    },
    (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack, fatal: true),
  );
}

class MyApp extends StatelessWidget with BaseView {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: Builder(builder: (context) {
        router(context);
        return MaterialApp.router(
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
          routerDelegate: ServiceRoute.routerDelegate,
          routeInformationProvider: ServiceRoute.rootRouter.routeInfoProvider(),
          routeInformationParser: ServiceRoute.rootRouter.defaultRouteParser(),
          builder: (_, router) => router!,
        );
      }),
    );
  }
}
