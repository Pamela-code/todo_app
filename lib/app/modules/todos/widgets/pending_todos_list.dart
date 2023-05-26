import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/core/colors.dart';

import '../blocs/todo_bloc.dart';
import '../blocs/todo_events.dart';
import '../blocs/todo_state.dart';

class PendingTodosList extends StatefulWidget {
  const PendingTodosList({super.key});

  @override
  State<PendingTodosList> createState() => _PendingTodosListState();
}

class _PendingTodosListState extends State<PendingTodosList> {
  late final TodoBloc bloc;

  @override
  void initState() {
    bloc = Modular.get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is TodoListInitialState) {
          return const Center(
            child: Text('Add a Todo'),
          );
        } else if (state is TodoSuccessState) {
          return ListView.builder(
            itemCount: state.todos.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Checkbox(
                  fillColor: MaterialStateColor.resolveWith(
                      (states) => secondaryColor),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        4,
                      ),
                    ),
                  ),
                  value: true,
                  onChanged: (value) {},
                ),
                title: Text(state.todos[index].description),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.close,
                  ),
                  onPressed: () {
                    bloc.add(
                      RemoveTodoEvent(
                        todo: state.todos[index],
                      ),
                    );
                  },
                ),
              );
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
