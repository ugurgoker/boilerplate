import 'package:flutter/material.dart';

import '../enums/enum_app.dart';
import '../settings/controller_theme.dart';
import '_r.dart';

const _appColor = Color(0xFFF8E71C);

class AppColor {
  final Color transparent = const Color(0x00000000);
  final Color white = const Color(0xFFFFFFFF);
  final Color black = const Color(0xFF000000);
  final Color yellow = const Color(0xFFF8E71C);
  final Color green = const Color(0xFF04B779);
  final Color orange = const Color(0xFFDC6803);
  final Color blue = const Color(0xFF0A84FF);
  final Color red = const Color(0xFFD92D20);
  final Color subtitleGray = const Color(0xFF9C9C9C);
  final Color dateGray = const Color(0xFF747474);

  final MaterialColor primarySwatch = MaterialColor(_appColor.value, const {
    50: _appColor,
    100: _appColor,
    200: _appColor,
    300: _appColor,
    400: _appColor,
    500: _appColor,
    600: _appColor,
    700: _appColor,
    800: _appColor,
    900: _appColor,
  });
}

class AppThemeColor {
  final Color viewBg = _ThemeColor(dark: R.color.white, light: R.color.black).theme;
  final Color primary = _ThemeColor(dark: R.color.yellow, light: R.color.yellow).theme;
  final Color error = _ThemeColor(dark: R.color.red, light: R.color.red).theme;
  final Color success = _ThemeColor(dark: R.color.green, light: R.color.green).theme;
  final Color warning = _ThemeColor(dark: R.color.orange, light: R.color.orange).theme;
  final Color primaryDark = _ThemeColor(dark: R.color.blue, light: R.color.blue).theme;
  final Color halfText = _ThemeColor(dark: R.color.dateGray, light: R.color.dateGray).theme;
}

class _ThemeColor {
  Color light;
  Color dark;

  Color get theme {
    switch (ThemeController.getInstance().currentAppTheme) {
      case ThemeApperance.light:
        return light;
      case ThemeApperance.dark:
        return dark;
      default:
        return light;
    }
  }

  _ThemeColor({required this.dark, required this.light});
}
