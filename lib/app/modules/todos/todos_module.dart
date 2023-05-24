import 'package:flutter_modular/flutter_modular.dart';

import 'pages/todos_page.dart';

class TodoModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const TodosPage()),
      ];
}
