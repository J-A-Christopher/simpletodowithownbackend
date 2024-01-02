import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todotest/features/create%20todos/data/model/todoresponse.dart';
import 'package:todotest/features/create%20todos/presentation/bloc/create_todos_bloc.dart';
import 'package:todotest/features/get todos/presentation/bloc/todo_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final formKey = GlobalKey<FormState>();

  String? title = '';
  String? description = '';
  var isCompleted = '';

  @override
  void initState() {
    super.initState();
    context.read<TodoBloc>().add(GetTodos());
  }

  void saveData() {
    formKey.currentState!.save();
    Map<String, dynamic> output = {
      'title': title,
      'description': description,
      'isCompleted': isCompleted
    };
    print(output);
    context.read<CreateTodosBloc>().add(CreateTodo(todoData: output));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Add todo..',
                            style: TextStyle(fontSize: 20),
                          ),
                          TextFormField(
                            decoration:
                                const InputDecoration(hintText: 'Todo Title'),
                            onSaved: (value) {
                              title = value;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                                hintText: 'Todo Description'),
                            onSaved: (value) {
                              description = value;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            decoration:
                                const InputDecoration(hintText: 'Is Completed'),
                            onSaved: (value) {
                              isCompleted = value!;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      )),
                  actions: [
                    TextButton(
                        onPressed: saveData, child: const Text('Submit Todo')),
                    const SizedBox(
                      height: 30,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancel'))
                  ],
                );
              });
          // const TodoFormCreation();
        },
        shape: const CircleBorder(),
        backgroundColor: Colors.green,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
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
