

import 'package:flutter/cupertino.dart';

import 'language_abs.dart';
import 'language_eng.dart';
import 'language_hindi.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<Languages> {

  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'hi'].contains(locale.languageCode);

  @override
  Future<Languages> load(Locale locale) => _load(locale);

  static Future<Languages> _load(Locale locale) async {
    switch (locale.languageCode) {
      case 'en':
        return LanguageEng();
      case 'hi':
        return LanguageHindi();
      default:
        return LanguageEng();
    }
  }

  @override
  bool shouldReload(LocalizationsDelegate<Languages> old) => false;
}