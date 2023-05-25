import 'package:bloc/bloc.dart';

import '../repositories/todo_repository.dart';
import 'todo_events.dart';
import 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final _todoRepo = TodoRepository();

  TodoBloc() : super(TodoListInitialState()) {
    on<AddTodoEvent>(
      (event, emit) =>
          emit(TodoSuccessState(todos: _todoRepo.addTodo(event.todo))),
    );

    on<RemoveTodoEvent>(
      (event, emit) =>
          emit(TodoSuccessState(todos: _todoRepo.removeTodo(event.todo))),
    );
  }
}
