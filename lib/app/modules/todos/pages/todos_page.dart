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
                    color: primaryColor,
                  ),
                ),
              ),
              const Expanded(
                child: TabBarView(children: [
                  Text('1'),
                  Text('2'),
                  Text('3'),
                ]),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
