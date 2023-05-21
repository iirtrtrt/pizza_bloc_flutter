import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza/pizza/bloc/pizza_bloc.dart';
import 'dart:math';
import 'package:pizza/pizza/widgets/floating_buttons.dart';

class PizzaScreen extends StatelessWidget {
  const PizzaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pizza BloC'),
      ),
      floatingActionButton: const FloatingButtons(),
      body: SafeArea(child: Center(
        child: BlocBuilder<PizzaBloc, PizzaState>(
          builder: (context, state) {
            if (state is PizzaInitial) {
              return const CircularProgressIndicator();
            }
            if (state is PizzaLoaded) {
              var random = Random();

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 8),
                  Text(
                    'The number of Pizza: ${state.pizzas.length}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        for (int index = 0;
                            index < state.pizzas.length;
                            index++)
                          AnimatedPositioned(
                              left: random.nextInt(240).toDouble(),
                              top: random.nextInt(360).toDouble(),
                              duration: const Duration(milliseconds: 200),
                              child: SizedBox(
                                height: 124,
                                width: 124,
                                child: state.pizzas[index].image,
                              )),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return const Text('Something went wrong...');
            }
          },
        ),
      )),
    );
  }
}
