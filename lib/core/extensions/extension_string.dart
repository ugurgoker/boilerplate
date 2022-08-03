import 'dart:developer';

import 'package:flutter/material.dart';

import '../../ui/widgets/widgets_text.dart';
import '../resources/_r.dart';
import '../settings/controller_language.dart';

extension ExtensionString on String {
  String firstCharacterUppercase() {
    String value = this;
    return "${value[0].toUpperCase()}${value.substring(1)}";
  }

  String firstCharactersUppercase() {
    String value = this;
    List<String> words = value.split(' ');
    String newString = '';
    for (var i = 0; i < words.length; i++) {
      newString += '${i == 0 ? '':' '}${words[i][0].toUpperCase()}${words[i].substring(1)}';
    }
    return newString;
  }

  String replaceTurkish() {
    String value = this;
    String str = value
        .replaceAll("İ", "i")
        .replaceAll("Ö", "o")
        .replaceAll("Ü", "u")
        .replaceAll("Ş", "s")
        .replaceAll("Ç", "c")
        .replaceAll("Ğ", "g")
        .replaceAll("ı", "i")
        .replaceAll("ö", "o")
        .replaceAll("ü", "u")
        .replaceAll("ş", "s")
        .replaceAll("ç", "c")
        .replaceAll("ğ", "g")
        .replaceAll("I", "i")
        .replaceAll(" ", "");
    return str;
  }

  List<TextSpan> highlightOccurrences(String query, {required Color textColor, Color? boldTextColor, double? fontSize, double? boldFontSize, FontWeight? fontWeight}) {
    String source = this;
    if (query.isEmpty || !source.toLowerCase().contains(query.toLowerCase())) {
      return [
        textSpanBasic(text: source, color: textColor, fontSize: fontSize ?? 14.0, fontWeight: fontWeight)
      ];
    }
    final matches = query.toLowerCase().allMatches(source.toLowerCase());

    int lastMatchEnd = 0;

    final List<TextSpan> children = [];
    for (var i = 0; i < matches.length; i++) {
      final match = matches.elementAt(i);

      if (match.start != lastMatchEnd) {
        children.add(textSpanBasic(
          text: source.substring(lastMatchEnd, match.start),
          color: textColor,
          fontSize: fontSize ?? 14.0, 
          fontWeight: fontWeight,
        ));
      }

      children.add(textSpanBasic(
        text: source.substring(match.start, match.end),
        fontFamily: R.fonts.interBold,
        color: boldTextColor ?? textColor,
        fontSize: boldFontSize ?? 14.0,
        fontWeight: fontWeight,
      ));

      if (i == matches.length - 1 && match.end != source.length) {
        children.add(textSpanBasic(
          text: source.substring(match.end, source.length),
          color: textColor,
          fontSize: fontSize ?? 14.0, 
          fontWeight: fontWeight,
        ));
      }

      lastMatchEnd = match.end;
    }
    return children;
  }

  String tr({Map<String, dynamic>? namedArgs}) {
    String key = this;
    String? text = LanguageController.selectedLocaleJson[key];
    if (text == null) {
      log('[$key] key not found from ${LanguageController.currentLocale.toLanguageTag()}', name: 'LOCALIZATION');
      text = '';
    } else {
      if (namedArgs != null) {
        var keys = namedArgs.keys;
        for (var item in keys) {
          text = text!.replaceFirst('{$item}', namedArgs[item]);
        }
      }
    }
    
    return text!;
  }
}
