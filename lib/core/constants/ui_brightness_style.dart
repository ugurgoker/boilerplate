import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../resources/_r.dart';

class UIBrightnessStyle {
  static SystemUiOverlayStyle dark({Color? statusBarColor, Brightness? statusBarBrightness, Color? systemNavigationBarColor, Brightness? systemNavigationBarBrightness}) => SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black.withOpacity(0.002),
    statusBarColor: statusBarColor ?? R.color.transparent,
    statusBarIconBrightness: statusBarBrightness ?? Brightness.dark,
    systemNavigationBarIconBrightness: systemNavigationBarBrightness ?? Brightness.dark,
    statusBarBrightness: Brightness.light,
    systemStatusBarContrastEnforced: true,
  );
  static SystemUiOverlayStyle light({Color? statusBarColor, Brightness? statusBarBrightness, Color? systemNavigationBarColor, Brightness? systemNavigationBarBrightness}) => SystemUiOverlayStyle(
    systemNavigationBarColor: systemNavigationBarColor ?? R.color.transparent,
    statusBarColor: statusBarColor ?? R.color.transparent,
    statusBarIconBrightness: statusBarBrightness ?? Brightness.light,
    systemNavigationBarIconBrightness: systemNavigationBarBrightness ?? Brightness.light,
    statusBarBrightness: Brightness.dark,
    systemStatusBarContrastEnforced: true,
  );
}