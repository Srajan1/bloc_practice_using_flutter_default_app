import 'dart:async';

enum counterActions { increment, decrement, reset }

class CounterBloc {
  int counter;
  final _stateStreamController = StreamController<int>();
  StreamSink<int> get counterSink => _stateStreamController.sink;
  Stream<int> get counterStream => _stateStreamController.stream;

  final _eventStreamController = StreamController<counterActions>();
  StreamSink<counterActions> get eventSink => _eventStreamController.sink;
  Stream<counterActions> get eventStream => _eventStreamController.stream;

  CounterBloc() {
    counter = 0;
    eventStream.listen((event) {
      if (event == counterActions.increment) ++counter;
      if (event == counterActions.decrement) --counter;
      if (event == counterActions.reset) counter = 0;
      counterSink.add(counter);
    });
  }

  void dispose() {
    _stateStreamController.close();
    _eventStreamController.close();
  }
}
