import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:jwt_decode/jwt_decode.dart';
import '../../core/extensions/extension_string.dart';
import '../utils/general_data.dart';
import 'router.gr.dart';
import 'service_route.dart';

class ServiceNotification {
  static const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'boilerplate_channel',
    'Boilerplate High Importance Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.high,
  );
  static var notification = FlutterLocalNotificationsPlugin();

  static Future<void> configure() async {
    await notification.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(channel);
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    var android = const AndroidInitializationSettings('mipmap/ic_launcher');
    var iOS = const DarwinInitializationSettings();
    var initPlatform = InitializationSettings(android: android, iOS: iOS);
    await notification.initialize(
      initPlatform,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );
    FirebaseMessaging.instance.subscribeToTopic('boilerplate');

    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (GeneralData.getInstance().getFCMToken() == null) {
      String token = (await FirebaseMessaging.instance.getToken()) ?? '';
      GeneralData.getInstance().setFCMToken(token);
      GeneralData.getInstance().setIsChangedFCMToken(true);
      log(token, name: 'FCM Token is changed');
    } else {
      log(GeneralData.getInstance().getFCMToken().toString(), name: 'FCM Token');
    }

    FirebaseMessaging.instance.onTokenRefresh.listen((token) {
      GeneralData.getInstance().setFCMToken(token);
      GeneralData.getInstance().setIsChangedFCMToken(true);
      log(token, name: 'FCM Token is changed');
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      showNotification(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      openDetail(message.data['Link'], false);
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      openDetail(initialMessage.data['Link'], true);
    }
  }

  static void onDidReceiveNotificationResponse(NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      openDetail(payload, false);
    }
  }

  @pragma('vm:entry-point')
  static void notificationTapBackground(NotificationResponse notificationResponse) {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      openDetail(payload, true);
    }
  }

  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    openDetail(message.data['Link'], false);
  }

  static void showNotification(RemoteMessage message) {
    RemoteNotification? remoteNotification = message.notification;
    AndroidNotification? android = remoteNotification?.android;
    if (remoteNotification != null && android != null) {
      notification.show(
        remoteNotification.hashCode,
        remoteNotification.title,
        remoteNotification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
          ),
        ),
        payload: message.data['Link'],
      );
    }
  }

  static void openDetail(String? payload, bool isBackground) {
    if (payload != null) {
      if (isBackground) {
        GeneralData.getInstance().notificationLink = payload;
      } else {
        if (GeneralData.getInstance().getAuthToken().isNullOrEmpty() || Jwt.isExpired(GeneralData.getInstance().getAuthToken()!)) {
          if (ServiceRoute.rootRouter.current.name != 'login') {
            ServiceRoute.rootRouter.replaceAll([ViewLoginRoute()]);
          } 
          GeneralData.getInstance().notificationLink = payload;
        } else {
          ServiceRoute.rootRouter.pushNamed(payload);
        }
      }
    }
  }
}
