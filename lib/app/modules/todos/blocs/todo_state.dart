abstract class TodoState {
  final List<String> todos;

  TodoState({
    required this.todos,
  });
}

class TodoListInitialState extends TodoState {
  TodoListInitialState() : super(todos: []);
}

class TodoSuccessState extends TodoState {
  TodoSuccessState({required List<String> todos}) : super(todos: todos);
}
