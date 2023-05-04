import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  static const platform = MethodChannel('myapp/initHaptic');
  // state full widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'help centre',
          ),
          centerTitle: true,
          // backgroundColor: Colors.green,
        ),
        body: Column(
          children: [
            ElevatedButton(onPressed: () async {
              try {
                await platform.invokeMethod('initHelpCentre');
              } on PlatformException catch (e) {
                debugPrint('${e.message}');
              }
            }, child: const Text('Init Help Centre'))
          ],
        ));
  }
}
