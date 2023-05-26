import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/colors.dart';
import '../blocs/todo_bloc.dart';
import '../blocs/todo_events.dart';
import '../blocs/todo_state.dart';
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
              Expanded(
                child: BlocBuilder<TodoBloc, TodoState>(
                    bloc: bloc,
                    builder: (context, state) {
                      if (state is TodoListInitialState) {
                        return const Center(
                          child: Text('Add a Todo'),
                        );
                      } else if (state is TodoSuccessState) {
                        return TabBarView(
                          children: [
                            ListView.builder(
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: Checkbox(
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                            4,
                                          ),
                                        ),
                                      ),
                                      fillColor: MaterialStateColor.resolveWith(
                                          (states) => secondaryColor),
                                      value: true,
                                      onChanged: (value) {}),
                                  title: const Text('Teste'),
                                );
                              },
                            ),
                            ListView.builder(
                              itemCount: state.todos.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: Checkbox(
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
                            ),
                            ListView.builder(
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: Checkbox(
                                      value: true, onChanged: (value) {}),
                                  title: const Text('Teste'),
                                );
                              },
                            ),
                          ],
                        );
                      }
                      return const SizedBox();
                    }),
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
