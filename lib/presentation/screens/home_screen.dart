import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todotest/presentation/bloc/todo_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test App'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () {
                  context.read<TodoBloc>().add(GetTodos());
                },
                child: const Text('Click me to Retrieve Todoos')),
          ),
          BlocListener<TodoBloc, TodoState>(
            listener: (context, state) {
              if (state is TodoError) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('An error occured try again later...')));
              }
            },
            child: BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
              if (state is TodoLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is TodoLoaded) {
                return Text('${state.todoData.last.completed!.data!.first}');
              }

              return const Text('No todo shown..');
            }),
          ),
        ],
      ),
    );
  }
}
