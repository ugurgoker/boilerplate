import 'dart:developer';

import 'package:flutter/material.dart';

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
      newString += '${i == 0 ? '' : ' '}${words[i][0].toUpperCase()}${words[i].substring(1)}';
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

  String tr({Map<String, dynamic>? namedArgs}) {
    String key = this;
    String? text = LanguageController.selectedLocaleJson[key];
    if (text == null) {
      log('[$key] key not found from ${LanguageController.currentLocale.toLanguageTag()}', name: 'LOCALIZATION');
      text = key;
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

  bool hasUpperCase() => RegExp(r'[A-Z]').hasMatch(this);
  bool hasLowerCase() => RegExp(r'[a-z]').hasMatch(this);
  bool hasDigit() => RegExp(r'[0-9]').hasMatch(this);
  bool hasSpecialCharacters() => RegExp(r'[!@#\$%\^&\*(),.?":{}|<>]').hasMatch(this);
  bool isValidLength() => (length >= 8);

  Color parseStringToColor() {
    return Color(int.parse('0xFF${replaceAll('#', '')}'));
  }

  String emailToUserName() {
    String emailPrefix = split('@').first;
    if (!emailPrefix.contains('.')) {
      return emailPrefix;
    }
    List<String> userName = emailPrefix.split('.');
    return '${userName.first.capitalize()} ${userName.last.capitalize()}';
  }

  String getEnterpriseName() {
    return split('@').first;
  }

  String capitalize() => '${this[0].toUpperCase()}${substring(1).toLowerCase()}';

  String parseHtmlString() => replaceAll('<br/>', '\n');
}

extension ExtensionNullableString on String? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
  bool isNotNullOrEmpty() => !isNullOrEmpty();
}
