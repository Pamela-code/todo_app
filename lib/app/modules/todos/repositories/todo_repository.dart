class TodoRepository {
  final List<String> _todos = [];

  List<String> addTodo(String todo) {
    _todos.add(todo);
    return _todos;
  }

  List<String> removeTodo(String todo) {
    _todos.remove(todo);
    return _todos;
  }
}
