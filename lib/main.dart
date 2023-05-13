import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'localization/language_abs.dart';
import 'localization/localizations_delegate.dart';
// import 'localization/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // static void setLocale(BuildContext context, Locale newLocale) {
  //   var state = context.findAncestorStateOfType<_MyAppState>();
  //   // state?.setLocale(newLocale);
  // }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Locale _locale = const Locale('hi', '');

  // void setLocale(Locale locale) {
  //   setState(() {
  //     _locale = locale;
  //   });
  // }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.purple,
          brightness: Brightness.light,
          textTheme: const TextTheme(
            bodyMedium: TextStyle(fontSize: 20, color: Colors.red),
          )),
      title: 'Multi Language',
      locale: _locale,
      home: const HomePage(),
      supportedLocales: const [Locale('en', ''), Locale('hi', '')],
      localizationsDelegates: const [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // localeResolutionCallback: (locale, supportedLocales) {
      //   for (var supportedLocale in supportedLocales) {
      //     if (supportedLocale?.languageCode == locale?.languageCode &&
      //         supportedLocale?.countryCode == locale?.countryCode) {
      //       return supportedLocale;
      //     }
      //   }
      //   return supportedLocales?.first;
      // },
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // state full widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.language,
          color: Colors.white,
        ),
        title: Text("${Languages.of(context)?.appName}"),
      ),
      body: Container(
        margin: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 80,
              ),
              Text(
                "${Languages.of(context)?.labelWelcome('शेरू')}",
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "${Languages.of(context)?.labelInfo}",
                style: const TextStyle(fontSize: 20, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 70,
              ),
              // _createLanguageDropDown()
            ],
          ),
        ),
      ),
    );
  }

  // _createLanguageDropDown() {
  //   return DropdownButton<LanguageData>(
  //     iconSize: 30,
  //     hint: Text("${Languages.of(context)?.labelSelectLanguage}"),
  //     onChanged: (LanguageData? language) {
  //       changeLanguage(context, language?.languageCode);
  //     },
  //     items: LanguageData.languageList()
  //         .map<DropdownMenuItem<LanguageData>>(
  //           (e) => DropdownMenuItem<LanguageData>(
  //             value: e,
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceAround,
  //               children: <Widget>[
  //                 Text(
  //                   e.flag,
  //                   style: const TextStyle(fontSize: 30),
  //                 ),
  //                 Text(e.name)
  //               ],
  //             ),
  //           ),
  //         )
  //         .toList(),
  //   );
  // }
}

// class LanguageData {
//   final String flag;
//   final String name;
//   final String languageCode;
//
//   LanguageData(this.flag, this.name, this.languageCode);
//
//   static List<LanguageData> languageList() {
//     return <LanguageData>[
//       LanguageData("🇺🇸", "English", 'en'),
//       LanguageData("🇮🇳", "हिंदी", 'hi'),
//     ];
//   }
// }
