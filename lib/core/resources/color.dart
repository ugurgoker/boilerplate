import 'package:flutter/material.dart';
import '../enums/enum_app.dart';
import '../settings/controller_theme.dart';

Color get _appColor => const Color(0xFF046EFF);
class AppColor {
  final Color transparent = _ThemeColor(dark: Colors.transparent, light: Colors.transparent).theme;
  final Color white = _ThemeColor(dark: const Color(0xFFFFFFFF), light: const Color(0xFFFFFFFF)).theme;
  final Color black = _ThemeColor(dark: const Color(0xFF000000), light: const Color(0xFF000000)).theme;

  final Color royalBlue = _ThemeColor(dark: const Color(0xFF046EFF), light: const Color(0xFF046EFF)).theme;
  final Color royalBlueHover = _ThemeColor(dark: const Color(0xFF095ED3), light: const Color(0xFF095ED3)).theme;
  final Color royalBlueLight = _ThemeColor(dark: const Color(0xFFE6F1FF), light: const Color(0xFFE6F1FF)).theme;

  final Color orangeJuice = _ThemeColor(dark: const Color(0xFFFFC223), light: const Color(0xFFFFC223)).theme;
  final Color orangeJuiceGradient = _ThemeColor(dark: const Color(0xFFFF7F23), light: const Color(0xFFFF7F23)).theme;
  final Color orangeJuiceHover = _ThemeColor(dark: const Color(0xFFFFAB01), light: const Color(0xFFFFAB01)).theme;
  final Color orangeJuiceLight = _ThemeColor(dark: const Color(0xFFFFF5D9), light: const Color(0xFFFFF5D9)).theme;

  final Color riverGreen = _ThemeColor(dark: const Color(0xFF34C759), light: const Color(0xFF34C759)).theme;
  final Color riverGreenHover = _ThemeColor(dark: const Color(0xFF3E8D3C), light: const Color(0xFF3E8D3C)).theme;
  final Color riverGreenDark = _ThemeColor(dark: const Color(0xFF235622), light: const Color(0xFF235622)).theme;

  final Color danger = _ThemeColor(dark: const Color(0xFFED1B4C), light: const Color(0xFFED1B4C)).theme;
  final Color dangerHover = _ThemeColor(dark: const Color(0xFFCE133F), light: const Color(0xFFCE133F)).theme;
  final Color dangerLight = _ThemeColor(dark: const Color(0xFFFFE4EA), light: const Color(0xFFFFE4EA)).theme;


  final Color midnight = _ThemeColor(dark: const Color(0xFF2F3845), light: const Color(0xFF2F3845)).theme;
  final Color midnightDark = _ThemeColor(dark: const Color(0xFF1C222B), light: const Color(0xFF1C222B)).theme;

  final Color gray = _ThemeColor(dark: const Color(0xFF666666), light: const Color(0xFF666666)).theme;
  final Color grayLight = _ThemeColor(dark: const Color(0xFF999999), light: const Color(0xFF999999)).theme;
  final Color grayLightBlue = _ThemeColor(dark: const Color(0xFFDAE2E9), light: const Color(0xFFDAE2E9)).theme;
  final Color grayLightIce = _ThemeColor(dark: const Color(0xFFF4F7FA), light: const Color(0xFFF4F7FA)).theme;

  final Color purpleDark = _ThemeColor(dark: const Color(0xFF4D2F8C), light: const Color(0xFF4D2F8C)).theme;
  final Color readData = _ThemeColor(dark: const Color(0xFF660099), light: const Color(0xFF660099)).theme;

  final Color goldDark = _ThemeColor(dark: const Color(0xFF694B16), light: const Color(0xFF694B16)).theme;

  final Color silverDark = _ThemeColor(dark: const Color(0xFF535353), light: const Color(0xFF535353)).theme;

  final Color bronzeDark = _ThemeColor(dark: const Color(0xFF593E2F), light: const Color(0xFF593E2F)).theme;

  final Color radicalRed = _ThemeColor(dark: const Color(0xFFFF225D), light: const Color(0xFFFF225D)).theme;
  
  final Color bottomSheetRadiusColor = _ThemeColor(dark: const Color(0xFF858585), light: const Color(0xFF858585)).theme;

  final Color primary = _ThemeColor(dark: _appColor, light: _appColor).theme;
  final MaterialColor primarySwatch = MaterialColor(_appColor.value, { 50: _appColor,  100: _appColor,  200: _appColor, 300: _appColor, 400: _appColor, 500: _appColor, 600: _appColor, 700: _appColor, 800: _appColor, 900: _appColor });
}

class _ThemeColor {
  Color dark;
  Color light;

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