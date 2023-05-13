import 'package:flutter/cupertino.dart';

abstract class Languages {
  static Languages? of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  String get appName;

  String labelWelcome (String name);

  String get labelInfo;

  String get labelSelectLanguage;
}