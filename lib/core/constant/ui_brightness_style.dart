import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../enums/enum_app.dart';
import '../settings/controller_theme.dart';
import '/core/resources/_r.dart';

class UIBrightnessStyle {
  static UIBrightnessStyle? _instance;
  static UIBrightnessStyle getInstance() => _instance ??= UIBrightnessStyle();

  SystemUiOverlayStyle system({Color? statusBarColor, Brightness? statusBarBrightness, Color? systemNavigationBarColor, Brightness? systemNavigationBarBrightness}) => _ThemeBrightnessStyle(
    light: SystemUiOverlayStyle(
      systemStatusBarContrastEnforced: false,
      systemNavigationBarColor: systemNavigationBarColor ?? R.color.transparent,
      statusBarColor: statusBarColor ?? R.color.transparent,
      statusBarIconBrightness: statusBarBrightness ?? Brightness.dark,
      systemNavigationBarIconBrightness: systemNavigationBarBrightness ?? Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
    dark: SystemUiOverlayStyle(
      systemStatusBarContrastEnforced: false,
      systemNavigationBarColor: systemNavigationBarColor ?? R.color.transparent,
      statusBarColor: statusBarColor ?? R.color.transparent,
      statusBarIconBrightness: statusBarBrightness ?? Brightness.light,
      systemNavigationBarIconBrightness: systemNavigationBarBrightness ?? Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  ).style;


  SystemUiOverlayStyle dark({Color? statusBarColor, Brightness? statusBarBrightness, Color? systemNavigationBarColor, Brightness? systemNavigationBarBrightness}) => SystemUiOverlayStyle(
    systemNavigationBarColor: systemNavigationBarColor ?? R.color.transparent,
    statusBarColor: statusBarColor ?? R.color.transparent,
    statusBarIconBrightness: statusBarBrightness ?? Brightness.dark,
    systemNavigationBarIconBrightness: systemNavigationBarBrightness ?? Brightness.dark,
    statusBarBrightness: Brightness.light,
  );
  SystemUiOverlayStyle light({Color? statusBarColor, Brightness? statusBarBrightness, Color? systemNavigationBarColor, Brightness? systemNavigationBarBrightness}) => SystemUiOverlayStyle(
    systemNavigationBarColor: systemNavigationBarColor ?? R.color.transparent,
    statusBarColor: statusBarColor ?? R.color.transparent,
    statusBarIconBrightness: statusBarBrightness ?? Brightness.light,
    systemNavigationBarIconBrightness: systemNavigationBarBrightness ?? Brightness.light,
    statusBarBrightness: Brightness.dark,
  );

  static void refreshClass() => _instance = null;
}


class _ThemeBrightnessStyle {
  SystemUiOverlayStyle light;
  SystemUiOverlayStyle dark;

  SystemUiOverlayStyle get style {
    switch (ThemeController.getInstance().currentAppTheme) {
      case ThemeApperance.light:
        return light;
      case ThemeApperance.dark:
        return dark;
      default:
        return dark;
    }
  }

  _ThemeBrightnessStyle({required this.dark, required this.light});
}