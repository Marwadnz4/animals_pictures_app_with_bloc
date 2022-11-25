import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:udemy_flutter/bloc_observer.dart';
import 'package:udemy_flutter/modules/container/colored_container.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const ColoredContainer(),
      theme: ThemeData.dark(),
    );
  }
}