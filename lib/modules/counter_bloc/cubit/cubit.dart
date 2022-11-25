import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/modules/counter_bloc/cubit/states.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(CounterInitialState());

  // to be more easily when use this cubit in many places
  static CounterCubit get(context) => BlocProvider.of(context);

  int counter = 1;

  void minus() {
    counter--;
    emit(CounterMinus(counter));
  }

  void plus() {
    counter++;
    emit(CounterPlus(counter));
  }
}
