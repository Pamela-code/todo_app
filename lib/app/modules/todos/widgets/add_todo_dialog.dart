import 'package:flutter/material.dart';
import 'package:todo_app/app/modules/todos/models/todo_model.dart';

import '../blocs/todo_bloc.dart';
import '../blocs/todo_events.dart';

class AddTodoDialog extends StatelessWidget {
  AddTodoDialog({super.key, required this.bloc});
  final TextEditingController todo = TextEditingController();
  final TodoBloc bloc;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('New todo'),
      content: TextField(
        controller: todo,
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            bloc.add(
              AddTodoEvent(
                todo: TodoModel(
                  description: todo.text,
                  done: false,
                ),
              ),
            );
            todo.clear();
            Navigator.pop(context);
          },
          child: const Text('Add'),
        ),
        ElevatedButton(
          onPressed: () {
            todo.clear();
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
