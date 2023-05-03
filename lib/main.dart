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
          primarySwatch: Colors.amber,
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
  List<String> grid = [
    '-',
    '-',
    '-',
    '-',
    '-',
    '-',
    '-',
    '-',
    '-',
  ];
  var currentPlayer = 'X';
  var winner = '';

  void drawxo(i) {
    if (grid[i] == '-' && winner == '') {
      setState(() {
        grid[i] = currentPlayer;
        currentPlayer = (currentPlayer == 'X' ? 'O' : 'X');
      });
      findWinner(grid[i]);
    }
  }

  bool checkMove(i, j, k, sign) {
    return grid[i] == sign && grid[j] == sign && grid[k] == sign;
  }

  void findWinner(currentSign) {
    if (checkMove(0, 1, 2, currentSign) ||
            checkMove(3, 4, 5, currentSign) ||
            checkMove(6, 7, 8, currentSign) || // rows
            checkMove(0, 3, 6, currentSign) ||
            checkMove(1, 4, 7, currentSign) ||
            checkMove(2, 5, 8, currentSign) || // column
            checkMove(0, 4, 8, currentSign) ||
            checkMove(2, 4, 6, currentSign) // diagonal
        ) {
      debugPrint('$currentSign won');
      winner = '$currentSign won';
    }
  }

  void reset() {
    setState(() {
      grid = [
        '-',
        '-',
        '-',
        '-',
        '-',
        '-',
        '-',
        '-',
        '-',
      ];
      winner = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TIC TAC TOE',
        ),
        centerTitle: true,
        // backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              constraints: const BoxConstraints(maxHeight: 400, maxWidth: 400),
              margin: const EdgeInsets.all(10),
              color: Colors.black,
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return Material(
                    color: Colors.amber,
                    child: InkWell(
                      splashColor: Colors.black,
                      onTap: () {
                        drawxo(index);
                      },
                      child: Center(
                        child: Text(
                          grid[index],
                          style: const TextStyle(fontSize: 50),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: grid.length,
              ),
            ),
            ElevatedButton.icon(
              onPressed: reset,
              icon: const Icon(Icons.refresh),
              label: const Text('Reset The Game'),
            ),
            if (winner != '')
              Text(
                winner,
                style: const TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.w700,
                  color: Colors.blue,
                ),
              )
          ],
        ),
      ),
    );
  }
}
