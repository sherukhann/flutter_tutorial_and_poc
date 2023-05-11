import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/debug/bloc_observer.dart';
import 'package:myapp/repo/products_repo.dart';
import 'bloc/products_bloc.dart';
import 'screens/home_screen.dart';

void main() {
  // Bloc.observer = MyBlocObserver();
  runApp(RepositoryProvider(
    create: (context) => ProductsRepo(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsBloc(ProductsRepo()),
      child: MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.purple,
            brightness: Brightness.light,
            textTheme: const TextTheme(
              bodyMedium: TextStyle(fontSize: 20, color: Colors.red),
            )
        ),
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

