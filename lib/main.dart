import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haptik_sdk/InitData.dart';
import 'package:haptik_sdk/SignupData.dart';
import 'package:haptik_sdk/haptik_sdk.dart';

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
  // state full widget
  String _successState = 'Unknown';
  final haptikSdkPlugin = HaptikSdk();
  final initData = InitData();
  final signupData = SignupData();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String successState;
    successState = 'SDK is initialized';
    initData.setPrimaryColor = "#420420";
    initData.setComposerPlaceholder = "flutter_plugin_demo";
    initData.setInitializeLanguage = "en";
    initData.setNoHeader = false;

    // try {
    //   successState =
    //       await haptikSdkPlugin.initializeSDK() ?? 'SDK was not initialized';
    // } on PlatformException {
    //   successState = 'Failed to initialize SDK';
    // }
    setState(() {
      _successState = successState;
    });

    if (!mounted) return;
  }

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
        body: Column(
          children: [
            TextButton(
              onPressed: () async {
                String successState;
                try {
                  successState =
                      await haptikSdkPlugin.launchGuestConversation(initData) ??
                          'Unknown success state';
                } on PlatformException {
                  successState = 'Failed to launch guest conversation';
                }

                setState(() {
                  _successState = successState;
                });
              },
              child: const Text('Signup'),
            ),
            TextButton(
              onPressed: () {
                haptikSdkPlugin.logout();
              },
              child: const Text('Logout'),
            ),
            Text('Running on: $_successState\n')
          ],
        ));
  }
}
