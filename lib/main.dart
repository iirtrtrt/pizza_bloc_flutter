import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza/pizza/bloc/pizza_bloc.dart';
import 'package:pizza/pizza/screens/pizza_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PizzaBloc()..add(LoadPizzaCounter()),
        ),
      ],
      child: MaterialApp(
        title: 'Pizza BLoC',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const PizzaScreen(),
      ),
    );
  }
}
