import 'package:flutter/material.dart';

import './AboutScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HOME'),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('this is home'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/about', arguments: {'name': 'sssss', 'age': 33});
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const AboutScreen('sheru', 20),
                //   ),
                // );
              },
              child: const Text('go to about page'),
            )
          ],
        ),
      ),
    );
  }
}
