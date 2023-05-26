import '../models/todo_model.dart';

abstract class TodoEvent {}

class AddTodoEvent extends TodoEvent {
  TodoModel todo;

  AddTodoEvent({
    required this.todo,
  });
}

class RemoveTodoEvent extends TodoEvent {
  TodoModel todo;

  RemoveTodoEvent({
    required this.todo,
  });
}
