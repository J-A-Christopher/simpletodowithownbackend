import 'package:todotest/features/create%20todos/domain/entities/createTodoEntity.dart';

abstract class CreateTodoRepo {
  Future<TodoResponseEntity> getTodoResponse(Map<String, dynamic> todoData);
}
