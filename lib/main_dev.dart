import 'dart:async';

import 'package:flutter/material.dart';

import 'core/enums/enum_app.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/resources/_r.dart';
import 'core/services/service_notification.dart';
import 'core/settings/controller_language.dart';
import 'core/utils/general_data.dart';
import 'firebase_options.dart';
import 'main.dart';
import 'main.reflectable.dart';

Future<void> main() async {
  FlavorConfig(
    name: Flavor.prod.value,
    location: BannerLocation.topEnd,
    variables: {
      'baseUrl': '',
      'fileUrl': '',
      'api-key': '',
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
}
