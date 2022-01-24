import 'package:flutter/material.dart';

class ConstantAppConfig {
  static ConstantAppConfig? _instance;
  static ConstantAppConfig getInstance() => _instance ??= ConstantAppConfig();


  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  String playStoreId = ''; //todo add play store id
  String appStoreId = ''; //todo add app store id
  double listCachedPageCount = 5.0;

  String testImage = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTY_QTYbyN8D0UvQTjQ1C15zBtT9AT5scXE6g&usqp=CAU'; //delete test photo when finishing project
}