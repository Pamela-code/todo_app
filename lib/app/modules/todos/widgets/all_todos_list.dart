import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/core/widgets/list_tile_todos_app.dart';

import '../blocs/todo_bloc.dart';
import '../blocs/todo_events.dart';
import '../blocs/todo_state.dart';

class AllTodosList extends StatefulWidget {
  const AllTodosList({super.key});

  @override
  State<AllTodosList> createState() => _AllTodosListState();
}

class _AllTodosListState extends State<AllTodosList> {
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
              return ListTileTodosApp(
                done: state.todos[index].done,
                todoDescription: state.todos[index].description,
                checkOnPressed: () {
                  bloc.add(
                    ChangeStatusTodoEvent(
                      todo: state.todos[index],
                      index: index,
                    ),
                  );
                },
                deleteOnPressed: () {
                  bloc.add(
                    RemoveTodoEvent(
                      todo: state.todos[index],
                    ),
                  );
                },
              );
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
