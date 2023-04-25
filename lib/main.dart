import 'package:flutter/material.dart';
import './AboutScreen.dart';
import './HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomeScreen(),
      initialRoute: '/',
      routes: {
        '/':(context) => const HomeScreen(),
        '/about':(context) => const AboutScreen(),
      },
    );
  }
}
