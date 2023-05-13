import 'language_abs.dart';

class LanguageEng extends Languages {
  @override
  String get appName => 'Multi-Language';

  @override
  String labelWelcome(String name) => "Welcome $name";

  @override
  String get labelSelectLanguage => "Select Language";

  @override
  String get labelInfo => "This is multi-languages demo application";
}