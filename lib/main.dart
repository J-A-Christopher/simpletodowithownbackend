import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todotest/utils/bloc_observer.dart';
import 'package:todotest/features/get todos/presentation/bloc/todo_bloc.dart';
import 'package:todotest/features/get todos/presentation/screens/home_screen.dart';

void main() {
  Bloc.observer = AppGlobalBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => TodoBloc(),
        child: const HomeScreen(),
      ),
    );
  }
}
