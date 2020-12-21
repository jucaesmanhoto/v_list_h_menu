import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:twin_list_views/app/app_controller.dart';
import 'package:twin_list_views/app/app_widget.dart';
import 'package:twin_list_views/app/twin_lists/twin_lists_module.dart';
import 'package:twin_list_views/app/twin_lists/twin_lists_page.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [Bind((i) => AppController())];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.initialRoute,
          module: TwinListsModule(),
        ),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
