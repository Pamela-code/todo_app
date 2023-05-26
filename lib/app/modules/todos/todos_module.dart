import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/modules/todos/blocs/todo_bloc.dart';

import 'pages/todos_page.dart';

class TodoModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => TodoBloc()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const TodosPage()),
      ];
}
