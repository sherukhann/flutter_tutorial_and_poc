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
  final techInput = TextEditingController();
  final technologies = [
    'React js',
    'React Native',
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
        body: Column(
          children: [
            TextField(
              controller: techInput,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    technologies.add(techInput.text);
                  });
                },
                child: const Text('Add')),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  // call item count lenth times, for every item in the list
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(technologies[index]),
                    ),
                  );
                },
                itemCount: technologies.length,
              ),
            ),
          ],
        ));
  }
}
