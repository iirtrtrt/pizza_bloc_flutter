import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza/pizza/bloc/pizza_bloc.dart';
import 'package:pizza/pizza/models/pizza_model.dart';

class FloatingButtons extends StatelessWidget {
  const FloatingButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () {
            context.read<PizzaBloc>().add(AddPizza(pizza: Pizza.pizzas[0]));
          },
          child: const Icon(Icons.local_pizza_outlined),
        ),
        const SizedBox(height: 8),
        FloatingActionButton(
          onPressed: () {
            context.read<PizzaBloc>().add(RemovePizza(pizza: Pizza.pizzas[0]));
          },
          child: const Icon(Icons.remove),
        ),
        const SizedBox(height: 8),
        FloatingActionButton(
          onPressed: () {
            context.read<PizzaBloc>().add(AddPizza(pizza: Pizza.pizzas[1]));
          },
          child: const Icon(Icons.local_pizza_outlined),
        ),
        const SizedBox(height: 8),
        FloatingActionButton(
          onPressed: () {
            context.read<PizzaBloc>().add(RemovePizza(pizza: Pizza.pizzas[1]));
          },
          child: const Icon(Icons.remove),
        ),
      ],
    );
  }
}
