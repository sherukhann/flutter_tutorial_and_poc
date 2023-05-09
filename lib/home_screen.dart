import 'package:flutter/material.dart';

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
        body: const Text('learning fluttcdafaserr'));
  }
}