import 'package:flutter/material.dart';

import '../../../../core/colors.dart';

class TodosPage extends StatefulWidget {
  const TodosPage({super.key});

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
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
                child: TabBarView(children: [
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
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Checkbox(value: true, onChanged: (value) {}),
                        title: const Text('Teste'),
                      );
                    },
                  ),
                  ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Checkbox(value: true, onChanged: (value) {}),
                        title: const Text('Teste'),
                      );
                    },
                  ),
                ]),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: primaryColor,
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
