import 'package:equatable/equatable.dart';

class TodoResponseEntity extends Equatable {
  int? id;
  String? title;
  String? description;
  bool? completed;

  TodoResponseEntity(
      {required this.completed,
      required this.description,
      required this.id,
      required this.title});

  @override
  List<Object?> get props => [id, title, description, completed];
}
