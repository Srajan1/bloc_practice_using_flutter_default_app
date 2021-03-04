import 'dart:async';

enum CounterAction { Increment, Decrement, Reset }

class CounterBloc {
  int _counter = 0;
  final _stateStreamController = StreamController<int>();
  StreamSink<int> get counterSink => _stateStreamController.sink;
  Stream<int> get counterStream => _stateStreamController.stream;

  final _eventStreamController = StreamController<CounterAction>();
  StreamSink<CounterAction> get eventSink => _eventStreamController.sink;
  Stream<CounterAction> get eventStream => _eventStreamController.stream;

  CounterBloc() {
    eventStream.listen((event) {
      if (event == CounterAction.Increment)
        ++_counter;
      else if (event == CounterAction.Decrement)
        --_counter;
      else
        _counter = 0;
      counterSink.add(_counter);
    });
  }
}
