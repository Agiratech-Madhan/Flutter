import 'package:apiexample/models/todomodel.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TodoProvider extends ChangeNotifier {
  bool isLoading = false;
  List<Todo> _todos = [];
  List<Todo> get todos => _todos;

  Future<void> getAllTodos() async {
    isLoading = true;
    notifyListeners();

    final response = await getAll();

    _todos = response;
    isLoading = false;
    notifyListeners();
  }

  Future<List<Todo>> getAll() async {
    const url = 'https://jsonplaceholder.typicode.com/todos';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final todos = json.map((data) {
        return Todo(
          id: data['id'],
          title: data['title'],
          userId: data['userId'],
          completed: data['completed'],
        );
      }).toList();
      return todos;
    }
    return [];
  }
}

// class TodoService {
//   Future<List<Todo>> getAll() async {
//     const url = 'https://jsonplaceholder.typicode.com/todos';
//     final uri = Uri.parse(url);
//     final response = await http.get(uri);
//     if (response.statusCode == 200) {
//       final json = jsonDecode(response.body) as List;
//       final todos = json.map((e) {
//         return Todo(
//           id: e['id'],
//           title: e['title'],
//           userId: e['userId'],
//           completed: e['completed'],
//         );
//       }).toList();
//       return todos;
//     }
//     return [];
//   }
// }
