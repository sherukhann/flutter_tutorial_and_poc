import 'package:flutter/material.dart';

class JokesApp extends StatelessWidget {
  const JokesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
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
  var count = 0;
  static const jokes = [
    'Learn programming to understand programming jokes.',
    'Code never lies,comments sometimes do.',
    'You are semicolons to my Statements',
    'Programming is 1% writing code and 99% understanding why its not working',
    'I told him I cound not open jar. He told me to download java',
    'Comparing java and javascript is same as comparing car and carpet',
    'Golden rule of programming - If it works dont touch it.'
  ];

  void incrementCount() {
    setState(() {
      count = count + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'my first app',
          style: TextStyle(
            fontSize: 24,
            color: Colors.yellow,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          // color: Colors.pink,
          border: Border.all(color: Colors.black, width: 3),
          gradient: const LinearGradient(colors: [Colors.pink, Colors.yellow]),
        ),
        child: Text(
          jokes[count % 7],
          style: const TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: incrementCount,
        backgroundColor: Colors.pink,
        child: const Icon(
          Icons.refresh,
          size: 50,
          color: Colors.blue,
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}


/**
 * 
 * button code
 *    Center(
        child: OutlinedButton.icon(
            icon: const Icon(Icons.camera),
            onPressed: () {
              debugPrint('clicked');
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.black,
              // backgroundColor: Colors.black,
              padding: const EdgeInsets.all(10),
              side: const BorderSide(color: Colors.blue, width: 3),
            ),
            label: const Text('my btn'),
            ),
      ),
 */