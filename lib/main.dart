import 'package:flutter/material.dart';
import 'styles.dart' as cs;
import 'theme.dart';

// method 1  = define in styles and use the function
// method 2 = define in theme and use Theme.of(context).textTheme.displayLarge

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myTheme,
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
        body: Column(children: [
          Text('text 1', style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Colors.yellow)),
          Text('text 2', style: Theme.of(context).textTheme.displaySmall),
          Text('text 3', style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Colors.green)),
          Text('text 4', style: cs.mts11(textColor: Colors.brown, fontWeight: FontWeight.w900)),
        ],),
    );
  }
}
