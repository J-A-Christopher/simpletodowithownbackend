import 'dart:convert';

import 'package:todotest/features/get todos/data/models/todo_model.dart';
import 'package:http/http.dart' as http;
import 'package:todotest/features/get%20todos/data/exception/exceptions.dart';

abstract class RemoteTodoDataSource {
  Future<List<Todos>> getTodoData();
}

class TodoLogic implements RemoteTodoDataSource {
  @override
  Future<List<Todos>> getTodoData() async {
    final url = Uri.parse('http://10.0.2.2:8080/api/todos');
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      final responseBody = jsonDecode(response.body);
      List<Todos> todos = [];
      for (var todo in responseBody) {
        var todoObject = Todos.fromJson(todo);
        todos.add(todoObject);
      }

      return todos;
    }
  }
}
