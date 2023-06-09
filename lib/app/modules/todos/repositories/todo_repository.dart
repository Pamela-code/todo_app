import '../models/todo_model.dart';

class TodoRepository {
  final List<TodoModel> _todos = [];

  List<TodoModel> addTodo(TodoModel todo) {
    _todos.add(todo);
    return _todos;
  }

  List<TodoModel> removeTodo(TodoModel todo) {
    _todos.remove(todo);
    return _todos;
  }

  List<TodoModel> changeTodoStatus(TodoModel todo, int index) {
    _todos[index].done = !_todos[index].done;
    return _todos;
  }
}
