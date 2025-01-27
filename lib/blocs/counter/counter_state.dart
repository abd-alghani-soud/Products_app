part of 'counter_bloc.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}
class TheValueWasChangedState extends CounterState{
  final int counter ;
  TheValueWasChangedState(this.counter);

}
