import 'dart:io';

import 'package:flutter/material.dart';
import '../../core/services/service_route.gr.dart';

class AppConfig {

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static final RootRouter rootRouter = RootRouter(navigatorKey);

  static String platform = Platform.isAndroid ? 'Android' : 'iOS';
  static String playStoreId = ''; //todo add play store id
  static String appStoreId = ''; //todo add app store id

  static String testImage = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTY_QTYbyN8D0UvQTjQ1C15zBtT9AT5scXE6g&usqp=CAU'; //delete test photo when finishing project
}