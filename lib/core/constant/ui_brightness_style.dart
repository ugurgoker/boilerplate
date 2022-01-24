import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../resources/_r.dart';

class UIBrightnessStyle {
  static UIBrightnessStyle? _instance;
  static UIBrightnessStyle getInstance() => _instance ??= UIBrightnessStyle();


  SystemUiOverlayStyle dark({Color? statusBarColor, Brightness? statusBarBrightness, Color? systemNavigationBarColor, Brightness? systemNavigationBarBrightness}) => SystemUiOverlayStyle(
    systemNavigationBarColor: systemNavigationBarColor ?? R.color.transparent,
    statusBarColor: statusBarColor ?? R.color.transparent,
    statusBarIconBrightness: statusBarBrightness ?? Brightness.dark,
    systemNavigationBarIconBrightness: systemNavigationBarBrightness ?? Brightness.dark,
    statusBarBrightness: Brightness.light,
  );
  SystemUiOverlayStyle light({Color? statusBarColor, Brightness? statusBarBrightness, Color? systemNavigationBarColor, Brightness? ystemNavigationBarBrightness}) => SystemUiOverlayStyle(
    systemNavigationBarColor: systemNavigationBarColor ?? R.color.transparent,
    statusBarColor: statusBarColor ?? R.color.transparent,
    statusBarIconBrightness: statusBarBrightness ?? Brightness.light,
    systemNavigationBarIconBrightness: ystemNavigationBarBrightness ?? Brightness.light,
    statusBarBrightness: Brightness.dark,
  );
}
