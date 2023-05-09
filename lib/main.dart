import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/count_provider.dart';
import 'screens/counter.dart';

import 'home_screen.dart';

void main() {
  runApp(const MyApp());
  // runApp(
  //   MultiProvider(
  //   providers: [
  //     ChangeNotifierProvider(create: (_) => CountProvider()),
  //   ],
  //   child: const MyApp(),
  // ),
  // )
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CountProvider(),
      child: MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.purple,
            brightness: Brightness.light,
            textTheme: const TextTheme(
              bodyMedium: TextStyle(fontSize: 20, color: Colors.red),
            )),
        home: const Counter(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
