import 'package:flutter/material.dart';

// https://api.flutter.dev/flutter/material/ThemeData-class.html
// Text style - 15 - 5x3 (body, display, headline, label, title) X (Large, Medium and Small)
// text theme  - https://api.flutter.dev/flutter/material/TextTheme-class.html
ThemeData myTheme = ThemeData(
  primarySwatch: Colors.purple,
  brightness: Brightness.light,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.blueAccent,
    ),
    bodyMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.lightGreen,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.lightBlue,
    ),
    displayLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.blueAccent,
    ),
    displayMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.lightGreen,
    ),
    displaySmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.lightBlue,
    ),
  ),
);


// ThemeData customDarkTheme() {
//   final ThemeData darkTheme = ThemeData.dark();
//   return darkTheme.copyWith(
//     primaryColor: Colors.black38,
//     indicatorColor: Colors.lightBlue,
//     primaryIconTheme: darkTheme.primaryIconTheme.copyWith(
//       color: Colors.green,
//       size: 20,
//     ),
//   );
// }
