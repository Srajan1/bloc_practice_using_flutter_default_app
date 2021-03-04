import 'dart:async';

import 'package:bloc/bloc.dart';

enum CounterEvent { Increment, Decrement, Reset }

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0);
  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.Increment:
        yield state + 1;
        break;
      case CounterEvent.Decrement:
        yield state - 1;
        break;
      case CounterEvent.Reset:
        yield 0;
        break;
    }
  }
}
