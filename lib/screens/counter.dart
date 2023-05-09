import 'package:flutter/material.dart';
import 'package:myapp/provider/count_provider.dart';
import 'package:provider/provider.dart';

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    debugPrint('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('counter example'),
      ),
      body: Center(
        child: Consumer<CountProvider>(
          builder: (context, value, child) {
            return Text(
              value.count.toString(),
              style: const TextStyle(fontSize: 30, color: Colors.red),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setCount();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
