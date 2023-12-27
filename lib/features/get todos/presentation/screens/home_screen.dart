import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todotest/features/get todos/presentation/bloc/todo_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TodoBloc>().add(GetTodos());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Simple Todo App',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
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
                bool isComleted = false;
                final todoItems = state.todoData;

                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return CheckboxListTile(
                        value: isComleted,
                        onChanged: (value) {
                          isComleted = value ?? true;
                        },
                        title: Text(
                          '${todoItems[index].title}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontFamily: 'San-serif',
                              color: Colors.green),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${todoItems[index].description}',
                              style: const TextStyle(fontSize: 18),
                            ),
                            todoItems[index].completed!.data![0] == 0
                                ? const Text(
                                    'IsCompleted : False',
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 16),
                                  )
                                : const Text('IsCompleted : True',
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 16)),
                          ],
                        ),
                      );
                    },
                    itemCount: todoItems.length,
                  ),
                );
              }

              return const Padding(
                padding: EdgeInsets.only(left: 20.0, top: 300),
                child: Center(
                    child: Text(
                  'No todo available...',
                  style: TextStyle(fontSize: 25),
                )),
              );
            }),
          ),
        ],
      ),
    );
  }
}
