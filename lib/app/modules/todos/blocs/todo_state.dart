import 'package:todo_app/app/modules/todos/models/todo_model.dart';

abstract class TodoState {
  final List<TodoModel> todos;

  TodoState({
    required this.todos,
  });
}

class TodoListInitialState extends TodoState {
  TodoListInitialState() : super(todos: []);
}

class TodoSuccessState extends TodoState {
  TodoSuccessState({required List<TodoModel> todos}) : super(todos: todos);
}
