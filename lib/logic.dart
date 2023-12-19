import 'dart:convert';

import 'package:todotest/models/todo_model.dart';
import 'package:http/http.dart' as http;

class TodoLogic {
  Future<List<Todos>> getTodoData() async {
    final url = Uri.parse('http://10.0.2.2:8080/api/todos');
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw Exception();
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
