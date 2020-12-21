import 'package:flutter_modular/flutter_modular.dart';
import 'package:twin_list_views/app/mocked_data.dart';
import 'package:twin_list_views/app/twin_lists/twin_lists_page.dart';

class TwinListsModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/',
            child: (_, args) => TwinListsPage(
                  sections: mockedSections,
                ))
      ];
}
