part of 'create_todos_bloc.dart';

abstract class CreateTodosEvent extends Equatable {
  const CreateTodosEvent();

  @override
  List<Object> get props => [];
}

class CreateTodo extends CreateTodosEvent {
  final Map<String, dynamic> todoData;
  const CreateTodo({required this.todoData});
}
