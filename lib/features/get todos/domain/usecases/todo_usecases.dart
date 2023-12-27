import 'package:dartz/dartz.dart';
import 'package:todotest/features/get%20todos/data/repositories/todos_repo.dart';
import 'package:todotest/features/get%20todos/domain/entities/todo_entity.dart';
import 'package:todotest/features/get%20todos/domain/failure/failure.dart';

class TodoUseCases{
  final todoUseCase = TodoRepoImpl();
  Future<Either<Failure, List<TodoEntity>>> getTodoUseCase() async{
   return todoUseCase.getTodos();

  }
}