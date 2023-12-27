import 'package:equatable/equatable.dart';
import 'package:todotest/features/get%20todos/data/models/todo_model.dart';

class TodoEntity extends Equatable{
  final int? id;
   final DateTime? createTime;
   final String? title;
   final String? description;
   final Completed? completed;

  const TodoEntity(
      {this.id, this.createTime, this.title, this.description, this.completed});

        @override
  List<Object?> get props => [id, createTime, title, description, completed];


}