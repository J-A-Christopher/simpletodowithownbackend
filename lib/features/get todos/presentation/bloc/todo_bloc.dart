import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:todotest/di/injection.dart';
import 'package:todotest/features/get%20todos/domain/entities/todo_entity.dart';
import 'package:todotest/features/get%20todos/domain/usecases/todo_usecases.dart';

part 'todo_event.dart';
part 'todo_state.dart';

@injectable
class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    final todoUseCases = getIt<TodoUseCases>();
    on<GetTodos>((event, emit) async {
      emit(TodoInitial());
      emit(TodoLoading());
      final todos = await todoUseCases.getTodoUseCase();
      todos.fold((e) => emit(TodoError(error: e.toString())), (todos) {
        emit(TodoLoaded(todoData: todos));
      });
    });
  }
}
