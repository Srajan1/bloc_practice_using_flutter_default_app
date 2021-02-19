import 'package:bloc_practice/Bloc/counter_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  final _counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo Home Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('The button has been pressed this many times')),
          StreamBuilder(
            initialData: 0,
            stream: _counterBloc.counterStream,
            builder: (context, snapshot) {
              return Text(
                snapshot.data.toString(),
                style: Theme.of(context).textTheme.headline4,
              );
            },
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _counterBloc.eventSink.add(counterActions.increment);
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              _counterBloc.eventSink.add(counterActions.decrement);
            },
            child: Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () {
              _counterBloc.eventSink.add(counterActions.reset);
            },
            child: Icon(Icons.loop),
          )
        ],
      ),
    );
  }
}
