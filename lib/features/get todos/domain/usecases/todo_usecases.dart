import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:todotest/di/injection.dart';
import 'package:todotest/features/get%20todos/domain/entities/todo_entity.dart';
import 'package:todotest/features/get%20todos/domain/failure/failure.dart';
import 'package:todotest/features/get%20todos/domain/repositories/todo_repo.dart';

@injectable
class TodoUseCases {
  Future<Either<Failure, List<TodoEntity>>> getTodoUseCase() async {
    final todoUseCases = await getIt<GetTodoRepo>().getTodos();
    return todoUseCases;
  }
}
