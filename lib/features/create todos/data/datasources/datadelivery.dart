import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todotest/features/create%20todos/data/model/todoresponse.dart';
import 'package:todotest/features/get%20todos/data/exception/exceptions.dart';

abstract class DataDelivery {
  Future<TodoResponse> createNewTodo({required Map<String, dynamic> todoData});
}

class DataDeliveryImpl implements DataDelivery {
  @override
  Future<TodoResponse> createNewTodo(
      {required Map<String, dynamic> todoData}) async {
    const url = 'http://10.0.2.2:8080/api/todos';
    final parsedUri = Uri.parse(url);
    final result = await http.post(parsedUri, body: todoData);
    if (result.statusCode != 200) {
      throw ServerException();
    } else {
      final response = jsonDecode(result.body);
      return TodoResponse.fromJson(response);
    }
  }
}
