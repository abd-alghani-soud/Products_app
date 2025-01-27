import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_code/models/products_model.dart';

// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'counter_event.dart';

part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counter = 0;

  CounterBloc() : super(CounterInitial()) {
    on<CounterEvent>((event, emit) {
      // ignore: unused_local_variable
      ProductsModel products;
      if (event is DecreamentValueEvent) {
        counter -= 1;
        emit(TheValueWasChangedState(counter));
      } else if (event is IncreamentValueEvent) {
        counter += 1;
        emit(TheValueWasChangedState(counter));
      } else if (event is ResetValueEvent) {
        emit(TheValueWasChangedState(counter = 0));
      }
    });
  }
}
