import 'language_abs.dart';

class LanguageHindi extends Languages {
  @override
  String get appName => "बहु भाषा";

  @override
  String labelWelcome(String name) => "स्वागत हे $name";

  @override
  String get labelSelectLanguage => "भाषा का चयन करें";

  @override
  String get labelInfo => "यह मल्टी लैंग्वेज डेमो एप्लीकेशन है";
}