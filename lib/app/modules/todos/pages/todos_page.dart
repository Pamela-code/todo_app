import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/modules/todos/widgets/all_todos_list.dart';
import 'package:todo_app/app/modules/todos/widgets/done_todos_list.dart';
import 'package:todo_app/app/modules/todos/widgets/pending_todos_list.dart';

import '../../../../core/colors.dart';
import '../blocs/todo_bloc.dart';
import '../widgets/add_todo_dialog.dart';

class TodosPage extends StatefulWidget {
  const TodosPage({super.key});

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  late final TodoBloc bloc;

  @override
  void initState() {
    bloc = Modular.get();
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Text('To do list'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                height: 40,
                decoration: const BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      30,
                    ),
                  ),
                ),
                child: TabBar(
                  tabs: const [
                    Text('All'),
                    Text('pending'),
                    Text('done'),
                  ],
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: secondaryColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    AllTodosList(),
                    PendingTodosList(),
                    DoneTodosList()
                  ],
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: primaryColor,
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AddTodoDialog(
                  bloc: bloc,
                );
              },
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
