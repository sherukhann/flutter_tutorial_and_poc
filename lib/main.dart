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
            bodyMedium: TextStyle(fontSize: 20, color: Colors.red),
          )),
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
    final wallpapers = [
      'images/img1.jpg',
      'images/img2.jpg',
      'images/img3.jpg',
      'images/img4.jpg',
      'images/img5.jpg',
      'images/img6.jpg',
      'images/img7.jpeg',
      'images/img8.jpeg',
    ];

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'wallpaper',
          ),
          centerTitle: true,
          // backgroundColor: Colors.green,
        ),
        body: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: ()=>{},
              child: Ink.image(
                image: AssetImage(wallpapers[index]),
                width: MediaQuery.of(context).size.width - 16,
                fit: BoxFit.cover,
              ),
            ),
          ),
          itemCount: wallpapers.length,
        ));
  }
}

//Image.network('http')
//Image.asset('images/img1.jpg');