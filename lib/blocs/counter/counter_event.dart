part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}
class IncreamentValueEvent extends CounterEvent{}
class DecreamentValueEvent extends CounterEvent{}
class ResetValueEvent extends CounterEvent{}