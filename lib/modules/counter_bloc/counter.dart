import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/modules/counter_bloc/cubit/cubit.dart';
import 'package:udemy_flutter/modules/counter_bloc/cubit/states.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterStates>(
        listener: (context, state) {
          if (state is CounterPlus) print('Counter Plus ${state.counter}');
          if (state is CounterMinus) print('Counter Minus ${state.counter}');
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Counter'),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      CounterCubit.get(context).minus();
                    },
                    child: const Text('minus'),
                  ),
                  Text(
                    '${CounterCubit.get(context).counter}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      CounterCubit.get(context).plus();
                    },
                    child: const Text('plus'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
