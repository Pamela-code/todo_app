abstract class TodoEvent {}

class AddTodoEvent extends TodoEvent {
  String todo;

  AddTodoEvent({
    required this.todo,
  });
}

class RemoveTodoEvent extends TodoEvent {
  String todo;

  RemoveTodoEvent({
    required this.todo,
  });
}
