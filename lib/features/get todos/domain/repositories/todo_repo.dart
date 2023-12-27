import 'package:dartz/dartz.dart';
import 'package:todotest/features/get%20todos/domain/entities/todo_entity.dart';
import 'package:todotest/features/get%20todos/domain/failure/failure.dart';

abstract class GetTodoRepo{
  Future<Either<Failure,List<TodoEntity>>> getTodos();
  
}