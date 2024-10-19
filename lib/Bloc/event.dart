part of 'bloc.dart';

abstract class CounterEvent {}
class onPasswordChsk extends CounterEvent{
  var password ;
  onPasswordChsk(this.password);
}