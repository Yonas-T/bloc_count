import 'package:bloc_test_demo/bloc/test_bloc.dart';
import 'package:bloc_test_demo/bloc/test_event.dart';
import 'package:bloc_test_demo/bloc/test_state.dart';
import 'package:bloc_test_demo/counter.dart';
import 'package:bloc_test_demo/counter_bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_bloc/counter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider(
          create: (context) => CounterBloc(CounterState(count: 0, savedCount: 0)),
          child: const Counter(),
        )
        // BlocProvider(
        //   create: (context) => TestBloc(const TestState(count: 0)),
        //   child: const MyHomePage(title: 'Flutter Demo Home Page'),
        // ),
        );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TestBloc, TestState>(
      listener: (context, state) {
        print(state.count);
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  state.count.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => BlocProvider.of<TestBloc>(context).add(GetDataButtonPressed(count: state.count)),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
