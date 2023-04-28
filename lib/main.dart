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
          )),
      home: const HomePage(),
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
  static const platform = MethodChannel('samples.flutter.dev/battery');
  String batteryLevel = 'UnKnown Battery Level';

  Future<void> getBatteryLevel() async {
    String bl;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      bl = 'Battery Level at $result %.';
    } on PlatformException catch (e) {
      bl = 'Failed to get battery level: ${e.message}';
    }

    setState(() {
      batteryLevel = bl;
    });
  }

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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: getBatteryLevel,
                  child: const Text('Get Battery Level')),
              Text(batteryLevel)
            ],
          ),
        ));
  }
}
