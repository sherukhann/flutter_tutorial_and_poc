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
            bodyMedium: TextStyle(fontSize: 30, color: Colors.red),
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
  var technologies = [
    'React js',
    'React Native',
    'Flutter',
    'React js',
    'React Native',
    'Flutter',
    'React js',
    'React Native',
    'Flutter',
    'React js',
    'React Native',
    'Flutter',
    'Flutter',
    'React js',
    'React Native',
    'Flutter',
    'React js',
    'React Native',
    'Flutter'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Flutter',
          ),
          centerTitle: true,
          // backgroundColor: Colors.green,
        ),
        body: SizedBox(
          height: 400,
          child: ListView(
            children: technologies.map((item) => Card(child: Text(item))).toList(),
          ),
        )
        // body: SingleChildScrollView(
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.stretch,
        //     children: technologies.map((item) => Card(child: Text(item))).toList(),
        //     // children: [
        //     //   Card(
        //     //       child: Padding(
        //     //     padding: const EdgeInsets.all(8.0),
        //     //     child: Text(technologies[0]),
        //     //   )),
        //     //   Card(
        //     //       child: Padding(
        //     //     padding: const EdgeInsets.all(8.0),
        //     //     child: Text(technologies[1]),
        //     //   )),
        //     //   Card(
        //     //       child: Padding(
        //     //     padding: const EdgeInsets.all(8.0),
        //     //     child: Text(technologies[2]),
        //     //   )),
        //     // ],
        //   ),
        // )
      );
  }
}
