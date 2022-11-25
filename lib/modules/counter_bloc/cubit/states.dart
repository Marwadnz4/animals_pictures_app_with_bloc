abstract class CounterStates{}

class CounterInitialState extends CounterStates{}

class CounterMinus extends CounterStates{
  final int counter;
  CounterMinus(this.counter);
}

class CounterPlus extends CounterStates{
  final int counter;
  CounterPlus(this.counter);
}