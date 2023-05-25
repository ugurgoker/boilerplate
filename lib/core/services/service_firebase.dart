import 'dart:io';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

import '../constants/remote_config_keys.dart';
import '../enums/enum_app.dart';

class ServiceFirebase extends ChangeNotifier {
  late FirebaseAnalytics analytics;
  late FirebaseCrashlytics crashlytics;
  late FirebaseRemoteConfig remoteConfig;

  ServiceFirebase() {
    initialize();
  }

  Future<void> initialize() async {
    analytics = FirebaseAnalytics.instance;
    crashlytics = FirebaseCrashlytics.instance;
    remoteConfig = FirebaseRemoteConfig.instance;
    remoteConfig.ensureInitialized();
    await remoteConfig.fetchAndActivate();
  }

  Future<void> setUserId(String userId) async {
    await analytics.setUserId(id: userId);
    await crashlytics.setUserIdentifier(userId);

    if (FlavorConfig.instance.name == Flavor.prod.value) {
      analytics.setAnalyticsCollectionEnabled(true);
      crashlytics.setCrashlyticsCollectionEnabled(true);
    } else {
      analytics.setAnalyticsCollectionEnabled(false);
      crashlytics.setCrashlyticsCollectionEnabled(false);
    }
  }

  Future<void> logEvent(String name, [Map<String, dynamic>? parameters]) async {
    await analytics.logEvent(
      name: name,
      parameters: parameters,
    );
  }

  Future<void> recordError({dynamic error, StackTrace? stackTrace, String? reason, bool fatal = true}) async {
    await crashlytics.recordError(
      error,
      stackTrace,
      reason: reason,
      fatal: fatal,
    );
  }

  Future<int> getVersionCode() async {
    return remoteConfig.getInt(Platform.isAndroid ? keyAndroidVersionCode : keyIOSVersionCode);
  }

  Future<bool> getIsUpdateRequired() async {
    return remoteConfig.getBool(Platform.isAndroid ? keyAndroidIsUpdateRequired : keyIOSIsUpdateRequired);
  }
}
