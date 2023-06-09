import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/widgets/list_tile_todos_app.dart';
import '../blocs/todo_bloc.dart';
import '../blocs/todo_events.dart';
import '../blocs/todo_state.dart';

class DoneTodosList extends StatefulWidget {
  const DoneTodosList({super.key});

  @override
  State<DoneTodosList> createState() => _DoneTodosListState();
}

class _DoneTodosListState extends State<DoneTodosList> {
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
              if (state.todos[index].done) {
                return ListTileTodosApp(
                  checkOnPressed: () {
                    bloc.add(
                      ChangeStatusTodoEvent(
                        todo: state.todos[index],
                        index: index,
                      ),
                    );
                  },
                  done: state.todos[index].done,
                  todoDescription: state.todos[index].description,
                  deleteOnPressed: () {
                    bloc.add(
                      RemoveTodoEvent(
                        todo: state.todos[index],
                      ),
                    );
                  },
                );
              }
              return const SizedBox();
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
