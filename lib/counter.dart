import 'package:bloc_test_demo/counter_bloc/counter_event.dart';
import 'package:bloc_test_demo/counter_bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_bloc/counter_bloc.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  List<Map<String, dynamic>> items = [
    {'name': 'Cabbage', 'price': 10},
    {'name': 'Cabbage', 'price': 5},
    {'name': 'Cereal', 'price': 2},
    {'name': 'Cereal', 'price': 7},
    {'name': 'Cabbage', 'price': 9}
  ];

  List<Map<String, dynamic>> cabbage = [];
  List<Map<String, dynamic>> cereal = [];

  int price = 0;

  @override
  void initState() {
    items.forEach((e) {
      switch (e['name']) {
        case 'Cabbage':
          cabbage.add(e);
          break;
        case 'Cereal':
          cereal.add(e);
          break;
        default:
      }
    });

    print(cabbage);
    print(cereal);

    cabbage.forEach((element) {
      price = price + element['price'] as int;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Container(
                  child: Text(
                    cabbage.first['name'],
                    style: const TextStyle(fontSize: 32),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Container(
                  child: Text(
                    price.toString(),
                    style: const TextStyle(fontSize: 32),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => BlocProvider.of<CounterBloc>(context)..add(TriggerCountButton(count: state.count)),
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
