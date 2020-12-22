import 'package:flutter_modular/flutter_modular.dart';

import 'twin_lists_page.dart';

class TwinListsModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers =>
      [ModularRouter('/', child: (_, args) => TwinListsPage())];
}
