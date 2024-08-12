import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(counter: 10, transactionCount: 0)) {
    on<CounterIncreased>(_onCounterIncreased);
    on<CounterReset>(_onResetCounter);
  }

//This is another way to handle the event and send it easier to the "on" call.
  void _onCounterIncreased(CounterIncreased event, Emitter<CounterState> emit) {
    emit(state.copyWith(
        counter: state.counter + event.value,
        transactionCount: state.transactionCount + 1));
  }

  void _onResetCounter(CounterReset event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: 0, transactionCount: state.transactionCount));
  }
}
