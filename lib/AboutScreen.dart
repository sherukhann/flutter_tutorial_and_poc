import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});
  // final String name;
  // final int age;
  
  // const AboutScreen(this.name, this.age, {super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final name = args['name'];
    final age = args['age'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('ABOUT'),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Name: $name age $age'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('go back'),
            )
          ],
        ),
      ),
    );
  }
}
