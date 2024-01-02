// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:todotest/features/get%20todos/data/datasources/logic.dart'
    as _i5;
import 'package:todotest/features/get%20todos/data/repositories/todos_repo.dart'
    as _i4;
import 'package:todotest/features/get%20todos/domain/repositories/todo_repo.dart'
    as _i3;
import 'package:todotest/features/get%20todos/domain/usecases/todo_usecases.dart'
    as _i7;
import 'package:todotest/features/get%20todos/presentation/bloc/todo_bloc.dart'
    as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.GetTodoRepo>(() => _i4.TodoRepoImpl());
    gh.factory<_i5.RemoteTodoDataSource>(() => _i5.TodoLogic());
    gh.factory<_i6.TodoBloc>(() => _i6.TodoBloc());
    gh.factory<_i7.TodoUseCases>(() => _i7.TodoUseCases());
    return this;
  }
}
