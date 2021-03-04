import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_cubit_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counter: 0));

  void increment() => emit(CounterState(counter: state.counter + 1));

  void decrement() => emit(CounterState(counter: state.counter - 1));
}
