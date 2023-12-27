import 'package:equatable/equatable.dart';
import '../../domain/entities/todo_entity.dart';

class Todos extends  TodoEntity with EquatableMixin {
  @override
  int? id;
  @override
  DateTime? createTime;
  @override
  String? title;
  @override
  String? description;
  @override
  Completed? completed;

  Todos(
      {this.id, this.createTime, this.title, this.description, this.completed});

  Todos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createTime = json['create_time'];
    title = json['title'];
    description = json['description'];
    completed = json['completed'] != null
        ? Completed.fromJson(json['completed'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['create_time'] = createTime;
    data['title'] = title;
    data['description'] = description;
    if (completed != null) {
      data['completed'] = completed!.toJson();
    }
    return data;
  }
  
}

class Completed {
  String? type;
  List<int>? data;

  Completed({this.type, this.data});

  Completed.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    data = json['data'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['data'] = this.data;
    return data;
  }
}




