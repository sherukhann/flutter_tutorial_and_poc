import 'package:byjus_ui_core/components/byjus_image.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        brightness: Brightness.light,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 20, color: Colors.red),
        )
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  // state full widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'my first app',
          ),
          centerTitle: true,
          // backgroundColor: Colors.green,
        ),
        body: ByjusNetworkImage(
          "https://static.tllms.com/android/btlav3-new/staging/assets/images/default/calendar/event/completed.svg",
          placeholderBuilder: (context) {
            return Container(
              color: Colors.blue,
              child: const Text('Error Image'),
            );
          },
        ),
    );
  }
}
