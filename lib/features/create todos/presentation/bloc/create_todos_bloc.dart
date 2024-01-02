import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todotest/features/create%20todos/data/datasources/datadelivery.dart';

part 'create_todos_event.dart';
part 'create_todos_state.dart';

class CreateTodosBloc extends Bloc<CreateTodosEvent, CreateTodosState> {
  CreateTodosBloc() : super(CreateTodosInitial()) {
    on<CreateTodo>((event, emit) async {
      final res = DataDeliveryImpl();
      try {
        emit(CreateTodosInitial());
        emit(CreateTodosLoading());
        await res.createNewTodo(todoData: event.todoData);
        emit(CreateTodosLoaded());
      } catch (e) {
        print(e.toString());
        emit(CreateTodosError(errorMesaage: e.toString()));
      }
    });
  }
}
