import 'package:dartz/dartz.dart';
import 'package:todotest/features/get%20todos/data/datasources/logic.dart';
import 'package:todotest/features/get%20todos/data/exception/exceptions.dart';
import 'package:todotest/features/get%20todos/domain/entities/todo_entity.dart';
import 'package:todotest/features/get%20todos/domain/failure/failure.dart';
import 'package:todotest/features/get%20todos/domain/repositories/todo_repo.dart';

class TodoRepoImpl implements  GetTodoRepo{
    final retrievedTodos = TodoLogic();
  @override
  Future<Either<Failure,List<TodoEntity>>> getTodos() async{
    try{
      final result = await retrievedTodos.getTodoData();
    return right( result);

    } on ServerException catch (_){
      return left(ServerFailure());

    }catch (e){
      return left(GeneralFailure());
    }
    
   
  }
  
}