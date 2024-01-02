part of 'create_todos_bloc.dart';

abstract class CreateTodosState extends Equatable {
  const CreateTodosState();

  @override
  List<Object> get props => [];
}

class CreateTodosInitial extends CreateTodosState {}

class CreateTodosLoading extends CreateTodosState {}

class CreateTodosLoaded extends CreateTodosState {}

class CreateTodosError extends CreateTodosState {
  final String errorMesaage;
  const CreateTodosError({required this.errorMesaage});
}
