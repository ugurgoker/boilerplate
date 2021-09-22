import 'package:flutter/material.dart';
import '../enums/enum_app.dart';
import '../settings/controller_theme.dart';

Color get _appColor => const Color(0xFF000000);
class AppColor {
  final Color transparent = _ThemeColor(dark: Colors.transparent, light: Colors.transparent).theme;
  final Color white = _ThemeColor(dark: const Color(0xFFFFFFFF), light: const Color(0xFFFFFFFF)).theme;
  final Color black = _ThemeColor(dark: const Color(0xFF000000), light: const Color(0xFF000000)).theme;


  final Color primary = _ThemeColor(dark: _appColor, light: _appColor).theme;
  final MaterialColor primarySwatch = MaterialColor(_appColor.value, { 50: _appColor,  100: _appColor,  200: _appColor, 300: _appColor, 400: _appColor, 500: _appColor, 600: _appColor, 700: _appColor, 800: _appColor, 900: _appColor });
}

class _ThemeColor {
  Color dark;
  Color light;

  Color get theme {
    switch (ThemeController.currentAppTheme) {
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