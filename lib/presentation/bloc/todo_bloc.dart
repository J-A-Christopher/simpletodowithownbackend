import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todotest/logic.dart';
import 'package:todotest/models/todo_model.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    on<GetTodos>((event, emit) async{
      try{
      emit(TodoInitial());
      emit(TodoLoading());
      final todos = await TodoLogic().getTodoData();
      emit(TodoLoaded(todoData: todos));
     

      }catch(e){
        emit(TodoError(error: e.toString()));

      }
     
    });
  }
}
