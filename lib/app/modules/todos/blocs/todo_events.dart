// ignore_for_file: public_member_api_docs, sort_constructors_first
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

class ChangeStatusTodoEvent extends TodoEvent {
  TodoModel todo;
  int index;

  ChangeStatusTodoEvent({
    required this.todo,
    required this.index,
  });
}
