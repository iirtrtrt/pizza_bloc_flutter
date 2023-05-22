import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza/common/theme/bloc/theme_bloc.dart';
import 'package:pizza/pizza/bloc/pizza_bloc.dart';
import 'package:pizza/pizza/screen/pizza_screen.dart';
import 'package:pizza/common/theme/color_theme.dart';

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
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Pizza BLoC',
            themeMode: state is LightTheme
                ? ThemeMode.light
                : state is DarkTheme
                    ? ThemeMode.dark
                    : ThemeMode.system,
            theme: ColorTheme.lightTheme,
            darkTheme: ColorTheme.darkTheme,
            home: const PizzaScreen(),
          );
        },
      ),
    );
  }
}
