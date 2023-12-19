part of 'todo_bloc.dart';

class TodoState extends Equatable {
  const TodoState();
  
  @override
  List<Object> get props => [];
}

class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

class TodoLoaded extends TodoState {
  final List<Todos> todoData;
  const TodoLoaded({required this.todoData});
   @override
  List<Object> get props => [todoData];

}

class TodoError extends TodoState {
  final String error;
  const TodoError({required this.error});

   @override
  List<Object> get props => [error];

}
