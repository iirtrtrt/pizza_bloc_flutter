import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza/common/layout/base_layout.dart';
import 'package:pizza/common/theme/bloc/theme_bloc.dart';
import 'package:pizza/pizza/bloc/pizza_bloc.dart';
import 'package:pizza/pizza/model/pizza_model.dart';
import 'dart:math';
import 'package:pizza/pizza/widget/floating_buttons.dart';

class PizzaScreen extends StatelessWidget {
  const PizzaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      appBar: AppBar(
        title: const Text('Pizza with Theme BloC'),
      ),
      floatingActionButton: const FloatingButtons(),
      child: Center(
        child: BlocBuilder<PizzaBloc, PizzaState>(
          builder: (context, state) {
            if (state is PizzaInitial) {
              return const CircularProgressIndicator();
            }
            if (state is PizzaLoaded) {
              Random random = Random();

              int numOfPizza0 = 0;
              int numOfPizza1 = 0;
              for (var item in state.pizzas) {
                if (item == Pizza.pizzas[0]) {
                  numOfPizza0++;
                }
                if (item == Pizza.pizzas[1]) {
                  numOfPizza1++;
                }
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 64, vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              context.read<ThemeBloc>().emit(LightTheme());
                            },
                            child: const Text('light')),
                        ElevatedButton(
                            onPressed: () {
                              context.read<ThemeBloc>().emit(DarkTheme());
                            },
                            child: const Text('dark')),
                        ElevatedButton(
                            onPressed: () {
                              context.read<ThemeBloc>().emit(SystemTheme());
                            },
                            child: const Text('system')),
                      ],
                    ),
                  ),
                  const Divider(thickness: 1),
                  Text(
                    'The number of Pizza: ${state.pizzas.length}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(thickness: 1),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 64, vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const Text('Whole Pizza'),
                            Text(numOfPizza0.toString()),
                          ],
                        ),
                        Column(
                          children: [
                            const Text('Slice Pizza'),
                            Text(numOfPizza1.toString()),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Divider(thickness: 1),
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
      ),
    );
  }
}
