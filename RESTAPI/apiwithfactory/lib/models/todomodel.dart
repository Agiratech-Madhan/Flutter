// ignore_for_file: public_member_api_docs, sort_constructors_first
class Todos {
  List<Todo>? todos;
  Todos({
    this.todos,
  });
  factory Todos.fromJson(List<dynamic> json) {
    List<Todo> todos = List.from(json);
    return Todos(todos: todos);
  }
}

class Todo {
  final int id;
  final int userId;
  final String title;
  final bool completed;

  Todo({
    required this.id,
    required this.title,
    required this.userId,
    required this.completed,
  });
  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
        id: json['id'],
        title: json['title'],
        userId: json['userId'],
        completed: json['completed']);
  }
}
