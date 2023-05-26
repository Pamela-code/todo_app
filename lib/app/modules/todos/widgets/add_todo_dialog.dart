import 'package:flutter/material.dart';
import 'package:todo_app/app/modules/todos/models/todo_model.dart';
import 'package:todo_app/core/colors.dart';

import '../../../../core/widgets/elevated_button_todo_app.dart';
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
        ElevatedButtonTodoApp(
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
          text: 'Add',
        ),
        ElevatedButtonTodoApp(
          onPressed: () {
            todo.clear();
            Navigator.pop(context);
          },
          text: 'Cancel',
        ),
      ],
    );
  }
}
